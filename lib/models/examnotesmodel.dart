import '../config/apiconfig.dart';

class ExamNotes {
  String id;
  String title;
  String notes_file;
  String fileName ;

  ExamNotes({
    required this.id,
    required this.title,
    required this.notes_file,
    required this.fileName
  });



  factory ExamNotes.fromMap(Map<dynamic, dynamic> map) {
    return ExamNotes(
      id: map['id'] ?? "",
      title: map['title']??"",
      notes_file:"${Constants.forImg}/${map['notes_file']??""}",
      fileName: (map['notes_file']??"").toString().split("/").last
    );
  }
}



class ExamVideos {
  String id;
  String title;
  String thumbnail;
  String notes_video;

  ExamVideos({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.notes_video
  });



  factory ExamVideos.fromMap(Map<dynamic, dynamic> map) {
    return ExamVideos(
      id: map['id'] ?? "",
      title: map['title']??"",
      thumbnail: map['thumbnail']??"",
      notes_video: map['notes_video']??""
    );
  }
}




