class ClassesAndExamModel {
  List<ClassesModel> classes;

  // List<ExamsModel> exams;

  ClassesAndExamModel({
    required this.classes,
    // required this.exams,
  });

  factory ClassesAndExamModel.fromMap(List data) {
    var classes = data;
    return ClassesAndExamModel(
      classes: classes.map((e) => ClassesModel.fromMap(e)).toList(),
      // exams: exams.map((e) => ExamsModel.fromMap(e)).toList(),
    );
  }
}

class BoardsAllModel {
  List<BoardsModel> boards;

  BoardsAllModel({
    required this.boards,
    // required this.exams,
  });

  factory BoardsAllModel.fromMap(List data) {
    var boards = data;
    return BoardsAllModel(
      boards: boards.map((e) => BoardsModel.fromMap(e)).toList(),
      // exams: exams.map((e) => ExamsModel.fromMap(e)).toList(),
    );
  }
}

class ExamsAllModel {
  List<ExamsModel> exams;

  ExamsAllModel({
    required this.exams,
    // required this.exams,
  });

  factory ExamsAllModel.fromMap(List data) {
    var exams = data;
    return ExamsAllModel(
      exams: exams.map((e) => ExamsModel.fromMap(e)).toList(),
      // exams: exams.map((e) => ExamsModel.fromMap(e)).toList(),
    );
  }
}

class MediumsAllModel {
  List<MediumsModel> mediums;

  MediumsAllModel({
    required this.mediums,
    // required this.exams,
  });

  factory MediumsAllModel.fromMap(List data) {
    var mediums = data;
    return MediumsAllModel(
      mediums: mediums.map((e) => MediumsModel.fromMap(e)).toList(),
      // exams: exams.map((e) => ExamsModel.fromMap(e)).toList(),
    );
  }
}

class ClassesModel {
  String id;
  String name;

  ClassesModel({
    required this.id,
    required this.name,
  });

  factory ClassesModel.fromMap(Map<dynamic, dynamic> map) {
    return ClassesModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
    );
  }
}

class ExamsModel {
  String id;
  String examName;
  String examLogo;
  int status;

  ExamsModel(
      {required this.id,
      required this.examName,
      required this.status,
      required this.examLogo});

  factory ExamsModel.fromMap(Map<dynamic, dynamic> map) {
    return ExamsModel(
      id: map['id'] ?? "",
      examName: map['name'] ?? "",
      examLogo: map["logo"] ?? "",
      status: map['status'] ?? "",
    );
  }
}

class BoardsModel {
  String id;
  String boardName;
  String boardLogo;

// String status;

  BoardsModel({
    required this.id,
    required this.boardName,
    required this.boardLogo,
    // required this.status,
  });

  factory BoardsModel.fromMap(Map<dynamic, dynamic> map) {
    return BoardsModel(
      id: map['id'] ?? "",
      boardName: map['name'] ?? "",
      boardLogo: map['logo'] ?? "",
// status: map['status']??"",
    );
  }
}

class MediumsModel {
  String id;
  String mediumName;
  String mediumLogo;

// String status;

  MediumsModel({
    required this.id,
    required this.mediumLogo,
    required this.mediumName,
    // required this.status,
  });

  factory MediumsModel.fromMap(Map<dynamic, dynamic> map) {
    return MediumsModel(
      id: map['id'] ?? "",
      mediumName: map['name'] ?? "",
      mediumLogo: map['logo'] ?? "",
// status: map['status']??"",
    );
  }
}
