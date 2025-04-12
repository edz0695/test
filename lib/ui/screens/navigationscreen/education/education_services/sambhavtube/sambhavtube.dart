import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:payapp/src/src.dart';
import 'package:provider/provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../../../../../widgets/sambhavtube/sambhavtubewidget.dart';

class SambhavtubeScreen extends StatefulWidget {
  const SambhavtubeScreen({super.key});

  @override
  State<SambhavtubeScreen> createState() => _SambhavtubeScreenState();
}

class _SambhavtubeScreenState extends State<SambhavtubeScreen>
    with AutomaticKeepAliveClientMixin<SambhavtubeScreen> {
  List<IconData> actionsIcons = [
    // Icons.search,
    Icons.add
  ];

  static final MethodChannel _channel = MethodChannel('easebuzz');
  var selectedCategory = "All";

  bool isLoading = true;
  List categories = [];
  List videos = [];
  List selectCategory = [];

  Future<void> _fetchCategories() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/st/category');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse);
        var responseData = decodedResponse["data"];
        setState(() {
          categories = responseData;
          isLoading = false;
          print(categories);
        });
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error calling API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchVideos() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/st/video');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse);
        var responseData = decodedResponse["data"];
        setState(() {
          videos = responseData;
          isLoading = false;
          print(videos);
        });
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error calling API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  // List<SambhavTubeModel> videos = [];

  // void loadData() async {
  //   SambhavTubeModel videosJson = await ApiService.fetchsambhavtube();
  //   SambhavTubeModel videosData = videosJson;
  //   setState(() {
  //     videos = videosData as List<SambhavTubeModel>;
  //   });
  // }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final tubeProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;

    final SambhavTubeController controller = Get.find<SambhavTubeController>();

    return Scaffold(
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          leading: back(),
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Lottie.asset(
              'assets/lottie/video_banner.json',
              height: 50,
              width: 60,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                testPayment() async {
                  String accessKey =
                      "555a2b009214573bd833feca997244f1721ac69d7f2b09685911bc943dcf5201";
                  String payMode = "test";
                  Object parameters = {
                    "access_key": accessKey,
                    "pay_mode": payMode
                  };
                  final paymentResponse = await _channel.invokeMethod(
                      "payWithEasebuzz", parameters);
                  print(paymentResponse);
                }

                testPayment();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            VideoUploadWidget(),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: size.width,
              height: 40,
              child: FutureBuilder<SambhavTubeCategoryModel?>(
                  future: controller.fetchSambhavtubeCategories(),
                  builder: (context, snapshot) {
                    final categories = snapshot.data?.data ?? [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loading();
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Center(
                        child: Text("No category found"),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (_, index) {
                        final category = categories[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.network(
                                    category.catImg,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    category.catName,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            height(30),
            Expanded(
                child: FutureBuilder<SambhavTubeVideosModel?>(
                    future: controller.fetchSambhavtubeVideos(),
                    builder: (context, snapshot) {
                      final videos = snapshot.data?.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return loading();
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Center(
                          child: Text("No videos found"),
                        );
                      }
                      return ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 100),
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: videos?.length,
                          itemBuilder: (context, i) {
                            final video = videos?[i];
                            return SambhavTubeWidgetTile(
                              video: video,
                              user: video?.user,
                            );
                          });
                    })),
          ],
        ));
  }

  // PreferredSizeWidget navBar(BuildContext context) {
  //   var tubeProvider = Provider.of<EductionFormProvider>(context,listen: false);
  //   tubeProvider.getTubesCat();
  //   return ScrollAppBar(
  //     controller: controller,
  //     title: Image.asset(
  //       "assets/images/logo.png",
  //       height: 20,
  //       fit: BoxFit.contain,
  //     ),
  //     actions: actionsIcons
  //         .map((iconName) => IconButton(onPressed: () {
  //           Navigator.push(context,
  //                 CupertinoPageRoute(builder: (context) => TubeForm()));
  //         }, icon: Icon(iconName)))
  //         .toList(),
  //     bottom: PreferredSize(
  //         preferredSize: const Size.fromHeight(50.0),
  //         child: SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //           child: Row(
  //             // height
  //             children: [
  //               Consumer<EductionFormProvider>(
  //           builder: (context, categoryProvider, child) {
  //             return Wrap(
  //               spacing: 5,
  //               children: categoryProvider.tubecate
  //                   .map((category) => FilterChip(
  //                         showCheckmark: false,
  //                         label: Text(
  //                           category.name,
  //                           style: TextStyle(
  //                               color: selectedCategory == category
  //                                   ? Colors.white
  //                                   : Colors.black),
  //                         ),
  //                         backgroundColor: Colors.grey.shade200,
  //                         selectedColor: Colors.grey.shade600,
  //                         selected: selectedCategory == category,
  //                         onSelected: (bool value) {},
  //                       ))
  //                   .toList(),
  //             );
  //           },
  //         ),
  //
  //         //       Wrap(
  //         //           spacing: 5,
  //         //           children: tubeProvider.tubecate
  //         //               .map((category) => FilterChip(
  //         //                   showCheckmark: false,
  //         //                   label: Text(
  //         //                     category.name,
  //         //                     style: TextStyle(
  //         //                         color: selectedCategory == category
  //         //                             ? Colors.white
  //         //                             : Colors.black),
  //         //                   ),
  //         //                   backgroundColor: Colors.grey.shade200,
  //         //                   selectedColor: Colors.grey.shade600,
  //         //                   selected: selectedCategory == category,
  //         //                   onSelected: (bool value) {}))
  //         //               .toList()),
  //         //       Wrap(
  //         //         spacing: 5,
  //         //         children: [
  //         //           Consumer<EductionFormProvider>(
  //         //             builder: (context, tubeProvider, child) {
  //         //               return tubeProvider.isLoadingCategorised?Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
  //         // padding: const EdgeInsets.only(left: 15, right: 15, bottom: 100),
  //         // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
  //         // itemCount: tubeProvider.tubecate.length,
  //         // itemBuilder: (context, i) {
  //         //   return FilterChip(
  //         //                   showCheckmark: false,
  //         //                   label: Text(
  //         //                     tubeProvider.tubecate[i].name,
  //         //                     style: TextStyle(
  //         //                         color:  Colors.black),
  //         //                   ),
  //         //                   backgroundColor: Colors.grey.shade200,
  //         //                   selectedColor: Colors.grey.shade600,
  //         //                   // selected: selectedCategory == category,
  //         //                   onSelected: (bool value) {});
  //         // });
  //
  //         //             }
  //         //           ),
  //         //         ],
  //         //       )
  //             ],
  //           ),
  //         )),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}

class VideoUploadWidget extends StatelessWidget {
  const VideoUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VideoUploadForm(),
          ));
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => VideoUploadForm(),
          // );
        },
        child: SvgPicture.asset(
          "assets/icons/upload-svgrepo-com (1).svg",
          color: Colors.blue,
          height: 20,
        ),
      ),
    );
  }
}

