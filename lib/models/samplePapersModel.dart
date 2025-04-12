

import '../config/apiconfig.dart';

class SamplePapersModel {
  String id;
  String subjectId;
  String classId;
  String year;
  String pdfFile;
  String status;
  String createdAt;
  String subjectName;
  String fileName;

  SamplePapersModel({
    required this.id,
    required this.subjectId,
    required this.classId,
    required this.year,
    required this.pdfFile,
    required this.status,
    required this.createdAt,
    required this.subjectName,
    required this.fileName
  });



  factory SamplePapersModel.fromMap(Map<dynamic, dynamic> map) {
    return SamplePapersModel(
      id: map['id'] ?? "",
      subjectId: map['subject_id']??"",
      classId: map['class_id']??"",
      year: map['year']??"",
      pdfFile:"${Constants.forImg}/${ map['paper']??""}",
      status: map['status']??"",
      createdAt: map['created_at']??"",
      subjectName: map['subject_name']??"",
      fileName: (map['paper']??"").toString().split("/").last
    );
  }
}




