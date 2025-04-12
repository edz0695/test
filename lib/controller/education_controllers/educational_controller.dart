import 'dart:io';
import 'dart:math';
import 'package:chewie/chewie.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:video_player/video_player.dart';
import '../../core/services/image_picker_service.dart';
import '../../src/src.dart';

class EducationController extends GetxController implements GetxService {
  final VideoService videoService = Get.put(VideoService());

  var filteredTeachers = Rxn<TeacherEduModel>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  final bioController = TextEditingController();
  final designation = TextEditingController();
  final villageController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  final classDuration = TextEditingController();
  final teachingMode = TextEditingController();
  final language = TextEditingController();
  final subject = TextEditingController();
  final fee = TextEditingController();
  var latitude = 0.00.obs;
  var longitude = 0.00.obs;
  RxList<XFile> banners = <XFile>[].obs;
  RxList<XFile> videos = <XFile>[].obs;
  RxList<ChewieController> chewieControllers = <ChewieController>[].obs;

  List<String> classVideos = [];

  var subjects = Rx<SubjectModel?>(null);
  var chapters = Rx<ChapterModel?>(null);
  var shortNotes = Rx<ShortNotesModel?>(null);
  var videoNotes = Rx<VideoNotesModel?>(null);

  RxList<Subject> filteredSubjects = <Subject>[].obs;
  RxList<Chapter> filteredChapter = <Chapter>[].obs;

  var loading = false.obs;
  var isLoadingSubjects = false.obs;
  var isLoadingChapters = false.obs;
  var isLoadingShortNotes = false.obs;
  var isLoadingVideoNotes = false.obs;

  var address = ''.obs;
  var country = ''.obs;
  var city = ''.obs;

