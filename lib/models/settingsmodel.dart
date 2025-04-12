import 'package:payapp/config/apiconfig.dart';
import 'package:html/parser.dart' show parse;

class SettingsModel {
  String appLogo;
  String contest_banner;
  String privacyPolicy;
  String termsConditions;
  String contactUs;
  String currency;
  String appIntroVideo;
  String aboutUs;
  String tdsInfo;
  List<String> earnBanners;
  List<String> studentBanners;
  String earnTestimonial;
  List<Testimonials> testimonials;
  List<Testimonials> testimonialsCaService;



  SettingsModel({
    required this.appLogo,
    required this.contest_banner,
    required this.privacyPolicy,
    required this.termsConditions,
    required this.contactUs,
    required this.currency,
    required this.appIntroVideo,
    required this.earnBanners,
    required this.studentBanners,
    required this.aboutUs,
    required this.tdsInfo,
    required this.earnTestimonial,
    required this.testimonials,
    required this.testimonialsCaService
  });





  factory SettingsModel.fromMap(Map<dynamic, dynamic> map) {
    final earnBannersTemp = map["earn-banner"] as List;
    final studentBannersTemp = map["student-banner"] as List;
    final testimonials = (map["testimonials"]??[]) as List;
    final testimonialsCaService = (map["caservice_testimonials"]??[]) as List;
    return SettingsModel(
      appLogo: "${Constants.forImg}/${map['logo']?? ""}",
      privacyPolicy: parse(map['privacy_policy']??"").body?.text ?? "",
      termsConditions: parse(map['terms_conditions']??"").body?.text ?? "",
      contactUs: map['contact_us']??"",
      contest_banner: map['contest_banner']??"",
      currency: map['currency']??"",
      aboutUs: map['about_us']??"",
      tdsInfo: map['tds_deduction']??"",
      appIntroVideo: "${Constants.forImg}/${map['app_info']??""}",
      earnTestimonial: "${Constants.forImg}/${map['earn_testimonial']??""}",
      earnBanners: earnBannersTemp.map((e) => e.toString()).toList(),
      studentBanners: studentBannersTemp.map((e) => e.toString()).toList(),
      testimonials:testimonials.map((e) => Testimonials.fromMap(e)).toList(),
      testimonialsCaService: testimonialsCaService.map((e) => Testimonials.fromMap(e)).toList(),
    );
  }
}



class Testimonials{
  String title;
  String video;
  String thumbnail;



  Testimonials({
    required this.title,
    required this.video,
    required this.thumbnail,
  });





  factory Testimonials.fromMap(Map<dynamic, dynamic> map) {
    return Testimonials(
        title: map['title']??"",
        video: "${Constants.forImg}/${map['video']??""}",
      thumbnail:"${Constants.forImg}/${map['Thumbnail']??""}"



    );
  }







}








