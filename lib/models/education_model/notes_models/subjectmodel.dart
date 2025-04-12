class SubjectModel {
  final List<Subject> data;

  SubjectModel({required this.data});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Subject> dataList = list.map((e) => Subject.fromJson(e)).toList();
    return SubjectModel(
      data: dataList,
    );
  }
}

class Subject {
  final ClassId classId;
  final BoardId boardId;
  final MediumId mediumId;
  final String examId;
  final bool isCompetitive;
  final bool isNormal;
  final String name;
  final String logo;
  final int status;
  final String id;

  Subject({
    required this.classId,
    required this.boardId,
    required this.mediumId,
    required this.examId,
    required this.isCompetitive,
    required this.isNormal,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      classId: ClassId.fromJson(json['class_id']),
      boardId: BoardId.fromJson(json['board_id']),
      mediumId: MediumId.fromJson(json['medium_id']),
      examId: json['exam_id'],
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}

class ClassId {
  final String name;
  final String id;

  ClassId({required this.name, required this.id});

  factory ClassId.fromJson(Map<String, dynamic> json) {
    return ClassId(
      name: json['name'],
      id: json['id'],
    );
  }
}

class BoardId {
  final String classId;
  final String name;
  final String logo;
  final int status;
  final String id;

  BoardId({
    required this.classId,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory BoardId.fromJson(Map<String, dynamic> json) {
    return BoardId(
      classId: json['class_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}

class MediumId {
  final String classId;
  final String boardId;
  final String name;
  final String logo;
  final int status;
  final String id;

  MediumId({
    required this.classId,
    required this.boardId,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory MediumId.fromJson(Map<String, dynamic> json) {
    return MediumId(
      classId: json['class_id'],
      boardId: json['board_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}
