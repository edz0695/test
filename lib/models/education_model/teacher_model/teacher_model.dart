import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_model.freezed.dart';
part 'teacher_model.g.dart';

@freezed
class TeacherEduModel with _$TeacherEduModel {
  const factory TeacherEduModel({
    @Default([]) List<Teacher> data,
    @Default('') String status,
  }) = _TeacherEduModel;

  factory TeacherEduModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherEduModelFromJson(json);
}

@freezed
class Teacher with _$Teacher {
  const factory Teacher({
    @JsonKey(name: "_id") @Default('') String id,
    @Default('') String imgId,
    @Default('') String userid,
    @Default('') String name,
    @Default('') String image,
    @Default([]) List<String> banner,
    @Default('') String fee,
    @Default([]) List<Slot> availableSlots,
    @Default('') String classDuration,
    @Default([]) List<String> teachingMode,
    @Default([]) List<String> language,
    @Default([]) List<DemoVideo> demoVideos,
    @Default('') String email,
    @Default('') String mobile,
    @Default('') String bio,
    @Default([]) List<String> subjects,
    @Default('') String village,
    @Default('') String district,
    @Default('') String zipcode,
    @Default('') String state,
    @Default('') String country,
    @Default('') String? address,
    @Default(TeacherLocation(type: '', coordinates: []))
    TeacherLocation location,
    @Default([]) List<Rating> ratings,
    @Default(0) int status,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default(Dist(calculated: 0.0)) Dist dist,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    @Default('') String day,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default('') String id,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}

@freezed
class DemoVideo with _$DemoVideo {
  const factory DemoVideo({
    @Default('') String title,
    @Default('') String video,
  }) = _DemoVideo;

  factory DemoVideo.fromJson(Map<String, dynamic> json) =>
      _$DemoVideoFromJson(json);
}

@freezed
class TeacherLocation with _$Location {
  const factory TeacherLocation({
    @Default('') String type,
    @Default([]) List<double> coordinates,
  }) = _Location;

  factory TeacherLocation.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    @Default(0) int star,
    @Default('') String comment,
    @Default('') String postedby,
    @Default('') String id,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Dist with _$Dist {
  const factory Dist({
    @Default(0.0) double calculated,
  }) = _Dist;

  factory Dist.fromJson(Map<String, dynamic> json) => _$DistFromJson(json);
}