  Future<void> getCurrentLocation(bool isProfile) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Current Location", "Location services are disabled.");
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission", "Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Denied",
          "Location permissions are permanently denied. Cannot access location");
      return;
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    latitude.value = position.latitude;
    latitude.value = position.longitude;

    printThis(
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}");

    try {
      final List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemark.isNotEmpty) {
        Placemark place = placemark.first;

        city.value = place.subAdministrativeArea.toString();

        if (isProfile) {
          address.value =
              "${place.name}, ${place.locality}, ${place.administrativeArea}";
          country.value = place.country ?? '';
        } else {
          final loc = await locationFromAddress(place.locality!);

          searchController.text = place.subAdministrativeArea.toString();

          double latitude = loc.first.latitude;
          double longitude = loc.first.longitude;

          distance.value = Geolocator.distanceBetween(
              position.latitude, position.longitude, latitude, longitude);

          Map<String, String> json = {
            "longitude": position.latitude.toString(),
            "latitude": position.longitude.toString(),
            "distance": (Geolocator.distanceBetween(position.latitude,
                        position.longitude, latitude, longitude) /
                    1000)
                .toStringAsFixed(2)
          };
          printThis(
              "LOCATION ${place.subAdministrativeArea} DISTANCE ${(Geolocator.distanceBetween(position.latitude, position.longitude, latitude, longitude) / 1000).toString()}");
          filterTeacherAPI(json);
        }
      }
      update();
    } catch (e) {
      printThis("Error getting placemark: $e");
    }
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  var days = [
    " Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Sartuday"
  ];

  final daysSelected = [].obs;

  Widget buildTimeOfDay({
    required String day,
    required TimeOfDay timeTo,
    required TimeOfDay timeFrom,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  day,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 1.2,
                  color: Colors.blueGrey,
                  style: BorderStyle.solid,
                ),
              ),
              child: GestureDetector(
                onTap: () async {
                  // Show the time range picker
                  TimeRange? result = await showTimeRangePicker(
                    context: context,
                    strokeWidth: 4,
                    ticks: 12,
                    ticksOffset: 2,
                    ticksLength: 8,
                    handlerRadius: 8,
                    ticksColor: Colors.grey,
                    rotateLabels: false,
                    labels: [
                      "24 h",
                      "3 h",
                      "6 h",
                      "9 h",
                      "12 h",
                      "15 h",
                      "18 h",
                      "21 h"
                    ].asMap().entries.map((e) {
                      return ClockLabel.fromIndex(
                          idx: e.key, length: 8, text: e.value);
                    }).toList(),
                    labelOffset: 30,
                    padding: 55,
                    labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    start: timeFrom,
                    end: timeTo,
                    clockRotation: 180.0,
                  );

                  if (result != null) {
                    int dayFoundIndex = daysSelected
                        .indexWhere((element) => element["day"] == day);

                    if (dayFoundIndex != -1) {
                      // Update the list values
                      daysSelected[dayFoundIndex] = {
                        "day": day,
                        "from": result.startTime,
                        "to": result.endTime,
                      };
                    }

                    // Notify updates
                    daysSelected.refresh();
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "add",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("From :", style: TextStyle(fontSize: 17)),
            Text(
              timeFrom.format(context),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("To :", style: TextStyle(fontSize: 17)),
            Text(
              timeTo.format(context),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildDayChip({required String day}) {
    Color getColor() {
      var containsDay = false;
      for (var element in daysSelected) {
        if (element["day"] == day) {
          containsDay = true;
        }
      }
      if (containsDay) {
        return Colors.blueGrey;
      }
      return Color(0xffc2c0c0ff);
    }

    return GestureDetector(
      onTap: () {
        var dayAdded = false;
        var daysSelectedFound =
            <Map<String, dynamic>>[]; // Specify the type of the list elements

        // Iterate through daysSelected list
        for (var element in daysSelected) {
          if (element["day"] == day) {
            // Check if the day is already in daysSelected
            dayAdded = true;
            daysSelectedFound
                .add(element); // If found, add it to daysSelectedFound list
          }
        }
        if (!dayAdded) {
          // Use negation operator directly
          daysSelected.add({
            "day": day,
            "from": TimeOfDay(hour: 8, minute: 20),
            "to": TimeOfDay(hour: 16, minute: 30)
          });
        } else {
          for (var element in daysSelectedFound) {
            daysSelected
                .remove(element); // Remove the found element from daysSelected
          }
        }
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1.2,
            color: Colors.blueGrey,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
            child: Text(
          day,
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        )),
      ),
    );
  }

  Future<void> editProfileAPI(String name, String profile) async {
    loading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final days = daysSelected
        .map((i) => {
              "day": i["day"],
              "start_time":
                  "${i["from"].hour.toString().padLeft(2, '0')}:${i["from"].minute.toString().padLeft(2, '0')}",
              "end_time":
                  "${i["to"].hour.toString().padLeft(2, '0')}:${i["to"].minute.toString().padLeft(2, '0')}"
            })
        .toList();

    String? token = prefs.getString('token');
    if (token == null) {
      printThis("Authorization token not found.");
      return;
    }

    final headers = {'Authorization': 'Bearer $token'};
    const imageUrl = "${AppConstants.sambhavBaseUrl}/files/uploads";
    const videoUrl = "${AppConstants.sambhavBaseUrl}/videos/uploads";

    try {
      // Upload image
      final req = http.MultipartRequest('POST', Uri.parse(imageUrl));
      final video = http.MultipartRequest('POST', Uri.parse(videoUrl));
      req.headers.addAll(headers);
      video.headers.addAll(headers);

      // Add video files to the request
      for (var i in videos) {
        final videoBytes = await File(i.path).readAsBytes();
        video.files.add(http.MultipartFile.fromBytes(
          "videos",
          videoBytes,
          filename: i.path.split('/').last,
          contentType: MediaType('video', 'mp4'),
        ));
      }

      // Add image files to the request
      for (var i in banners) {
        final imageBytes = await File(i.path).readAsBytes();
        req.files.add(http.MultipartFile.fromBytes(
          "images", // Field name matching the backend
          imageBytes,
          filename: i.path.split('/').last, // Get the file name
          contentType: MediaType('image', 'png'), // Set the content type
        ));
      }

      // Send the image request and video request
      final imagesResponse = await req.send();
      final videoResponse = await video.send();

      // Read the responses from the streams
      final videoBody = await videoResponse.stream.bytesToString();
      final imagesBody = await imagesResponse.stream.bytesToString();

      if (imagesResponse.statusCode == 200 && videoResponse.statusCode == 200) {
        // Process the video response

        final videoJsonResponse = jsonDecode(videoBody);

        if (videoJsonResponse['status'] == 'success' &&
            videoJsonResponse['data'] != null) {
          printThis("Uploaded Videos: ${videoJsonResponse['data']}");
        }

        // Process the image response

        final banners = jsonDecode(imagesBody);
        printThis("Uploaded Images: $banners");

        printThis("VIDEOS .................${videos.length}");

        final uploadedVideos = videoJsonResponse['data'];

        final demoVideos = List.generate(uploadedVideos.length, (index) {
          final videoName = videos[index].name; // Get the corresponding name
          final videoUrl = uploadedVideos[index];
          final json = {"title": videoName, "video": videoUrl};
          printThis(json);
          return json;
        });

        final json = {
          "imgId":
              "1734546927557jpgsdkldsklhdsa${Random().nextInt(0123456789)}",
          "name": name,
          "image": profile,
          "banner": banners["data"],
          "fee": fee.text,
          "available_slots": days,
          "class_duration": classDuration.text,
          "teaching_mode": teachingMode.text.split("/"),
          "language": language.text.split(","),
          "demo_videos": demoVideos,
          "mobile": mobileController.text,
          "bio": bioController.text,
          "subjects": subject.text.split(","),
          "village": villageController.text,
          "district": districtController.text,
          "zipcode": zipCodeController.text,
          "state": stateController.text,
          "location": {
            "type": "Point",
            "coordinates": [latitude.value, longitude.value]
          },
          "country": country.value
        };

        // Make the final API call to update the profile
        const apiUrl = "https://xyzabc.sambhavapps.com/v1/education/teacher";

        printThis("------------ JSON $json ------------------");
        final jsonResponse = await http.post(
          Uri.parse(apiUrl),
          body: jsonEncode(json),
          headers: {
            ...headers,
            'Content-Type': 'application/json',
          },
        );

        if (jsonResponse.statusCode == 200) {
          toast(title: 'Success', message: 'Profile updated successfully');
          printThis("Profile updated successfully ${jsonResponse.body}");
          loading.value = false;
        } else {
          printThis("Failed to update profile. ${jsonResponse.body}");
          final body = jsonDecode(jsonResponse.body);
          toast(title: 'Error', message: body['error']);
          loading.value = false;
        }
      }
    } catch (e) {
      printThis("Error during upload or post: $e");
      loading.value = false;
    }
  }

  Future<void> pickImages() async {
    try {
      final pickedFileList = await ImagePickerService.pickImages();
      if (pickedFileList != null) {
        banners.addAll(pickedFileList);
      }
    } catch (e) {
      debugPrint('Error picking images: $e');
    }
  }

  Future<void> pickVideos() async {
    try {
      // Use ImagePickerService to pick videos
      final pickedVideos = await ImagePickerService.pickVideos();

      if (pickedVideos != null && pickedVideos.isNotEmpty) {
        videos.addAll(pickedVideos);
        for (var video in pickedVideos) {
          // Add videos to the VideoService
          playVideo(video.path);
        }
      } else {
        toast(title: "", message: "No video selected.");
      }
    } catch (e) {
      debugPrint('Error picking videos: $e');
    }
  }

  void playVideo(String videoPath) {
    final controller = VideoPlayerController.file(File(videoPath));

    controller.initialize().then((_) {
      final chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        looping: false,
        aspectRatio: controller.value.aspectRatio,
      );

      chewieControllers.add(chewieController);
    });
  }

// Dispose all video controllers when they are no longer needed
  void disposeVideoControllers() {
    for (var controller in chewieControllers) {
      controller.dispose();
    }
    chewieControllers.clear();
  }

  Future<TeacherEduModel?> filterTeacherAPI(Map<String, String> map) async {
    loading.value == true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final headers = {'Authorization': 'Bearer $token'};
    try {
      const url =
          "${AppConstants.sambhavBaseUrl}${AppConstants.eduFindByAPIUrl}";
      final response =
          await http.post(Uri.parse(url), body: map, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final res = TeacherEduModel.fromJson(jsonData);
        printThis(res);
        filteredTeachers.value = res;
        loading.value == false;

        return res;
      } else if (response.statusCode == 400) {
        toast(title: 'Error', message: json.decode(response.body)["message"]);
        loading.value == false;
      } else if (response.statusCode == 503) {
        toast(title: 'Error', message: 'Service Unavailable. Try again later.');
        loading.value == false;
      } else if (response.statusCode == 500) {
        toast(
            title: 'Error', message: 'Internal Server Error. Try again later');
        loading.value == false;
      } else {
        toast(title: 'Error', message: 'Failed to filter teacher');
        loading.value == false;
      }
    } catch (e) {
      loading.value == false;
      debugPrint('Error filtering teacher: $e');
    }
    return null;
  }

// *************************** Notes UI API Integration ********************************

  Future<void> fetchSubjects(String classId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${Constants.getSubjects}$classId");

    isLoadingSubjects.value = true;
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        subjects.value = SubjectModel.fromJson(data);
        isLoadingSubjects.value = false;
      } else {
        isLoadingSubjects.value = false;
        throw Exception(
            'Failed to fetch Subjects. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isLoadingSubjects.value = false;
      debugPrint('Error fetching Subjects: $e');
    }
  }

  filterSubject(String query) => filteredSubjects.value = subjects.value!.data
      .where((model) => model.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

  Future<void> fetchChapters(String subjectId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${Constants.getChapters}$subjectId");

    isLoadingChapters.value = true;
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        chapters.value = ChapterModel.fromJson(data);
        isLoadingChapters.value = false;
      } else {
        isLoadingChapters.value = false;
        throw Exception(
            'Failed to fetch Chapters. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isLoadingChapters.value = false;
      debugPrint('Error fetching Chapters: $e');
    }
  }

  filterChapter(String query) => filteredChapter.value = chapters.value!.data
      .where((model) => model.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

  Future<void> fetchNotes(String chapterId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${Constants.getShortNotes}$chapterId");

    isLoadingShortNotes.value = true;
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        shortNotes.value = ShortNotesModel.fromJson(data);
        print("Notes DATA ${shortNotes.value!.data!.first.note!.first.title}");
        isLoadingShortNotes.value = false;
      } else {
        isLoadingShortNotes.value = false;
        throw Exception(
            'Failed to fetch Notes. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isLoadingShortNotes.value = false;
      debugPrint('Error fetching Notes: $e');
    }
  }

  Future<void> fetchVideoNotes(String chapterId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${Constants.getVideoNotes}$chapterId");

    isLoadingVideoNotes.value = true;
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        videoNotes.value = VideoNotesModel.fromJson(data);
        print(
            "Video Notes DATA ${shortNotes.value!.data!.first.note!.first.title}");
        isLoadingVideoNotes.value = false;
      } else {
        isLoadingVideoNotes.value = false;
        throw Exception(
            'Failed to fetch Notes. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isLoadingVideoNotes.value = false;
      debugPrint('Error fetching Notes: $e');
    }
  }

// ******************TEACHERS INFO SCREEN DATA***************************

  var teacherProfileDetails = {}.obs;
  var isLoading = false.obs;

  List colors = [
    0xffDF300A,
    0xffF5A817,
    0xffBF17F5,
    0xff17EBF5,
    0xffF54D17,
    0xff1750F5,
    0xffBF17F5,
    0xff17EBF5,
    0xff1750F5,
  ];

  List<String> filterLabels = [
    'Near 1Km',
    'English',
    'Near 2Km',
    'Near 3Km',
    'Maths',
    'Near 4Km',
    'Near 5Km',
    'Hindi',
    'All subjects',
    'Class 5th',
    'Class 6th',
  ];
  List<IconData> filterIconData = [
    Icons.social_distance,
    Icons.flag,
    Icons.social_distance,
    Icons.social_distance,
    Icons.calculate,
    Icons.social_distance,
    Icons.social_distance,
    Icons.flag,
  ];

  RxList teachersProfile = [].obs;
  var selectedFilter = ''.obs;
  var distance = 0.00.obs;

  TextEditingController searchController = TextEditingController();

  assignTeacher(String teacherId) async {
    loading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/user/teacher/assign');

      var response = await http.post(apiUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({"teacher": teacherId}));
      if (response.statusCode == 200) {
        toast(message: "Your hired teacher successfully");
        Get.back();

        loading.value = false;
      } else {
        printThis(
            'API Request Failed with Status Code: ${response.statusCode}');
        final res = jsonDecode(response.body);
        toast(message: res["error"]);
        printThis(response.body);
        loading.value = false;
      }
    } catch (error) {
      printThis('Error calling API: $error');

      loading.value = false;
    }
  }

  Future<void> fetchTeacherProfileById(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token');
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/teacher/$id');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var responseData = decodedResponse["data"];

        teacherProfileDetails.value = responseData;
      } else {
        printThis(
            'API Request Failed with Status Code: ${response.statusCode}');
      }
    } catch (error) {
      printThis('Error calling API: $error');
    }
  }

  Future<void> fetchTeachersProfile() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl =
          Uri.parse('https://xyzabc.sambhavapps.com/v1/education/teacher');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var responseData = decodedResponse["data"];

        teachersProfile.value = responseData;
        isLoading.value = false;
        printThis(teachersProfile);
      } else {
        printThis(
            'API Request Failed with Status Code: ${response.statusCode}');

        isLoading.value = false;
      }
    } catch (error) {
      printThis('Error calling API: $error');

      isLoading.value = false;
    }
  }

