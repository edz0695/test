import '../config/apiconfig.dart';

class ExamSubjects {
  String id;
  String exam_id;
  String subject_name;
  String icon;
  List<ExamChapters> chapters;

  ExamSubjects({
    required this.id,
    required this.exam_id,
    required this.subject_name,
    required this.icon,
    required this.chapters,
  });



  factory ExamSubjects.fromMap(Map<dynamic, dynamic> map) {
    final chapters = (map['chapters']??[]) as List;
    return ExamSubjects(
      id: map['id'] ?? "",
      exam_id: map['exam_id']??"",
      subject_name: map['subject_name']??"",
      icon:"${Constants.forImg}/${map['icon']??""}",
      chapters: chapters.map((e) => ExamChapters.fromMap(e)).toList(),
    );
  }
}



class ExamChapters {
  String id;
  String exam_id;
  String subject_id;
  String chapter_name;

  ExamChapters({
    required this.id,
    required this.exam_id,
    required this.subject_id,
    required this.chapter_name
  });



  factory ExamChapters.fromMap(Map<dynamic, dynamic> map) {
    return ExamChapters(
      id: map['id'] ?? "",
      exam_id: map['exam_id']??"",
      subject_id: map['subject_id']??"",
      chapter_name: map['chapter_name']??""
    );
  }
}




