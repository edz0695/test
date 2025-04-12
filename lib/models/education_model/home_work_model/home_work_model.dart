class HomeworkModel {
  List<Homework> data;

  HomeworkModel({
    required this.data,
  });

  // Factory method to create HomeworkResponse from JSON
  factory HomeworkModel.fromJson(Map<String, dynamic> json) {
    return HomeworkModel(
      data: List<Homework>.from(
        json['data'].map((item) => Homework.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((homework) => homework.toJson()).toList(),
    };
  }
}

class Homework {
  String createdBy;
  String studentId;
  String title;
  DateTime assignedDate;
  DateTime lastSubmissionDate;
  String texthomework;
  String? files;
  String id;

  Homework({
    required this.createdBy,
    required this.studentId,
    required this.title,
    required this.assignedDate,
    required this.lastSubmissionDate,
    required this.texthomework,
    this.files,
    required this.id,
  });

  // Factory method to create Homework from JSON
  factory Homework.fromJson(Map<String, dynamic> json) {
    return Homework(
      createdBy: json['createdBy'],
      studentId: json['student_id'],
      title: json['title'],
      assignedDate: DateTime.parse(json['assigned_date']),
      lastSubmissionDate: DateTime.parse(json['last_submission_date']),
      texthomework: json['texthomework'],
      files: json['files'],
      id: json['id'],
    );
  }

  // Method to convert Homework to JSON
  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'student_id': studentId,
      'title': title,
      'assigned_date': assignedDate.toIso8601String(),
      'last_submission_date': lastSubmissionDate.toIso8601String(),
      'texthomework': texthomework,
      'files': files,
      'id': id,
    };
  }
}
