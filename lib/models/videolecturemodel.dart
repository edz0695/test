

class VideoLectureModel {
  String id;
  String description;
  String? video;
  String? image;
    VideoLectureModel({
        required this.id,
        required this.description,
        this.video,
        this.image,
    });



    factory VideoLectureModel.fromMap(Map<dynamic, dynamic> map) {
    return VideoLectureModel(
      id: map['id'] ?? "",
      description: map['description']??"",
      video: map['video']??"",
      image: map['image']??"",
    );
  }
}
