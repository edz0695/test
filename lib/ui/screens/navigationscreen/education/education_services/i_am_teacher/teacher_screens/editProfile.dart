import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/utils/validator/validator.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../../src/src.dart';
import '../../../../../../widgets/editdetailswidget.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class TeacherInfoEdit extends StatefulWidget {
  const TeacherInfoEdit({super.key});

  @override
  State<TeacherInfoEdit> createState() => _TeacherInfoEditState();
}

class _TeacherInfoEditState extends State<TeacherInfoEdit> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.find<EducationController>();
  final VideoService videoService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: "Edit Profile", size: 55),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EditDetailsWidget(
                              title: "Name",
                              detail: "Name",
                              editingController: controller.nameController,
                              action: TextInputAction.next,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Phone",
                              detail: "Phone Number",
                              action: TextInputAction.next,
                              type: TextInputType.number,
                              editingController: controller.mobileController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Bio",
                              detail: "Edit Bio",
                              action: TextInputAction.next,
                              editingController: controller.bioController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Language",
                              detail: "Language",
                              action: TextInputAction.next,
                              editingController: controller.language,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Designation",
                              detail: "Designation",
                              action: TextInputAction.next,
                              editingController: controller.designation,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Village",
                              detail: "New Delhi",
                              action: TextInputAction.next,
                              editingController: controller.villageController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "District",
                              detail: "Enter District",
                              action: TextInputAction.next,
                              editingController: controller.districtController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "State",
                              detail: "Enter State",
                              action: TextInputAction.next,
                              editingController: controller.stateController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          EditDetailsWidget(
                              title: "Zip code",
                              detail: "Enter Zip code",
                              action: TextInputAction.next,
                              editingController: controller.zipCodeController,
                              validator: (value) =>
                                  FormValidator.validateName(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeColors.primaryBlueColor
                                          .withOpacity(0.3))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF399BC4),
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(20))),
                                        child: Text(
                                          "Available days for training",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Days:"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: GridView.count(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 4.0,
                                          childAspectRatio: 3.0,
                                          mainAxisSpacing: 10.0,
                                          children: [
                                            ...controller.days.map((day) =>
                                                controller.buildDayChip(
                                                    day: day))
                                          ]),
                                    ),
                                    Text("Slots per Day"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Obx(() {
                                      return Column(
                                        children: controller.daysSelected
                                            .map(
                                              (e) => controller.buildTimeOfDay(
                                                context: context,
                                                day: e["day"],
                                                timeFrom: e["from"],
                                                timeTo: e["to"],
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: EditDetailsWidget(
                                    title: "Class duration",
                                    detail: "1 hr",
                                    action: TextInputAction.next,
                                    editingController: controller.classDuration,
                                    validator: (value) =>
                                        FormValidator.validateName(value)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: EditDetailsWidget(
                                  title: "Teaching mode",
                                  detail: "Online/Offline",
                                  action: TextInputAction.next,
                                  editingController: controller.teachingMode,
                                  validator: (value) {
                                    if (value == "Online" ||
                                        value == "Offline" ||
                                        value == "Online/Offline") {
                                      return null; // Valid input
                                    } else {
                                      return "Invalid input"; // Detailed error message
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: EditDetailsWidget(
                                    title: "Subjects",
                                    detail: "Your subject",
                                    action: TextInputAction.next,
                                    editingController: controller.subject,
                                    validator: (value) =>
                                        FormValidator.validateName(value)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: EditDetailsWidget(
                                    type: TextInputType.number,
                                    title: "Fee",
                                    detail: "10,000/mon",
                                    action: TextInputAction.next,
                                    editingController: controller.fee,
                                    validator: (value) =>
                                        FormValidator.validateName(value)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Location",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .034,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Obx(() =>
                                  Text(controller.address.value.toString())),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Banners",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize:
                                    MediaQuery.of(context).size.width * .03,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                          height(10),
                          Obx(() {
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: controller.banners.isNotEmpty
                                        ? Get.size.width * .65
                                        : 0,
                                    height: Get.size.height * .2,
                                    child: GridView.builder(
                                      itemCount: controller.banners.length,
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          width: Get.size.width,
                                          height: Get.size.height * .2,
                                          child: Stack(
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.file(
                                                    File(controller
                                                        .banners[index].path),
                                                    fit: BoxFit.cover,
                                                    width: Get.size.width,
                                                    height:
                                                        Get.size.height * .2,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 5,
                                                  left: 0,
                                                  right: -40,
                                                  child: GestureDetector(
                                                      onTap: () => controller
                                                          .banners
                                                          .removeAt(index),
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: 20,
                                                        color: Colors.red,
                                                      )))
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  width(10),
                                  GestureDetector(
                                    onTap: () => controller.pickImages(),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey.shade400,
                                          size: 30,
                                        )),
                                  )
                                ]);
                          }),
                          height(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pick Videos",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize:
                                        MediaQuery.of(context).size.width * .03,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.normal),
                              ),
                              GestureDetector(
                                onTap: () => controller.pickVideos(),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.grey.shade400,
                                      size: 20,
                                    )),
                              ),
                            ],
                          ),
                          height(10),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(() {
                            return controller.chewieControllers.isNotEmpty
                                ? SizedBox(
                                    height: Get.size.height * .33,
                                    child: ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 10,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.chewieControllers.length,
                                      itemBuilder: (context, index) {
                                        final player =
                                            controller.chewieControllers[index];
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20))),
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: Get.size.width * .85,
                                                child: AspectRatio(
                                                  aspectRatio:
                                                      player.aspectRatio ??
                                                          16 / 9,
                                                  child: Chewie(
                                                    controller: player,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .chewieControllers
                                                            .removeAt(index);
                                                        player.pause();
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )))
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("No videos selected."),
                                  ));
                          }),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        final isLoading = controller.loading.value;

        return Consumer<LoginSignUpProvider>(
          builder: (context, value, child) {
            final userModel = value.userModel;

            if (userModel == null) {
              return const SizedBox(); // Return an empty widget if userModel is null
            }

// userModel.image.isEmpty || userModel.image == ''
//                       ? toast(message: "Please add your profile Picture")
//                       :
            return FloatingActionButton.extended(
              onPressed: isLoading
                  ? null
                  : () => controller.editProfileAPI(
                        "${Constants.forImg}/${userModel.image}",
                        userModel.name,
                      ),
              label: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        backgroundColor: Colors.white,
                      ),
                    )
                  : const Text(
                      "      Create profile      ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
            );
          },
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBanner(),
    );
  }
}

