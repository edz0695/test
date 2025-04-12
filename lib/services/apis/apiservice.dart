import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/data/api/api_client.dart';
import 'package:uuid/uuid.dart';
import '../../models/earnbanksmodel.dart';
import '../../src/src.dart';
import '../database/localstorage.dart';

// Function to save token to shared preferences
Future<void> saveTokenToSharedPreferences(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
  prefs.setString(AppConstants.authToken, token);
  // prefs.setString(AppConstants.token, token);
}

class ApiService {
  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('mygromoapp:SacPass112233'))}';

  static String amrToken = "";

  // Function to get the token from shared preferences
  static Future<void> getApiToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    amrToken = prefs.getString('auth-token') ?? '';
  }

  static Future fetchActiveCategories() async {
    await getApiToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('auth-token') ?? '';
    // var url = Uri.parse(Constants.activeCategories);
    var url = Uri.parse(Constants.activeCategories);
    final http.Response response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    print(
        "========================================================================");
    print(
        "========================================================================");
    print(
        "========================================================================");
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData;
    } else {
      return Future.error('Oops Something Went Wrong.');
    }
  }

  // static Future fetchEduNotes(
  //     {required String id, required String userId}) async {
  //   await getApiToken();
  //   var url = Uri.parse(Constants.educationList);
  //   Map<String, dynamic> body = {
  //     "user_id": userId,
  //     "subject_id": id,
  //     "list": "notes"
  //   };
  //   final http.Response response = await http.post(url,
  //       headers: {"authorization": basicAuth, "Accept": "application/json"},
  //       body: body);
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     if (responseData["status"] != false) {
  //       final notes = responseData["data"] as List;
  //       return notes.map((e) => NotesModel.fromMap(e)).toList();
  //     } else {
  //       return responseData["status"];
  //     }
  //   } else {
  //     return;
  //   }
  // }

  static Future fetchchapters({required String id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.chapterlist);
    Map<String, dynamic> body = {"subject_id": id};
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final notes = responseData["data"] as List;
        return notes.map((e) => ChapterModel.fromJson(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchvideolectures({required String id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.videolectures);
    Map<String, dynamic> body = {"chapter_id": id};
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final notes = responseData["data"] as List;
        return notes.map((e) => VideoLectureModel.fromMap(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchsambhavtube() async {
    await getApiToken();
    var url = Uri.parse(Constants.getSambhavtube);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final tubevideos = responseData["data"] as List;
      return tubevideos.map((e) => SambhavTubeModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchExamNotes({required String chapter_id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.ExamChNotes + chapter_id);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final exchnotes = responseData["data"]["notes"] as List;
      return exchnotes.map((e) => ExamNotes.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchExamVideos({required String chapter_id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.ExamChNotes + chapter_id);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final exchvideos = responseData["data"]["videos"] as List;
      return exchvideos.map((e) => ExamVideos.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchcommunitygroups() async {
    await getApiToken();
    var url = Uri.parse(Constants.CommunityGroups);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final coGroups = responseData["data"] as List;
      return coGroups.map((e) => CommunityGroups.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchofflinecoachings() async {
    await getApiToken();
    var url = Uri.parse(Constants.OfflineCoachings);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final offCoachings = responseData["data"] as List;
      return offCoachings.map((e) => OffCoModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchcommunityposts() async {
    await getApiToken();
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('mygromoapp:SacPass112233'))}';
    var url = Uri.parse(Constants.CommunityPosts);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final coPosts = responseData["data"] as List;
      return coPosts.map((e) => CommunityPosts.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  static Future fetchcontests() async {
    await getApiToken();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth-token');
    var url = Uri.parse(Constants.contestlist);
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final scholarships = responseData["data"] as List;
      return scholarships.map((e) => ContestModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchsambhavtubecat() async {
    await getApiToken();
    var url = Uri.parse(Constants.getSambhavtube);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final tubecategories = responseData["categories"] as List;
      return tubecategories.map((e) => SambhavTubeCatModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchhometutors() async {
    await getApiToken();
    var url = Uri.parse(Constants.educationList);
    Map<String, dynamic> body = {"list": "home tutors"};
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final tutors = responseData["data"] as List;
        return tutors.map((e) => TutorModel.fromMap(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchhiredhometutors({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.educationList);
    Map<String, dynamic> body = {"list": "home tutors", "user_id": userId};
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final tutors = responseData["data"] as List;
        return tutors.map((e) => TutorModel.fromMap(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchCompetitive({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.competitiveExams);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: {"user_id": userId});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final tutors = responseData["data"] as List;
        return tutors.map((e) => CompetitiveModel.fromMap(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchExamSubjects({required String exam_id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.ExamSubjects + exam_id);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final examsubjects = responseData["data"] as List;
      return examsubjects.map((e) => ExamSubjects.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchPapers({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.papers);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth, "Accept": "application/json"},
        body: {"user_id": userId});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData["status"] != false) {
        final tutors = responseData["data"] as List;
        return tutors.map((e) => SamplePapersModel.fromMap(e)).toList();
      } else {
        return responseData["status"];
      }
    } else {
      return;
    }
  }

  static Future fetchSubjects() async {
    await getApiToken();
    var url = Uri.parse(Constants.getSubjects);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final notes = responseData["data"] as List;
      return notes.map((e) => SubjectModel.fromJson(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchScholarships() async {
    await getApiToken();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth-token');
    var url = Uri.parse(Constants.getScholorships);
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final scholarships = responseData["data"] as List;
      return scholarships.map((e) => ScholarshipModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchBatches({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getBatches + userId);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final batches = responseData["data"] as List;
      return batches.map((e) => BatchModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchCart(
      {required String userId,
      required String obj_type,
      required String type}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getCart);
    final http.Response response =
        // await http.get(url, headers: {"authorization": basicAuth});
        await http.post(url,
            headers: {"authorization": basicAuth},
            body: {'user_id': userId, 'obj_type': obj_type, 'type': type});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (type == 'cart') {
        if (obj_type == 'teacher') {
          final cartsteacherlist = responseData["data"] as List;
          return cartsteacherlist.map((e) => TutorModel.fromMap(e)).toList();
        } else {
          final cartscourselist = responseData["data"] as List;
          return cartscourselist.map((e) => BatchModel.fromMap(e)).toList();
        }
      } else {
        if (obj_type == 'teacher') {
          final wishlistteacherlist = responseData["data"] as List;
          return wishlistteacherlist.map((e) => TutorModel.fromMap(e)).toList();
        } else {
          final wishlistcourselist = responseData["data"] as List;
          return wishlistcourselist.map((e) => BatchModel.fromMap(e)).toList();
        }
      }
    } else {
      return;
    }
  }

  static Future fetchMessages({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getMessages + userId);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final messages = responseData["data"] as List;
      return messages.map((e) => MessaeModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchStudentMessages({required String userId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getStMessages + userId);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final messages = responseData["data"] as List;
      return messages.map((e) => MessaeModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchActiveBanks() async {
    await getApiToken();
    var url = Uri.parse(Constants.activeBanks);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final banks = responseData["data"] as List;
      return banks.map((e) => EarnBanksModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchActiveOffers({required String id_endporin}) async {
    await getApiToken();
    // var url = Uri.parse(Constants.activeOffers);
    var url = Uri.parse(Constants.activeOffers + id_endporin);
    final http.Response response =
        await http.get(url, headers: {"Cookie": "token=$amrToken"});
    print(
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final offers = responseData["data"];
      print("ya raaaaaaaaaaaaaaaaaaaaaaaaaab");
      print("ya raaaaaaaaaaaaaaaaaaaaaaaaaab");
      print("ya raaaaaaaaaaaaaaaaaaaaaaaaaab");
      print("ya raaaaaaaaaaaaaaaaaaaaaaaaaab");
      print(offers);
      return offers;
    } else {
      return Future.error('Oops Something Went Wrong.');
    }
  }

  static Future fetchActiveOffersfor_all_cata() async {
    await getApiToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    // var url = Uri.parse(Constants.activeOffers);
    var url = Uri.parse(Constants.activeOffersForall);
    final http.Response response =
        await http.get(url, headers: {"Cookie": "token=$token"});
    print(
        "fetchActiveOffersfor_all_catafetchActiveOffersfor_all_catafetchActiveOffersfor_all_catafetchActiveOffersfor_all_cata");
    print("Hello world\n Your response");
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final alloffers = responseData["data"];
      return alloffers;
    } else {
      return Future.error('Oops Something Went Wrong.');
    }
  }

  static Future fetchWallet({required String userId}) async {
    await getApiToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('auth-token') ?? '';
    var url = Uri.parse(Constants.userWallet);
    final http.Response response = await http.get(url, headers: {
      "authorization": basicAuth,
      'Authorization': 'Bearer $token',
    });
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final offers = responseData["data"];
      return WalletsModel.fromMap(offers);
    } else {
      return;
    }
  }

  static Future fetchTransactionData() async {
    await getApiToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('auth-token') ?? '';
    var url = Uri.parse(Constants.userTransactions);
    final http.Response response = await http.get(url, headers: {
      "authorization": basicAuth,
      'Authorization': 'Bearer $token',
    });
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final offers = responseData["data"];
      return offers;
    } else {
      return;
    }
  }

  static Future fetchQuizes({required String chapterId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.Quizes);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth}, body: {'chapter_id': chapterId});
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final myquizes = responseData["data"] as List;
      printThis(myquizes);
      return myquizes.map((e) => QuizeModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchQuizeDetails({required String QuizeId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.QuizeDetails);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth}, body: {'quize_id': QuizeId});
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final myquizequestions = responseData["data"] as List;
      printThis(myquizequestions);
      // return QuizeModel.fromMap(myquizes);
      return myquizequestions.map((e) => QuizeDetailsModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future addBankDetails({required Map data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.addBank);
    final http.Response response =
        await http.post(url, headers: {"authorization": basicAuth}, body: data);
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final status = responseData["status"];
      if (status) {
        return responseData['messages'];
      }
      return Future.error("Oops SomeThing Went Wrong.");
    } else {
      return Future.error("Oops SomeThing Went Wrong.");
    }
  }

  static Future fetchOffersDetails(String id) async {
    await getApiToken();
    var url = Uri.parse("${Constants.offersDetails}/$id");
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData["data"];
    } else {
      return;
    }
  }

  static Future fetchSystemSettings() async {
    try {
      await getApiToken();
      var url = Uri.parse(Constants.systemSettings);
      final http.Response response =
          await http.get(url, headers: {"Cookie": 'token=$amrToken'});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("app settings");
        print(responseData["data"]);
        return responseData["data"];
      } else {
        print("app settings");
        print(response.statusCode);
        print(response.body);
        print(response.headers);
        Fluttertoast.showToast(
          msg: "Oops Something Went Wrong.",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: const Color(0xfff83838),
          textColor: Colors.white,
        );
        return Future.error("Oops Something Went Wrong.");
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: const Color(0xfff83838),
        textColor: Colors.white,
      );
      return;
    }
  }

  static Future fetchMobileRechargePlans({required String mobileNumber}) async {
    await getApiToken();
    if (mobileNumber.contains("+91")) {
      mobileNumber = mobileNumber.replaceAll("+91", "");
    }
    var url = Uri.parse(Constants.getPlans);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth}, body: {"mobile": mobileNumber});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return PlansModel.fromMap(responseData);
    } else {
      return;
    }
  }

  static Future paymentVerification(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.paymentValidation);
    final http.Response response =
        await http.post(url, headers: {"authorization": basicAuth}, body: data);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return PlansModel.fromMap(responseData);
    } else {
      return;
    }
  }

  static Future fetchBill({required var data}) async {
    try {
      var url = Uri.parse(Constants.FetchBill);
      final http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json", // Specify content type as JSON
            "client-id": "DV9lHP0khDzH6yG9HxIXxg==",
            "client-secret":
                "rlQzbbk5S91Hfc1PE9nzl4463zR4AiYCYyO7L1MspftLy4KzBEmQxmPYPay57KEy",
            "authorization": "Basic U2hvYmhhOkVudGVyQDEyMzQ=",
          },
          body: json.encode(data));
      printThis(response.body);
      printThis(jsonEncode(data));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return BillModel.fromMap(responseData);
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future billPay({required var data}) async {
    try {
      var url = Uri.parse(Constants.BillPay);
      final http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json", // Specify content type as JSON
            "client-id": "DV9lHP0khDzH6yG9HxIXxg==",
            "client-secret":
                "rlQzbbk5S91Hfc1PE9nzl4463zR4AiYCYyO7L1MspftLy4KzBEmQxmPYPay57KEy",
            "authorization": "Basic U2hvYmhhOkVudGVyQDEyMzQ=",
          },
          body: json.encode(data));
      printThis(response.body);
      printThis(jsonEncode(data));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return BillModel.fromMap(responseData);
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future fetchBillerBill({required var data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.fetchBill);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    printThis(response.statusCode);
    printThis(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return BillModel.fromMap(responseData);
    } else {
      return;
    }
  }

  static Future submitEarnForm({required var data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.submitEarnOfferForm);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    printThis(response.statusCode);
    printThis(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData['status'];
    } else {
      return;
    }
  }

  static Future submitCaForm({required var data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.submitCaForm);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    printThis(response.statusCode);
    printThis(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData['status'];
    } else {
      return;
    }
  }

  static Future fetchMediums() async {
    await getApiToken();
    var url = Uri.parse(Constants.getMediums);
    final http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $amrToken',
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["data"];
      return MediumsAllModel.fromMap(data);
    } else {
      return;
    }
  }

  static Future fetchBoards() async {
    await getApiToken();
    var url = Uri.parse(Constants.getBoards);
    final http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $amrToken',
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["data"];
      return BoardsAllModel.fromMap(data);
    } else {
      return;
    }
  }

  static Future fetchCompetitiveExams({required String classId}) async {
    await getApiToken();
    var url = Uri.parse("${Constants.getCompetitiveExams}/$classId");
    final http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $amrToken',
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["data"];
      return ExamsAllModel.fromMap(data);
    } else {
      return;
    }
  }

  static Future fetchClasses() async {
    await getApiToken();
    var url = Uri.parse(Constants.getClasses);
    final http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $amrToken',
    });
    print("Tumeanza");
    printThis(response.body);
    // printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["data"];
      return ClassesAndExamModel.fromMap(data);
    } else {
      return;
    }
  }

  static Future submitEducationForm(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.submitEducationForm);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    // printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future submitTeacherProfileForm(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.submitTeacherProfileForm);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    printThis(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future submitToCart({required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.addToCart);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    printThis(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["success"];
      return data;
    } else {
      return false;
    }
  }

  static Future submitTeacherBatchForm(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    printThis(jsonEncode(data));
    var url = Uri.parse(Constants.submitTeacherBatchForm);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
// printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future submitEducationFormTeacher(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.submitEducationFormTeacher);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    // printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future studentjoinhometutor(
      {required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.stoptteacher);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    // printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future sendMessage({required Map<String, dynamic> data}) async {
    await getApiToken();
    var url = Uri.parse(Constants.sendMessage);
    final http.Response response = await http.post(url,
        headers: {
          "authorization": basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));
    printThis(response.statusCode);
    // printThis(text)(jsonEncode(data));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["message"];
      return data;
    } else {
      return;
    }
  }

  static Future fetchDthOperators() async {
    await getApiToken();
    var url = Uri.parse(Constants.getDthOperators);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final operators = responseData["opeartors"] as List;
      return operators.map((e) => DthOperatorModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchAllMessages(
      {required String userId, required String secondId}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getAllMessage);
    final http.Response response = await http.post(url,
        headers: {"authorization": basicAuth},
        body: {"first_id": userId, 'second_id': secondId});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      printThis(responseData);
      final messages = responseData["data"] as List;
      return messages.map((e) => MessaeModel.fromMap(e)).toList();
    } else {
      return;
    }
  }

  static Future fetchOperators({required String serviceType}) async {
    await getApiToken();
    var url = Uri.parse(Constants.getOperators + serviceType);
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final operators = responseData["opeartors"];
      return operators;
    } else {
      return Future.error("Oops SomeThing Went Wrong.");
    }
  }

  static Future fetchAllBillerCategories({required String serviceType}) async {
    try {
      var url = Uri.parse(Constants.GetBillerAllDetailsByCategoryName);
      final http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json", // Specify content type as JSON
          "client-id": "DV9lHP0khDzH6yG9HxIXxg==",
          "client-secret":
              "rlQzbbk5S91Hfc1PE9nzl4463zR4AiYCYyO7L1MspftLy4KzBEmQxmPYPay57KEy",
          "authorization": "Basic U2hvYmhhOkVudGVyQDEyMzQ=",
        },
        body: jsonEncode({
          "category": serviceType,
          "pageNo": "0",
          "pageSize": "100" // You can pass 'data' here if needed
        }),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        final operators = responseData["payload"]['billers'];
        return operators;
      } else {
        return Future.error("Oops SomeThing Went Wrong.");
      }
    } catch (e) {
      print(e);
      return Future.error("Oops SomeThing Went Wrong.");
    }
  }

  static Future fetchCircleWisePlanLists(
      {required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(Constants.getOperatorAndCircleInfoAndMobilePlan);
      final http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json", // Specify content type as JSON
          "client-id": "DV9lHP0khDzH6yG9HxIXxg==",
          "client-secret":
              "rlQzbbk5S91Hfc1PE9nzl4463zR4AiYCYyO7L1MspftLy4KzBEmQxmPYPay57KEy",
          "authorization": "Basic U2hvYmhhOkVudGVyQDEyMzQ=",
        },
        body: jsonEncode({
          "mobileNo": "6390971282", // You can pass 'data' here if needed
        }),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return CircleWisePlanListsModel.fromJson(responseData);
      } else {
        return;
      }
    } catch (e) {}
  }

  static Future<Map<String, dynamic>> fetchUserDetails(
      {required String userId}) async {
    await getApiToken(); // Ensure the token is refreshed before making API calls.
    var url = Uri.parse(Constants.userProfile);

    try {
      final response =
          await http.get(url, headers: {'Authorization': 'Bearer $amrToken'});
      print("Response body...............: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData.containsKey("getaUser")) {
          return responseData["getaUser"];
        } else {
          throw Exception("Invalid response format.");
        }
      } else if (response.statusCode == 404) {
        throw Exception("User not found: $userId");
      } else {
        throw Exception("Unexpected error: ${response.body}");
      }
    } catch (e) {
      print("Error in fetchUserDetails: $e");
      rethrow;
    }
  }

  static Future fetchAllCaServices() async {
    try {
      await getApiToken();
      var url = Uri.parse(Constants.caServicesCategories);
      final http.Response response =
          await http.get(url, headers: {"Cookie": 'token=$amrToken'});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // final services = responseData["data"] as List;
        return CaServiceModel.fromMap(responseData);
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  static Future FRequreddata() async {
    try {
      await getApiToken();
      var url = Uri.parse(Constants.PaymentData);
      final http.Response response =
          await http.get(url, headers: {"Cookie": 'token=$amrToken'});
      // if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final services = responseData["data"][0]["form_data"] as List;
      return services.map((e) => paymentdataModel.fromMap(e)).toList();
      // return responseData["data"][0]["form_data"];
      // } else {
      //   return;
      // }
    } catch (e) {
      printThis("Something went wrong in Payment $e");
    }
  }

  static Future fetchAllCategoriseServices({required String id}) async {
    await getApiToken();
    var url = Uri.parse(Constants.newcategoriseServices + id);
    // var url = Uri.parse(Constants.categoriseServices + id);
    final http.Response response =
        await http.get(url, headers: {'Cookie': 'token=$amrToken'});
    // 'Cookie': 'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTA3MTA5ZDBiZDliZTVmZjgzMjRiYyIsImlhdCI6MTcwMTgwNjE4MiwiZXhwIjoxNzAyMDY1MzgyfQ.ZY72DUehohWMNcsG6gmdGTdXhivK-mbBHXhRCu6WlfY'
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final services = responseData["data"] as List;
      return services.map((e) => CaCategoriseServiceModel.fromMap(e)).toList();
    } else {
      return;
    }
  }



  static Future fetchAccountManagerDetails() async {
    await getApiToken();
    final userId = await LocalStorage.getStringData("userId");
    var url = Uri.parse("${Constants.accountManager}/$userId");
    final http.Response response =
        await http.get(url, headers: {"authorization": basicAuth});
    printThis(response);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      final data = responseData["data"];
      return data;
    } else {
      return Future.error('Something Went Wrong.');
    }
  }

  static Future checkUserGmail(String gmail) async {
    await getApiToken();
    var url = Uri.parse(Constants.checkUserGmail);
    Map<String, dynamic> body = {"email": gmail};
    final http.Response response =
        await http.post(url, headers: {"authorization": basicAuth}, body: body);
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData["status"];
    } else {
      return;
    }
  }

  static Future checkUserEmail(String email) async {
    await getApiToken();
    var url = Uri.parse(Constants.checkUserEmail);
    Map<String, dynamic> body = {"email": email};
    final http.Response response =
        await http.post(url, headers: {"authorization": basicAuth}, body: body);
    // printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData["status"];
    } else {
      if (response.statusCode == 404) {
        return Future.error("User not found!");
      }
      return Future.error("Something Went Wrong");
    }
  }

  static Future verifyOTP(String email, String otp) async {
    await getApiToken();
    var url = Uri.parse(Constants.checkOTP);
    Map<String, dynamic> body = {"email": email, "otp": otp};
    final http.Response response =
        await http.post(url, headers: {"authorization": basicAuth}, body: body);
    printThis(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData["status"];
    } else {
      return;
    }
  }

  static Future loginWithEmailAndPassword(String email, String password) async {
    try {
      var url = Uri.parse(Constants.loginWithEmailAndPassword);
      Map formData = {'email': email, 'password': password};
      var postBody = jsonEncode(formData);
      final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: postBody,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // Store token using shared preferences
        String token = responseData["token"];
        loginToken = token;
        await saveTokenToSharedPreferences(token);
        printThis(
            ".............................................................");
        printThis("SAMBHAV AUTH TOKEN $token");
        printThis(
            ".............................................................");
        Fluttertoast.showToast(
            msg: "User login successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
        return responseData["data"];
      } else {
        return Future.error('Invalid Email and Password');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // firstName ,lastName, email, mobile, password, refID
  static Future signUp(
    String firstName,
    String lastName,
    String email,
    String mobile,
    String password,
    String refID,
  ) async {
    var url = Uri.parse(Constants.signUp);
    try {
      Map formData = {
        "name": "$firstName $lastName",
        "email": email,
        "mobile": mobile,
        "password": password,
        "imgId": const Uuid().v4()
      };

      var postBody = jsonEncode(formData);
      final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: postBody,
      );
      if (response.statusCode == 200) {
        printThis(response.body);
        printThis(response.statusCode);
        var responseData = jsonDecode(response.body);
        return responseData["status"];
      } else {
        var responseData = jsonDecode(response.body);
        return Future.error(responseData["errors"] ??
            responseData["message"] ??
            'Something went wrong.');
      }
    } catch (e) {
      print("catch error");
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
      print(e);
    }
  }

  static Future updateKyc(File? aadharImage, File? panImage) async {
    final userId = await LocalStorage.getStringData("userId");
    var uri = Uri.parse(Constants.updateKycDetails);
    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers
        .addAll({"authorization": basicAuth, "Accept": "application/json"});
    request.fields.addAll({"id": userId!});
    var aadharImageMultiPart =
        await http.MultipartFile.fromPath('aadhar_img', aadharImage!.path);

    var panImageMultiPart =
        await http.MultipartFile.fromPath('pan_img', panImage!.path);
    request.files.add(aadharImageMultiPart);
    request.files.add(panImageMultiPart);
    var response = await request.send();
    printThis(response.statusCode);
    if (response.statusCode == 200) {
      var responseFromStream = await http.Response.fromStream(response);
      var responseData = await jsonDecode(responseFromStream.body);
      printThis('image uploaded');
      return responseData["status"];
    } else {
      printThis('failed');
      return;
    }
  }
}