// ******************HOMEWORK INFO SCREEN DATA***************************

  var homework = Rx<HomeworkModel?>(null);

  var isHomeworkLoading = false.obs;

  var homeworkDetails = Rx<HomeworkDetailsModel?>(null);

  var isHomeworkDetailsLoading = false.obs;

  Future<void> fetchHomework() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    print("Token $token");
    final url = Uri.parse(Constants.getHomework);

    isHomeworkLoading.value = true;
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        homework.value = HomeworkModel.fromJson(data);
        print("Homework DATA ${homework.value!.data.first.title}");
        isHomeworkLoading.value = false;
      } else {
        isHomeworkLoading.value = false;
        throw Exception(
            'Failed to fetch Home Work. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isHomeworkLoading.value = false;
      debugPrint('Error fetching Home Work: $e');
    }
  }

  Future<void> fetchHomeworkDetails(String homeWorkID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${Constants.getHomeworkDetails}$homeWorkID");

    isHomeworkDetailsLoading.value = true;
    try {
      final response = await http.get(url, headers: headers);

      print("Homework Details ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        homeworkDetails.value = HomeworkDetailsModel.fromJson(data);
        print("Homework Details DATA ${homeworkDetails.value!.data}");
        isHomeworkDetailsLoading.value = false;
      } else {
        isHomeworkDetailsLoading.value = false;
        throw Exception(
            'Failed to fetch Home Work. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      isHomeworkDetailsLoading.value = false;
      debugPrint('Error fetching Home Work: $e');
    }
  }

  @override
  void onInit() {
    getCurrentLocation(true);
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    disposeVideoControllers();
    super.onClose();
  }
}

class VideoService {
  RxList<ChewieController> chewieControllers = <ChewieController>[].obs;

  void playVideo(String videoPath) {
    final videoController = VideoPlayerController.file(File(videoPath));

    videoController.initialize().then((_) {
      final chewieController = ChewieController(
        videoPlayerController: videoController,
        autoPlay: false,
        looping: false,
        aspectRatio: videoController.value.aspectRatio,
      );

      chewieControllers.add(chewieController);
    });
  }

  void disposeControllers() {
    for (var controller in chewieControllers) {
      controller.videoPlayerController.dispose();
      controller.dispose();
    }
  }
}