class VideoUploadForm extends StatefulWidget {
  const VideoUploadForm({super.key});

  @override
  _VideoUploadFormState createState() => _VideoUploadFormState();
}

class _VideoUploadFormState extends State<VideoUploadForm> {
  String? _filePath;
  String? _thumbnailPath;
  String? _title;
  String? _description;
  String? _category;
  bool _isLoading = false;
  String? _errorText = "";
  final double _uploadProgress = 0;

  List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var response = await http.get(
        Uri.parse('https://xyzabc.sambhavapps.com/v1/st/category'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var categories = json.decode(response.body)['data'];
        setState(() {
          _categories = List<Map<String, dynamic>>.from(categories);
        });
      } else {
        setState(() {
          _errorText = 'Failed to fetch categories';
        });
      }
    } catch (e) {
      setState(() {
        _errorText = 'Network error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _uploadFile(String videoPath, String thumbnailPath) async {
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
    };
    if (token == null) {
      print('Token not found');
      return;
    }

    try {
      var thumbnailUrl = await _uploadMedia(token, thumbnailPath);
      var videoUrl = await _uploadMedia(token, videoPath);

      var videoData = {
        'category': _category,
        'thumbnail': thumbnailUrl,
        'title': _title,
        'video': videoUrl,
        'description': _description,
      };
      var response = await http.post(
        Uri.parse('https://xyzabc.sambhavapps.com/v1/st/video'),
        body: videoData,
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Handle success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Video uploaded successfully')),
        );
        Navigator.pop(context); // Go back after successful upload
      } else {
        setState(() {
          _errorText = 'Failed to upload video';
        });
      }
    } catch (e) {
      setState(() {
        _errorText = 'Network error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> _uploadMedia(String token, String filePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://xyzabc.sambhavapps.com/v1/media/uploads'),
    );
    request.headers.addAll({'Authorization': 'Bearer $token'});
    request.files.add(await http.MultipartFile.fromPath(
      'media',
      filePath,
      filename: filePath.split('/').last,
    ));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var mediaUrl = json.decode(response.body)['url'];
      return mediaUrl;
    } else {
      throw Exception('Failed to upload media: ${response.reasonPhrase}');
    }
  }

