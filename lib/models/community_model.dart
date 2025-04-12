import '../config/apiconfig.dart';

class CommunityGroups {
  String id;
  String group_name;
  String icon;

  CommunityGroups({
    required this.id,
    required this.group_name,
    required this.icon
  });



  factory CommunityGroups.fromMap(Map<dynamic, dynamic> map) {
    return CommunityGroups(
      id: map['id'] ?? "",
      group_name: map['group_name']??"",
      icon:"${Constants.forImg}/${map['icon']??""}"
    );
  }
}



class CommunityPosts {
  String id;
  List<CommunityPoPosts> post;
  String group_id;

  CommunityPosts({
    required this.id,
    required this.post,
    required this.group_id
  });

  factory CommunityPosts.fromMap(Map<dynamic, dynamic> map) {
    final posts = (map['post']??[]) as List;
    return CommunityPosts(
      id: map['id'] ?? "",
      post: posts.map((e) => CommunityPoPosts.fromMap(e)).toList(),
      group_id: map['group_id']??""
    );
  }
}

class CommunityPoPosts {
  String post;
  String image;

  CommunityPoPosts({
    required this.post,
    required this.image
  });

  factory CommunityPoPosts.fromMap(Map<dynamic, dynamic> map) {
    return CommunityPoPosts(
      post: map['post']??"",
      image: map['image']??""
    );
  }
}




