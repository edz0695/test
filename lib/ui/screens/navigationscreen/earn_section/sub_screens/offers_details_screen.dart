import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:payapp/ui/screens/navigationscreen/earn_section/tabs/details_tab.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/animations/dot_loder_widget.dart';
import '../../../../../core/animations/shimmer_animation.dart';
import '../../../../../src/src.dart';
import 'package:ansiparser/ansiparser.dart' as ansiparser;

class OfferDetailsScreen extends StatefulWidget {
  final String title;
  final String offerId;

  const OfferDetailsScreen(
      {super.key, required this.title, required this.offerId});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  var offer;
  bool isLoading = true; //

  @override
  void initState() {
    super.initState();
    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<UserController>().userInfoModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    _fetchOffer();
  }

  Future<void> _fetchOffer() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/earn/offers');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print("Response 1 status code: ${response.statusCode}");

      print("Response 1 body: ${response.body}");

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        final firstElement = decodedResponse["data"]
            .firstWhere((e) => e["id"] == widget.offerId, orElse: () => null);

        if (firstElement != null) {
          var apiUrl2 = Uri.parse(
              'https://xyzabc.sambhavapps.com/v1/earn/offer/cat/${firstElement["cat_id"]['id']}');

          var response2 = await http.get(
            apiUrl2,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          );

          print("Response 2 status code: ${response2.statusCode}");

          print("Response 2 body: ${response2.body}");
          if (response2.statusCode == 200) {
            var decodedResponse2 = jsonDecode(response2.body);
            final firstElement2 = decodedResponse2["data"].firstWhere(
                (e) => e["id"] == widget.offerId,
                orElse: () => null);
            setState(() {
              offer = firstElement2;
              isLoading = false;
            });
          } else {
            print(
                'API Request Failed with Status Code: ${response2.statusCode}');
            setState(() {
              isLoading = false;
            });
          }
        } else {
          print('No offer found with id ${widget.offerId}');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('API Request Failed with Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      printThis('Error calling API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().userInfoModel;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  heroTag: "share link",
                  shape: const StadiumBorder(),
                  onPressed: () async => await shareData(),
                  label: Row(
                    children: [
                      const Icon(Icons.share),
                      width(10),
                      const Text("Share & Earn")
                    ],
                  ),
                ),
                width(20),
                FloatingActionButton.extended(
                  heroTag: "open in browser",
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    final url = Uri.parse(
                        "${offer["offer_url"]}&userid=${user?.email}");
                    if (!await launchUrl(url)) {}
                  },
                  label: Row(
                    children: [
                      const Icon(Icons.link),
                      width(10),
                      const Text("Do Self")
                    ],
                  ),
                ),
              ],
            )),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              leading: back(),
              elevation: 5,
              centerTitle: true,
              title: Text(
                widget.title,
                style: const TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              collapsedHeight: 250,
              stretch: true,
              flexibleSpace: isLoading
                  ? loading()
                  : Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: offer != null
                          ? CarouselSlider.builder(
                              itemCount: offer["banner_img"].length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    offer["banner_img"][itemIndex],
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const ShimmerAnimation();
                                    },
                                  ),
                                ),
                              ),
                              options: CarouselOptions(
                                height: 170,
                                viewportFraction: 0.95,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          : const SizedBox(), // Placeholder widget if offer is null
                    ),
            ),
          ],
          body: isLoading
              ? const Center(
                  child: KSProgressAnimation(
                    dotsColor: ThemeColors.primaryBlueColor,
                  ),
                )
              : offer == null
                  ? const Text("")
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.5))),
                          child: TabBar(
                            tabAlignment: TabAlignment.start,
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            isScrollable: true, // Selected label color
                            unselectedLabelColor: Colors.grey.shade500,

                            indicatorSize: TabBarIndicatorSize.tab,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            indicatorPadding: const EdgeInsets.all(10),
                            labelStyle: const TextStyle(
                              fontSize: 10, // Font size for selected label
                              fontWeight: FontWeight
                                  .w500, // Font weight for selected label
                            ),
                            indicator: BoxDecoration(
                              color: const Color(0xFF0080FF)
                                  .withOpacity(0.7), // Indicator color
                              borderRadius: BorderRadius.circular(
                                  50.0), // Rounded indicator
                            ),
                            tabs: const [
                              Tab(text: 'Description'),
                              Tab(text: 'Terms'),
                              Tab(text: 'Benefits'),
                              Tab(text: 'How it works'),
                              Tab(text: 'Marketing'),
                              Tab(text: 'Training'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(-3, -3),
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: HtmlWidget(
                                  offer?["description"] ?? "",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(3, 3),
                                        color: const Color(0xff2057A6)
                                            .withOpacity(0.2),
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: HtmlWidget(
                                  offer != null ? offer["terms"] ?? "" : "",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(3, 3),
                                        color: const Color(0xff2057A6)
                                            .withOpacity(0.2),
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: HtmlWidget(
                                  offer != null ? offer["benefits"] : "",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(3, 3),
                                        color: const Color(0xff2057A6)
                                            .withOpacity(0.2),
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: HtmlWidget(
                                  offer != null ? offer["how_work"] : "",
                                ),
                              ),
                              const DetailsTab(),
                              const Text("Training")
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  shareData() async {
    final Directory dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/image.png");
    final image = offer["share_image"].first;
    final http.Response response = await http.get(Uri.parse(image));

    await file.writeAsBytes(response.bodyBytes);

    final XFile xFile = XFile(file.path);

    final ansipScreen = ansiparser.newScreen();
    ansipScreen.put(offer["share_text"]);

    ansipScreen.parse();
    final converted = ansipScreen.toFormattedString();

    final List<String> imageUrls = offer["share_image"].cast<String>();
    final String formattedImageUrls = imageUrls.join('\n');

    final result = await Share.shareXFiles(
      [xFile],
      text:
          "$formattedImageUrls\n\n${converted.first}\n\n${offer["share_link"]}",
      subject: "Check this out!",
    );
    if (result.status == ShareResultStatus.success) {
      toast(message: "Thanks for sharing!");
    }
  }
}