  Future<void> _pickFile() async {
    final result = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (result != null) {
      final platformFile = result.path;
      setState(() {
        _filePath = platformFile;
      });
    }
  }

  Future<void> _pickThumbnail() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result != null) {
      final platformFile = File(result.path);
      File? croppedFile = await _cropImage(platformFile);
      if (croppedFile != null) {
        // File? resizedFile = await _resizeImage(croppedFile);
        // if (resizedFile != null) {
        setState(() {
          _thumbnailPath = croppedFile.path;
        });
        // }
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    try {
      final imageCropper = ImageCropper();
      final croppedFile = await imageCropper.cropImage(
        sourcePath: imageFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Thumbnail',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
          IOSUiSettings(
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          )
        ],
      );
      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } on Exception catch (e) {
      // Handle cropping exception
      print("Error cropping image: $e");
      return null;
    }
  }

  Future<File?> _resizeImage(File imageFile) async {
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      var resizedFile = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path,
        '${imageFile.absolute.path}_resized',
        quality: 75, // Adjust quality as needed
        minWidth: 200, // Set the minimum width for resizing
        minHeight: 200, // Set the minimum height for resizing
      );
      var resizedFile2 = File(resizedFile!.path);
      return resizedFile2;
    } catch (e) {
      print("Error resizing image: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload a new video"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              if (_isLoading)
                Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text(
                      'Uploading... ${(_uploadProgress * 100).toStringAsFixed(2)}%',
                    ),
                  ],
                )
              else if (_errorText != null)
                Text(
                  _errorText!,
                  style: TextStyle(color: Colors.red),
                )
              else
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _title = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _description = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _category,
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue;
                        });
                      },
                      items:
                          _categories.map<DropdownMenuItem<String>>((category) {
                        return DropdownMenuItem<String>(
                          value: category['id'],
                          child: Text(category['cat_name']),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _thumbnailPath != null
                        ? Column(
                            children: [
                              Image.file(File(_thumbnailPath!)),
                              SizedBox(height: 10),
                              Text(
                                'Thumbnail: ${_thumbnailPath!.split('/').last}',
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _pickThumbnail();
                            },
                            child: Text('Select Video Thumbnail'),
                          ),
                    SizedBox(height: 20),
                    _filePath != null
                        ? Column(
                            children: [
                              Text(
                                'Video: ${_filePath!.split('/').last}',
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _pickFile();
                            },
                            child: Text('Select Video'),
                          ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_filePath != null &&
                            _title != null &&
                            _category != null &&
                            _description != null) {
                          _uploadFile(_filePath!, _thumbnailPath!);
                        } else {
                          setState(() {
                            _errorText = 'Please fill in all fields';
                          });
                        }
                      },
                      child: Text('Upload'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class WowButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color color;

  const WowButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  _WowButtonState createState() => _WowButtonState();
}

class _WowButtonState extends State<WowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    _animationController.forward();
  }

  void _onTapUp(_) {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: widget.color),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 18,
                      color: widget.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
