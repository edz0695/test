// ignore_for_file: constant_identifier_names

class Constants {
  static const String baseUrl = "https://xyzabc.sambhavapps.com";
  static const String fidPaybaseUrl = "https://developer.fidypay.com";
  // Data Api Constants
  static const String activeCategories = "$baseUrl/v1/earn/categories";
  static const String activeBanks = "$baseUrl/api/list-banks";
  static const String activeOffers = "$baseUrl/v1/earn/offer/cat/";
  static const String activeOffersForall = "$baseUrl/v1/earn/offers";
  static const String offersDetails = "$baseUrl/api/offer/";
  static const String accountManager = "$baseUrl/api/user-accmanager/";
  static const String caServicesCategories =
      "$baseUrl/api/ca-service-categories";
  static const String PaymentData =
      "$baseUrl/v1/ca/service/formbyserviceid/657d5ca1787aa0ddc4291738";
  // static const String caServices = "$baseUrl/v1/ca/category";
  static const String categoriseServices = "$baseUrl/api/ca-category/";
  static const String newcategoriseServices =
      "https://xyzabc.sambhavapps.com/v1/ca/service/cat/";
  static const String services = "$baseUrl/v1/ca/category";
  static const String caServiceForm = "$baseUrl/api/ca-service/";
  static const String newcaServiceForm = "$baseUrl/v1/ca/services/";
  static const String userWallet = "$baseUrl/user/details/check";
  static const String userTransactions =
      "$baseUrl/v1/user/transactions?page=1&limit=50";
  static const String caServiceHistory = "$baseUrl/api/user-ca-services";

  static const String forImg = "";

  //Auth Api Constants
  static const String checkUserGmail = "$baseUrl/api/check-gmail";
  static const String checkUserEmail = "$baseUrl/api/check-email";
  static const String checkOTP = "$baseUrl/api/check-otp";
  static const String signUp = "$baseUrl/v1/signup";
  static const String loginWithEmailAndPassword = "$baseUrl/v1/login";

  // Bank Add Api
  static const String addBank = "$baseUrl/api/add-user-bank";

  static const String systemSettings = "$baseUrl/api/sys-settings";

  //UserData Api Constants
  static const String updateKycDetails = "$baseUrl/api/kyc-update";
  static const String userProfile = "$baseUrl/v1/user/details/check/";

  //Mobile Recharge Apis
  static const String getPlans = "$baseUrl/api/list-operator-plans";
  static const String paymentValidation = "$baseUrl/api/paymentvalidation";
  static const String getDthOperators = "$baseUrl/api/operators/DTH";

  static const String getOperators = "$baseUrl/api/operatorbycategory/";
  static const String fetchBill = "$baseUrl/api/fetch_bill";
  static const String submitCaForm = "$baseUrl/api/submit-caform";
  static const String submitEarnOfferForm = "$baseUrl/api/submit-offerform";

  //Education Screen

  static const String getClasses = "$baseUrl/v1/education/class";
  static const String getBoards = "$baseUrl/v1/education/board";
  static const String getCompetitiveExams =
      "$baseUrl/v1/education/competitive/class";
  static const String getMediums = "$baseUrl/v1/education/medium";
  static const String submitEducationForm = "$baseUrl/api/education-setup";
  static const String submitEducationFormTeacher =
      "$baseUrl/api/education-setup";
  static const String submitTeacherProfileForm = "$baseUrl/api/teacher-profile";
  static const String submitTeacherBatchForm =
      "$baseUrl/api/teacher-batch-create";
  static const String addToCart = "$baseUrl/api/add-to-cart";

  static const String getSubjects = "$baseUrl/v1/education/subject/class/";
  static const String getChapters = "$baseUrl/v1/education/chapter/subject/";
  static const String getShortNotes = "$baseUrl/v1/education/note/chapter/";
  static const String getVideoNotes =
      "$baseUrl/v1/education/video/note/chapter/";
  static const String getHomework =
      "$baseUrl/v1/education/student/hometutor/homework";

