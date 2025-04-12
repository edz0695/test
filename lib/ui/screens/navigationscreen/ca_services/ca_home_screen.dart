import 'package:http/http.dart' as http;
import 'package:payapp/core/animations/shimmer_animation.dart';
import 'package:payapp/data/api/api_client.dart';
import 'package:payapp/ui/screens/navigationscreen/ca_services/screens/ca_testimonials_screen.dart';
import '../../../../src/src.dart';
import 'ca_widget/ca_recent_courses.dart';
import 'ca_widget/ca_services_consumer.dart';
import 'ca_widget/ca_video_consumer.dart';
import 'package:payapp/widgets/carousel_loading/carousel_view.dart'
    as sliderView;

class CaServicesScreen extends StatefulWidget {
  const CaServicesScreen({super.key, this.fromNAVBAR = false});
  final bool fromNAVBAR;

  @override
  State<CaServicesScreen> createState() => _CaServicesScreenState();
}

class _CaServicesScreenState extends State<CaServicesScreen> {
  bool isLoading = true;
  bool isTestimonialLoading = true;
  List banners = [];
  List<dynamic> _testimonials = [];

  @override
  void initState() {
    super.initState();
    _fetchBanners();
    _fetchTestimonials();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _fetchBanners() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('auth-token');
      var apiUrl = Uri.parse('https://xyzabc.sambhavapps.com/v1/ca/banner');

      var response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $loginToken',
        },
      );

      print("CA Service Banners ${response.body}");

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var responseData = decodedResponse["data"];
        for (var data in responseData) {
          var bannersData = data["banners"];

          if (mounted) {
            setState(() {
              banners.addAll(
                bannersData.map<String>((banner) => banner.toString()),
              );
            });
          }
        }
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _fetchTestimonials() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('auth-token');

      final response = await http.get(
        Uri.parse('https://xyzabc.sambhavapps.com/v1/ca/testimonial'),
        headers: {'Authorization': 'Bearer $loginToken'},
      );

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            _testimonials = json.decode(response.body)['data'];
            isTestimonialLoading = false;
          });
        }
      } else {
        debugPrint('Failed to load testimonials');
      }
    } catch (error) {
      debugPrint('Error fetching testimonials: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.fromNAVBAR
          ? AppBar(
              leading: const SizedBox(),
            )
          : AppBar(
              title: const Text("CA Service"),
              centerTitle: true,
              leading: back(),
            ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  if (isLoading && isTestimonialLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (banners.isEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            ShimmerAnimation(),
                            Text(
                              'Unknown error occurred! Please log in and try again',
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    sliderView.CarouselView(
                      bannerList: banners,
                      withBaseUrl: false,
                      onTap: () {},
                    ),
                  const SizedBox(height: 10),
                  const CAVideoConsumer(),
                  const CAServicesConsumer(),
                  const CaRecentCourses(),
                  CaTestimonials(
                    testimonials: _testimonials,
                  ),
                  height(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
