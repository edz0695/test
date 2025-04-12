

import '../config/apiconfig.dart';

class CompetitiveModel {
  String id;
  String userId;
  String examId;
  String examName;
  String image;
  List<CompetitiveNotes> notes;

  CompetitiveModel({
    required this.id,
    required this.userId,
    required this.examId,
    required this.examName,
    required this.image,
    required this.notes,
  });



  factory CompetitiveModel.fromMap(Map<dynamic, dynamic> map) {
    final notes = (map['notes']??[]) as List;
    return CompetitiveModel(
      id: map['id'] ?? "",
      userId: map['user_id']??"",
      examId: map['exam_id']??"",
      examName: map['exam_name']??"",
      image:"${Constants.forImg}/${map['banner']??""}",
      notes: notes.map((e) => CompetitiveNotes.fromMap(e)).toList(),
    );
  }
}



class CompetitiveNotes {
  String id;
  String examId;
  String topic;
  String pdfFile;
  String fileName ;

  CompetitiveNotes({
    required this.id,
    required this.examId,
    required this.topic,
    required this.pdfFile,
    required this.fileName
  });



  factory CompetitiveNotes.fromMap(Map<dynamic, dynamic> map) {
    return CompetitiveNotes(
      id: map['id'] ?? "",
      examId: map['exam_id']??"",
      topic: map['totic']??"",
      pdfFile: "${Constants.forImg}/${ map['notesfile']??""}",
      fileName: (map['notesfile']??"").toString().split("/").last

    );
  }
}




