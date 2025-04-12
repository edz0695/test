class Notes {
  final String? id;
  final NotesClassId? classId;
  final NotesBoardId? boardId;
  final NotesMediumId? mediumId;
  final String? examId;
  final NotesSubjectId? subjectId;
  final NotesChapterId? chapterId;
  final bool? isCompetitive;
  final bool? isNormal;
  final List<Note>? note;
  final int? status;

  Notes({
    this.id,
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
    this.subjectId,
    this.chapterId,
    this.isCompetitive,
    this.isNormal,
    this.note,
    this.status,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      id: json['id'],
      classId: json['class_id'] != null
          ? NotesClassId.fromJson(json['class_id'])
          : null,
      boardId: json['board_id'] != null
          ? NotesBoardId.fromJson(json['board_id'])
          : null,
      mediumId: json['medium_id'] != null
          ? NotesMediumId.fromJson(json['medium_id'])
          : null,
      examId: json['exam_id'],
      subjectId: json['subject_id'] != null
          ? NotesSubjectId.fromJson(json['subject_id'])
          : null,
      chapterId: json['chapter_id'] != null
          ? NotesChapterId.fromJson(json['chapter_id'])
          : null,
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      note: json['note'] != null
          ? List<Note>.from(json['note'].map((x) => Note.fromJson(x)))
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class_id': classId?.toJson(),
      'board_id': boardId?.toJson(),
      'medium_id': mediumId?.toJson(),
      'exam_id': examId,
      'subject_id': subjectId?.toJson(),
      'chapter_id': chapterId?.toJson(),
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'note': note?.map((x) => x.toJson()).toList(),
      'status': status,
    };
  }
}

class NotesClassId {
  final String? name;
  final String? id;

  NotesClassId({this.name, this.id});

  factory NotesClassId.fromJson(Map<String, dynamic> json) {
    return NotesClassId(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

class NotesBoardId {
  final String? id;
  final String? name;
  final String? logo;
  final int? status;
  final String? classId;

  NotesBoardId({
    this.id,
    this.name,
    this.logo,
    this.status,
    this.classId,
  });

  factory NotesBoardId.fromJson(Map<String, dynamic> json) {
    return NotesBoardId(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      classId: json['class_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'status': status,
      'class_id': classId,
    };
  }
}

class NotesMediumId {
  final String? id;
  final String? name;
  final String? logo;
  final int? status;
  final String? classId;
  final String? boardId;

  NotesMediumId({
    this.id,
    this.name,
    this.logo,
    this.status,
    this.classId,
    this.boardId,
  });

  factory NotesMediumId.fromJson(Map<String, dynamic> json) {
    return NotesMediumId(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      classId: json['class_id'],
      boardId: json['board_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'status': status,
      'class_id': classId,
      'board_id': boardId,
    };
  }
}

class NotesSubjectId {
  final String? id;
  final String? name;
  final String? logo;
  final bool? isCompetitive;
  final bool? isNormal;
  final int? status;
  final String? classId;
  final String? boardId;
  final String? mediumId;
  final String? examId;

  NotesSubjectId({
    this.id,
    this.name,
    this.logo,
    this.isCompetitive,
    this.isNormal,
    this.status,
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
  });

  factory NotesSubjectId.fromJson(Map<String, dynamic> json) {
    return NotesSubjectId(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      status: json['status'],
      classId: json['class_id'],
      boardId: json['board_id'],
      mediumId: json['medium_id'],
      examId: json['exam_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'status': status,
      'class_id': classId,
      'board_id': boardId,
      'medium_id': mediumId,
      'exam_id': examId,
    };
  }
}

class NotesChapterId {
  final String? id;
  final String? name;
  final String? logo;
  final bool? isCompetitive;
  final bool? isNormal;
  final int? status;
  final String? classId;
  final String? boardId;
  final String? mediumId;
  final String? examId;
  final String? subjectId;

  NotesChapterId({
    this.id,
    this.name,
    this.logo,
    this.isCompetitive,
    this.isNormal,
    this.status,
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
    this.subjectId,
  });

  factory NotesChapterId.fromJson(Map<String, dynamic> json) {
    return NotesChapterId(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      status: json['status'],
      classId: json['class_id'],
      boardId: json['board_id'],
      mediumId: json['medium_id'],
      examId: json['exam_id'],
      subjectId: json['subject_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'status': status,
      'class_id': classId,
      'board_id': boardId,
      'medium_id': mediumId,
      'exam_id': examId,
      'subject_id': subjectId,
    };
  }
}

class Note {
  final String? title;
  final String? type;
  final String? url;

  Note({
    this.title,
    this.type,
    this.url,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'url': url,
    };
  }
}

class ShortNotesModel {
  final List<Notes>? data;

  ShortNotesModel({this.data});

  factory ShortNotesModel.fromJson(Map<String, dynamic> json) {
    return ShortNotesModel(
      data: json['data'] != null
          ? List<Notes>.from(json['data'].map((x) => Notes.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}
