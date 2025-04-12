class SambhavTubeVideosModel {
  final List<SambhavTubeVideosData>? data;

  SambhavTubeVideosModel({
    required this.data,
  });

  factory SambhavTubeVideosModel.fromJson(Map<String, dynamic> json) {
    return SambhavTubeVideosModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => SambhavTubeVideosData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class SambhavTubeVideosData {
  SambhavTubeUser? user;
  final String? category;
  final String? thumbnail;
  final String? title;
  final String? video;
  final String? description;
  int views;
  int share;
  int like;
  final int status;
  final List<SambhavTubeVideosComment>? comments;
  final String? id;

  SambhavTubeVideosData({
    this.user,
    this.category,
    this.thumbnail,
    this.title,
    this.video,
    this.description,
    this.views = 0, // Default value
    this.share = 0, // Default value
    this.like = 0, // Default value
    this.status = 0, // Default value
    this.comments,
    this.id,
  });

  factory SambhavTubeVideosData.fromJson(Map<String, dynamic> json) {
    return SambhavTubeVideosData(
       user: json['user'] != null ? SambhavTubeUser.fromJson(json['user']) : null,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      video: json['video'] as String?,
      description: json['description'] as String?,
      views: (json['views'] is int)
          ? json['views'] as int
          : int.tryParse(json['views']?.toString() ?? '0') ?? 0, // Safe parsing
      share: (json['share'] is int)
          ? json['share'] as int
          : int.tryParse(json['share']?.toString() ?? '0') ?? 0, // Safe parsing
      like: (json['like'] is int)
          ? json['like'] as int
          : int.tryParse(json['like']?.toString() ?? '0') ?? 0, // Safe parsing
      status: (json['status'] is int)
          ? json['status'] as int
          : int.tryParse(json['status']?.toString() ?? '0') ??
              0, // Safe parsing
      comments: (json['comments'] as List<dynamic>?)
          ?.map((item) => SambhavTubeVideosComment.fromJson(item))
          .toList(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'category': category,
      'thumbnail': thumbnail,
      'title': title,
      'video': video,
      'description': description,
      'views': views,
      'share': share,
      'like': like,
      'status': status,
      'comments': comments?.map((item) => item.toJson()).toList(),
      'id': id,
    };
  }
}


class SambhavTubeUser {
  String? name;
  String? logo;
  String id;

  SambhavTubeUser({this.name, this.logo, required this.id});

  factory SambhavTubeUser.fromJson(Map<String, dynamic> json) {
    return SambhavTubeUser(
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logo': logo,
      'id': id,
    };
  }
}


// Comment Model
class SambhavTubeVideosComment {
  final String? comment;
  final String? postedBy;
  final String? id;

  SambhavTubeVideosComment({
    this.comment,
    this.postedBy,
    this.id,
  });

  factory SambhavTubeVideosComment.fromJson(Map<String, dynamic> json) {
    return SambhavTubeVideosComment(
      comment: json['comment'] as String?,
      postedBy: json['postedby'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'postedby': postedBy,
      '_id': id,
    };
  }
}