  static const String getHomeworkDetails =
      "$baseUrl/v1/education/student/hometutor/homework/details/";

  static const String getSambhavtube = "$baseUrl/api/sambhavtube";
  static const String getScholorships = "$baseUrl/v1/education/scholarship";
  static const String getBatches = "$baseUrl/v1/education/my/batches/";
  static const String getMessages = "$baseUrl/api/get-messages/";

  static const String getCart = "$baseUrl/api/get-cart/";

  static const String getStMessages = "$baseUrl/api/get-st-messages/";
  static const String educationList = "$baseUrl/api/education-list";
  static const String notesList = "$baseUrl/api/notes";
  static const String competitiveExams = "$baseUrl/api/examnotes";
  static const String papers = "$baseUrl/api/samplepapers";
  static const String chapterlist = "$baseUrl/api/chapters";
  static const String contestlist = "$baseUrl/v1/education/contest";

  static const String videolectures = "$baseUrl/api/videolectures";
  static const String stoptteacher = "$baseUrl/api/opt-teacher";

  static const String sendMessage = "$baseUrl/api/send-message";
  static const String getAllMessage = "$baseUrl/api/get-all-messages";

  static const String ExamSubjects = "$baseUrl/api/exams-subjects/";
  static const String ExamChNotes = "$baseUrl/api/exams-chapter-notes/";

  static const String OfflineCoachings = "$baseUrl/api/offline-coaching";

  static const String CommunityGroups = "$baseUrl/api/communitygroups";
  static const String CommunityPosts = "$baseUrl/v1/education/community/post";
  static const String Quizes = "$baseUrl/api/exam-quize";
  static const String QuizeDetails = "$baseUrl/api/exam-quize-details";

  /// pod services list

  static const String podCategories = "$baseUrl/api/pod/categories";
  static const String podBanners = "$baseUrl/api/pod/size";
  static const String colorList = "$baseUrl/v1/pod/color";
  static const String podSize = "$baseUrl/v1/pod/banners";

  /// bbps apis

  static const String GetBillerList = "$baseUrl/bbps/biller/getBillerList";
  static const String GetBillerAllDetailsByCategoryName =
      "$fidPaybaseUrl/bbps/biller/getBillerAllDetailsByCategoryName";
  static const String GetBalance = "$baseUrl/bbps/biller/getBalance";
  static const String FetchBill = "$fidPaybaseUrl/bbps/biller/fetchBill";
  static const String BillPay = "$fidPaybaseUrl/bbps/biller/billPay";
  static String checkPaymentStatus({required String merchantTrxnRefId}) =>
      "$baseUrl/bbps/biller/checkPaymentStatus/$merchantTrxnRefId";
  static const String getOperatorAndCircleInfoAndMobilePlan =
      "$fidPaybaseUrl/bbps/bbpsPrepaid/getOperatorAndCircleInfoAndMobilePlan";
  static const String BbpsPrepaidPaymentValidation =
      "$baseUrl/bbps/bbpsPrepaid/paymentValidation";
  static const String BillPaymentRequest =
      "$baseUrl/bbps/bbpsPrepaid/billPaymentRequest";
  static const String GetBillerPlans =
      "$baseUrl/bbps/bbpsPrepaid/getBillerPlans";
  static const String getOperatorList =
      "$baseUrl/bbps/bbpsPrepaid/getOperatorList";
  static const String getCircleList = "$baseUrl/bbps/bbpsPrepaid/getCircleList";
  static const String getMobilePlans =
      "$baseUrl/bbps/bbpsPrepaid/getMobilePlans";
  static const String raiseComplaint = "$baseUrl/bbps/biller/raiseComplaint";
  static String checkComplaintStatusByComplaintId(
          {required String complaintId}) =>
      "$baseUrl/bbps/biller/checkComplaintStatusByComplaintId?complaintId={Pass complaintId}";

  //basic
  static const String shareMessage =
      "Open account with Kotak Cherry and start investing in Mutual funds, Stocks, NPS, and more. You don’t need multiple apps, just hook up with Cherry!";
}
