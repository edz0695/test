import 'package:hive/hive.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:video_player/video_player.dart';
import '../../core/services/hiveDatabase.dart';
import '../../src/src.dart';

class EductionFormProvider extends ChangeNotifier {
  // final List boards = ["CBSE Board", "UP Board", "ICSE Board"];
  late VideoPlayerController videoPlayerController;

  videoPlayerControllerProvider() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'),
    )..initialize().then((_) {
        notifyListeners();
      });
  }

  VideoPlayerController get controller => videoPlayerController;
  List<ClassesModel> classes = [];
  List<BoardsModel> boards = [];
  bool showJob = false;
  List<MediumsModel> mediums = [];
  List<MessaeModel> messages = [];
  List<MessaeModel> messagesList = [];
  int? selectedClass;
  int? selectedBoard;
  int? selectedMedium;
  List<ExamsModel> exams = [];
  List<QuizeDetailsModel> quizeDetails = [];
  List<SambhavTubeModel> tubevideos = [];
  List<OffCoModel> offcoachings = [];
  List<SambhavTubeCatModel> tubecate = [];
  List<ContestModel> contestlist = [];
  List<ExamNotes> examNoteslist = [];
  List<ExamVideos> examVideoslist = [];

  List<CommunityGroups> coGroupslist = [];
  List<CommunityPosts> coPostslist = [];
  bool classSelected = false;
  bool competitiveSelected = false;
  bool boardSelected = false;
  bool allUnSelected = true;
  Map<String, dynamic> data = {};
  List<bool> selectionList = [];

  SambhavTubeModel _formData = SambhavTubeModel(
    id: '',
    title: '',
    user_id: '',
    description: '',
    tubecategory_id: '',
    thumbnail: '',
    video: '',
    user_logo: '',
    user_name: '',
    likes: '',
    views: '',
  );

  SambhavTubeModel get formData => _formData;

  void updateTubeFormData(SambhavTubeModel formData) {
    _formData = formData;
    notifyListeners();
  }

  EductionFormProvider() {
    getClasses();
    getBoards();
    getMediums();
  }

  // get tubevideos => null;

  // fetchBoards
  Future<BoardsAllModel?> getBoards() async {
    final model = await ApiService.fetchBoards();
    if (model != null) {
      print("Number of boards : ${model.boards.toString()}");
      boards = model.boards;
    }

    notifyListeners();
    return model;
  }

  // fetchClasses
  Future<ClassesAndExamModel?> getClasses() async {
    final model = await ApiService.fetchClasses();
    if (model != null) {
      classes = model.classes;
      selectionList = [];
      // List.generate(model.exams.length, (index) => false).toList();
      exams = [];

      // model.exams;
    }

    notifyListeners();
    return model;
  }

  Future<ExamsAllModel?> getExams({required String classId}) async {
    final model = await ApiService.fetchCompetitiveExams(classId: classId);
    if (model != null) {
      print("Exams list : ${model.exams}");
      exams = model.exams;
    }

    notifyListeners();
    return model;
  }

  Future<MediumsAllModel?> getMediums() async {
    final model = await ApiService.fetchMediums();
    if (model != null) {
      mediums = model.mediums;
    }

    notifyListeners();
    return model;
  }

  Future<List<CommunityGroups>> getCoGroups() async {
    coGroupslist = await ApiService.fetchcommunitygroups();
    isLoadingCategorised = false;
    printThis(coGroupslist);
    notifyListeners();
    return coGroupslist;
  }

  Future<List<OffCoModel>> getOffCoach() async {
    offcoachings = await ApiService.fetchofflinecoachings();
    isLoadingCategorised = false;
    printThis(coGroupslist);
    notifyListeners();
    return offcoachings;
  }

  Future<List<CommunityPosts>> getCoPosts() async {
    coPostslist = await ApiService.fetchcommunityposts();
    isLoadingCategorised = false;
    printThis(coGroupslist);
    notifyListeners();

    return coPostslist;
  }

  Future<List<SambhavTubeModel>> getTubes() async {
    tubevideos = await ApiService.fetchsambhavtube();
    isLoadingCategorised = false;

    notifyListeners();
    return tubevideos;
  }

  Future<List<SambhavTubeCatModel>> getTubesCat() async {
    tubecate = await ApiService.fetchsambhavtubecat();
    isLoadingCategorised = false;

    notifyListeners();
    return tubecate;
  }

  Future<List<ContestModel>> getContests() async {
    try {
      contestlist = await ApiService.fetchcontests();
      isLoadingCategorised = false;
      notifyListeners();
    } catch (e) {
      printThis("Error in fetch Contest $e");
    }
    return contestlist;
  }

  Future submitForm({required Map<String, dynamic> data}) async {
    await ApiService.submitEducationForm(data: data);
    notifyListeners();
  }

  List<SubjectModel> subjectsList = [];
  List<ScholarshipModel> scholarshipList = [];
  List<BatchModel> batchList = [];
  List<BatchModel> cartBatchList = [];
  bool isLoadingCategorised = false;

  Future<List<SubjectModel>> getSubjects() async {
    subjectsList = await ApiService.fetchSubjects();
    isLoadingCategorised = false;
    notifyListeners();
    return subjectsList;
  }

  Future<List<ScholarshipModel>> getScholarships() async {
    try {
      scholarshipList = await ApiService.fetchScholarships();
      isLoadingCategorised = false;
      notifyListeners();
    } catch (e) {
      printThis("Error in fetchScholarships $e");
    }
    return scholarshipList;
  }

  Future<List<BatchModel>> getBatches({required String userId}) async {
    batchList = await ApiService.fetchBatches(userId: userId);
    isLoadingCategorised = false;

    notifyListeners();
    return batchList;
  }

  Future<List<BatchModel>> getCourseWishlistCart(
      {required String userId,
      required String objType,
      required String type}) async {
    cartBatchList = await ApiService.fetchCart(
        userId: userId, obj_type: objType, type: type);
    isLoadingCategorised = false;

    notifyListeners();
    return cartBatchList;
  }

  Future<List<TutorModel>> getTeacherWishlistCart(
      {required String userId,
      required String objType,
      required String type}) async {
    cartwishlisttutorList = await ApiService.fetchCart(
        userId: userId, obj_type: objType, type: type);
    isLoadingCategorised = false;

    notifyListeners();
    return cartwishlisttutorList;
  }

  Future<List<MessaeModel>> getMessages({required String userId}) async {
    messagesList = await ApiService.fetchMessages(userId: userId);
    isLoadingCategorised = false;

    notifyListeners();
    return messagesList;
  }

  Future<List<MessaeModel>> getAllMessages(
      {required String userId, required String secondId}) async {
    messages =
        await ApiService.fetchAllMessages(userId: userId, secondId: secondId);
    isLoadingCategorised = false;
    printThis(messages);
    notifyListeners();
    return messages;
  }

  List<ShortNotesModel> notesList = [];
  List<ChapterModel> chapterList = [];
  List<VideoLectureModel> videolectureList = [];
  List<TutorModel> tutorList = [];
  List<TutorModel> hiredtutorList = [];
  List<TutorModel> cartwishlisttutorList = [];
  List<CompetitiveModel> competitiveList = [];
  List<ExamSubjects> examSubjects = [];
  List<QuizeModel> examQuizes = [];
  List<SamplePapersModel> papersList = [];

  // bool isLoadingCategorised = false;

  // Future<List<NotesModel>> getNotes(
  //     {required String id, required String userId}) async {
  //   notesList = await ApiService.fetchEduNotes(id: id, userId: userId);
  //   isLoadingCategorised = false;

  //   notifyListeners();
  //   return notesList;
  // }

  Future<List<ChapterModel>> getChapters({required String id}) async {
    chapterList = await ApiService.fetchchapters(id: id);
    isLoadingCategorised = false;

    notifyListeners();
    return chapterList;
  }

  Future<List<VideoLectureModel>> getVideoLectures({required String id}) async {
    videolectureList = await ApiService.fetchvideolectures(id: id);
    isLoadingCategorised = false;

    notifyListeners();
    return videolectureList;
  }

  Future<List<TutorModel>> getHomeTutors() async {
    tutorList = await ApiService.fetchhometutors();
    isLoadingCategorised = false;

    notifyListeners();
    return tutorList;
  }

  Future<List<TutorModel>> getHiredHomeTutors({required String userId}) async {
    hiredtutorList = await ApiService.fetchhiredhometutors(userId: userId);
    isLoadingCategorised = false;

    notifyListeners();
    return hiredtutorList;
  }

  Future<List<TutorModel>> getTeacherSlots({required String userId}) async {
    hiredtutorList = await ApiService.fetchhiredhometutors(userId: userId);
    isLoadingCategorised = false;

    notifyListeners();
    return hiredtutorList;
  }

  Future<List<TutorModel>> getCompetitiveExams(
      {required String? userId}) async {
    competitiveList = await ApiService.fetchCompetitive(userId: userId!);
    isLoadingCategorised = false;

    notifyListeners();
    return tutorList;
  }

  Future<List<ExamSubjects>> getExamsSubjects({required String exam_id}) async {
    examSubjects = await ApiService.fetchExamSubjects(exam_id: exam_id);
    isLoadingCategorised = false;
    notifyListeners();
    return examSubjects;
  }

  Future<List<QuizeModel>> getExamsQuiz({required String chapterId}) async {
    examQuizes = await ApiService.fetchQuizes(chapterId: chapterId);
    isLoadingCategorised = false;

    notifyListeners();
    return examQuizes;
  }

  Future<List<QuizeDetailsModel>> getQuizeDetails(
      {required String quize_id}) async {
    quizeDetails = await ApiService.fetchQuizeDetails(QuizeId: quize_id);
    isLoadingCategorised = false;

    notifyListeners();
    return quizeDetails;
  }

  Future<List<ExamNotes>> getExamsNotes({required String chapter_id}) async {
    examNoteslist = await ApiService.fetchExamNotes(chapter_id: chapter_id);
    isLoadingCategorised = false;

    notifyListeners();
    return examNoteslist;
  }

  Future<List<ExamVideos>> getExamsVideos({required String chapter_id}) async {
    examVideoslist = await ApiService.fetchExamVideos(chapter_id: chapter_id);
    isLoadingCategorised = false;
    notifyListeners();
    return examVideoslist;
  }

  Future<List<TutorModel>> getPapers({required String userId}) async {
    papersList = await ApiService.fetchPapers(userId: userId);
    isLoadingCategorised = false;

    notifyListeners();
    return tutorList;
  }

  Box? box;
  bool? onBoardingStatus;

  Future<void> doneOnBoarding() async {
    await HiveDataBase.saveSingleItem(
        box: box ??=
            await HiveDataBase.openBox(boxName: HiveConfig.educationOnBoarding),
        data: true,
        key: HiveConfig.educationOnBoarding);
  }

  Future<bool?> initOnBoarding() async {
    // box ??= await HiveDataBase.openBox(boxName: HiveConfig.educationOnBoarding);
    final value = await HiveDataBase.getSingleItem(
        key: HiveConfig.educationOnBoarding,
        box: box ??= await HiveDataBase.openBox(
            boxName: HiveConfig.educationOnBoarding));
    if (value != null) {
      return value;
    }
    return null;
  }
}
