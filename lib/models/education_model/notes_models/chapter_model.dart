class ChapterModel {
  final List<Chapter> data;

  ChapterModel({required this.data});

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Chapter> dataList = list.map((e) => Chapter.fromJson(e)).toList();
    return ChapterModel(
      data: dataList,
    );
  }
}

class Chapter {
  final ChapterClassId classId;
  final ChapterBoardId boardId;
  final ChapterMediumId mediumId;
  final String examId;
  final ChapterSubjectId subjectId;
  final bool isCompetitive;
  final bool isNormal;
  final String name;
  final String logo;
  final int status;
  final String id;

  Chapter({
    required this.classId,
    required this.boardId,
    required this.mediumId,
    required this.examId,
    required this.subjectId,
    required this.isCompetitive,
    required this.isNormal,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      classId: ChapterClassId.fromJson(json['class_id']),
      boardId: ChapterBoardId.fromJson(json['board_id']),
      mediumId: ChapterMediumId.fromJson(json['medium_id']),
      examId: json['exam_id'],
      subjectId: ChapterSubjectId.fromJson(json['subject_id']),
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}

class ChapterClassId {
  final String name;
  final String id;

  ChapterClassId({required this.name, required this.id});

  factory ChapterClassId.fromJson(Map<String, dynamic> json) {
    return ChapterClassId(
      name: json['name'],
      id: json['id'],
    );
  }
}

class ChapterBoardId {
  final String classId;
  final String name;
  final String logo;
  final int status;
  final String id;

  ChapterBoardId({
    required this.classId,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory ChapterBoardId.fromJson(Map<String, dynamic> json) {
    return ChapterBoardId(
      classId: json['class_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}

class ChapterMediumId {
  final String classId;
  final String boardId;
  final String name;
  final String logo;
  final int status;
  final String id;

  ChapterMediumId({
    required this.classId,
    required this.boardId,
    required this.name,
    required this.logo,
    required this.status,
    required this.id,
  });

  factory ChapterMediumId.fromJson(Map<String, dynamic> json) {
    return ChapterMediumId(
      classId: json['class_id'],
      boardId: json['board_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }
}

class ChapterSubjectId {
  final String classId;
  final String boardId;
  final String mediumId;
  final String examId;
  final bool isCompetitive;
  final bool isNormal;
  final String name;
  final String logo;
  final int status;
  final String id;

  ChapterSubjectId({
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

  factory ChapterSubjectId.fromJson(Map<String, dynamic> json) {
    return ChapterSubjectId(
      classId: json['class_id'],
      boardId: json['board_id'],
      mediumId: json['medium_id'],
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
