class HomeworkDetailsModel {
  final HomeworkDetailsData data;

  HomeworkDetailsModel({required this.data});

  factory HomeworkDetailsModel.fromJson(Map<String, dynamic> json) {
    return HomeworkDetailsModel(
      data: HomeworkDetailsData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class HomeworkDetailsData {
  final String createdBy;
  final String studentId;
  final String title;
  final DateTime assignedDate;
  final DateTime lastSubmissionDate;
  final String textHomework;
  final List<HomeworkDetailsQuestion> questions;
  final String id;

  HomeworkDetailsData({
    required this.createdBy,
    required this.studentId,
    required this.title,
    required this.assignedDate,
    required this.lastSubmissionDate,
    required this.textHomework,
    required this.questions,
    required this.id,
  });

  factory HomeworkDetailsData.fromJson(Map<String, dynamic> json) {
    return HomeworkDetailsData(
      createdBy: json['createdBy'],
      studentId: json['student_id'],
      title: json['title'],
      assignedDate: DateTime.parse(json['assigned_date']),
      lastSubmissionDate: DateTime.parse(json['last_submission_date']),
      textHomework: json['texthomework'],
      questions: (json['questions'] as List<dynamic>)
          .map((item) => HomeworkDetailsQuestion.fromJson(item))
          .toList(),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'student_id': studentId,
      'title': title,
      'assigned_date': assignedDate.toIso8601String(),
      'last_submission_date': lastSubmissionDate.toIso8601String(),
      'texthomework': textHomework,
      'questions': questions.map((q) => q.toJson()).toList(),
      'id': id,
    };
  }
}

class HomeworkDetailsQuestion {
  final String question;
  final String file;
  final String id;

  HomeworkDetailsQuestion({
    required this.question,
    required this.file,
    required this.id,
  });

  factory HomeworkDetailsQuestion.fromJson(Map<String, dynamic> json) {
    return HomeworkDetailsQuestion(
      question: json['question'],
      file: json['file'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'file': file,
      '_id': id,
    };
  }
}