class MyBanner extends StatefulWidget {
  const MyBanner({super.key});

  @override
  _MyBannerState createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  List<String> imageUrls = [
    "https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg",
    "https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg",
    "https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg",
    "https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg",
    // Add more image URLs as needed
  ];

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the image to the server
      await uploadImage(File(pickedFile.path));
    }
  }

  Future<void> uploadImage(File imageFile) async {
    // Open a byte stream
    var stream = http.ByteStream(imageFile.openRead());
    // Get the length of the file
    var length = await imageFile.length();

    // Parse the URL
    var uri = Uri.parse("https://xyzabc.sambhavapps.com/v1/media/uploads");

    // Create a multipart request
    var request = http.MultipartRequest("POST", uri);

    // Create a multipart file using the byte stream, length of the file and the filename
    var multipartFile = http.MultipartFile(
      'file',
      stream,
      length,
      filename: imageFile.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );

    // Add the file to the multipart request
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      // Get the download URL and append it to imageUrls
      var downloadUrl = value; // Replace this with the actual parsing logic
      setState(() {
        imageUrls.add(downloadUrl);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          imageUrls.remove(url);
                        });
                      },
                      child: Image.network(
                        url,
                        height: 200,
                        width: MediaQuery.of(context)
                            .size
                            .width, // set width to screen width
                        fit: BoxFit.cover, // set fit to BoxFit.cover
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _getImageFromGallery();
                },
                child: Container(
                  color: Colors.black
                      .withOpacity(0.7), // semi-transparent black background
                  child: Text(
                    "Tap to add image , long press to remove image",
                    style: TextStyle(
                      color: Colors.white, // white text
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
