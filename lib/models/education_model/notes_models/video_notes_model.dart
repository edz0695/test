class VideoNotesModel {
  final List<VideoNoteData>? data;

  VideoNotesModel({this.data});

  factory VideoNotesModel.fromJson(Map<String, dynamic> json) {
    return VideoNotesModel(
      data: json['data'] != null
          ? List<VideoNoteData>.from(
              json['data'].map((x) => VideoNoteData.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class VideoNoteData {
  final VideoNoteClassId? classId;
  final VideoNoteBoardId? boardId;
  final VideoNoteMediumId? mediumId;
  final String? examId;
  final VideoNoteSubjectId? subjectId;
  final VideoNoteChapterId? chapterId;
  final String? videoType;
  final bool? isCompetitive;
  final bool? isNormal;
  final List<NoteVideo>? noteVideo;
  final int? status;
  final String? id;

  VideoNoteData({
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
    this.subjectId,
    this.chapterId,
    this.videoType,
    this.isCompetitive,
    this.isNormal,
    this.noteVideo,
    this.status,
    this.id,
  });

  factory VideoNoteData.fromJson(Map<String, dynamic> json) {
    return VideoNoteData(
      classId: json['class_id'] != null
          ? VideoNoteClassId.fromJson(json['class_id'])
          : null,
      boardId: json['board_id'] != null
          ? VideoNoteBoardId.fromJson(json['board_id'])
          : null,
      mediumId: json['medium_id'] != null
          ? VideoNoteMediumId.fromJson(json['medium_id'])
          : null,
      examId: json['exam_id'],
      subjectId: json['subject_id'] != null
          ? VideoNoteSubjectId.fromJson(json['subject_id'])
          : null,
      chapterId: json['chapter_id'] != null
          ? VideoNoteChapterId.fromJson(json['chapter_id'])
          : null,
      videoType: json['video_type'],
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      noteVideo: json['noteVideo'] != null
          ? List<NoteVideo>.from(
              json['noteVideo'].map((x) => NoteVideo.fromJson(x)))
          : null,
      status: json['status'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId?.toJson(),
      'board_id': boardId?.toJson(),
      'medium_id': mediumId?.toJson(),
      'exam_id': examId,
      'subject_id': subjectId?.toJson(),
      'chapter_id': chapterId?.toJson(),
      'video_type': videoType,
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'noteVideo': noteVideo?.map((x) => x.toJson()).toList(),
      'status': status,
      'id': id,
    };
  }
}

class VideoNoteClassId {
  final String? name;
  final String? id;

  VideoNoteClassId({this.name, this.id});

  factory VideoNoteClassId.fromJson(Map<String, dynamic> json) {
    return VideoNoteClassId(
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

class VideoNoteBoardId {
  final String? classId;
  final String? name;
  final String? logo;
  final int? status;
  final String? id;

  VideoNoteBoardId({
    this.classId,
    this.name,
    this.logo,
    this.status,
    this.id,
  });

  factory VideoNoteBoardId.fromJson(Map<String, dynamic> json) {
    return VideoNoteBoardId(
      classId: json['class_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'name': name,
      'logo': logo,
      'status': status,
      'id': id,
    };
  }
}

class VideoNoteMediumId {
  final String? classId;
  final String? boardId;
  final String? name;
  final String? logo;
  final int? status;
  final String? id;

  VideoNoteMediumId({
    this.classId,
    this.boardId,
    this.name,
    this.logo,
    this.status,
    this.id,
  });

  factory VideoNoteMediumId.fromJson(Map<String, dynamic> json) {
    return VideoNoteMediumId(
      classId: json['class_id'],
      boardId: json['board_id'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'board_id': boardId,
      'name': name,
      'logo': logo,
      'status': status,
      'id': id,
    };
  }
}

class VideoNoteSubjectId {
  final String? classId;
  final String? boardId;
  final String? mediumId;
  final String? examId;
  final bool? isCompetitive;
  final bool? isNormal;
  final String? name;
  final String? logo;
  final int? status;
  final String? id;

  VideoNoteSubjectId({
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
    this.isCompetitive,
    this.isNormal,
    this.name,
    this.logo,
    this.status,
    this.id,
  });

  factory VideoNoteSubjectId.fromJson(Map<String, dynamic> json) {
    return VideoNoteSubjectId(
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

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'board_id': boardId,
      'medium_id': mediumId,
      'exam_id': examId,
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'name': name,
      'logo': logo,
      'status': status,
      'id': id,
    };
  }
}

class VideoNoteChapterId {
  final String? classId;
  final String? boardId;
  final String? mediumId;
  final String? examId;
  final String? subjectId;
  final bool? isCompetitive;
  final bool? isNormal;
  final String? name;
  final String? logo;
  final int? status;
  final String? id;

  VideoNoteChapterId({
    this.classId,
    this.boardId,
    this.mediumId,
    this.examId,
    this.subjectId,
    this.isCompetitive,
    this.isNormal,
    this.name,
    this.logo,
    this.status,
    this.id,
  });

  factory VideoNoteChapterId.fromJson(Map<String, dynamic> json) {
    return VideoNoteChapterId(
      classId: json['class_id'],
      boardId: json['board_id'],
      mediumId: json['medium_id'],
      examId: json['exam_id'],
      subjectId: json['subject_id'],
      isCompetitive: json['is_competitive'],
      isNormal: json['is_normal'],
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'board_id': boardId,
      'medium_id': mediumId,
      'exam_id': examId,
      'subject_id': subjectId,
      'is_competitive': isCompetitive,
      'is_normal': isNormal,
      'name': name,
      'logo': logo,
      'status': status,
      'id': id,
    };
  }
}

class NoteVideo {
  final String? title;
  final String? video;
  final String? type;

  NoteVideo({this.title, this.video, this.type});

  factory NoteVideo.fromJson(Map<String, dynamic> json) {
    return NoteVideo(
      title: json['title'],
      video: json['video'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'video': video,
      'type': type,
    };
  }
}
