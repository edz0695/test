// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherEduModelImpl _$$TeacherEduModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherEduModelImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$TeacherEduModelImplToJson(
        _$TeacherEduModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    _$TeacherImpl(
      id: json['_id'] as String? ?? '',
      imgId: json['imgId'] as String? ?? '',
      userid: json['userid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      banner: (json['banner'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fee: json['fee'] as String? ?? '',
      availableSlots: (json['availableSlots'] as List<dynamic>?)
              ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      classDuration: json['classDuration'] as String? ?? '',
      teachingMode: (json['teachingMode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      language: (json['language'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      demoVideos: (json['demoVideos'] as List<dynamic>?)
              ?.map((e) => DemoVideo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      village: json['village'] as String? ?? '',
      district: json['district'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      state: json['state'] as String? ?? '',
      country: json['country'] as String? ?? '',
      address: json['address'] as String? ?? '',
      location: json['location'] == null
          ? const TeacherLocation(type: '', coordinates: [])
          : TeacherLocation.fromJson(json['location'] as Map<String, dynamic>),
      ratings: (json['ratings'] as List<dynamic>?)
              ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      dist: json['dist'] == null
          ? const Dist(calculated: 0.0)
          : Dist.fromJson(json['dist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imgId': instance.imgId,
      'userid': instance.userid,
      'name': instance.name,
      'image': instance.image,
      'banner': instance.banner,
      'fee': instance.fee,
      'availableSlots': instance.availableSlots,
      'classDuration': instance.classDuration,
      'teachingMode': instance.teachingMode,
      'language': instance.language,
      'demoVideos': instance.demoVideos,
      'email': instance.email,
      'mobile': instance.mobile,
      'bio': instance.bio,
      'subjects': instance.subjects,
      'village': instance.village,
      'district': instance.district,
      'zipcode': instance.zipcode,
      'state': instance.state,
      'country': instance.country,
      'address': instance.address,
      'location': instance.location,
      'ratings': instance.ratings,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'dist': instance.dist,
    };

_$SlotImpl _$$SlotImplFromJson(Map<String, dynamic> json) => _$SlotImpl(
      day: json['day'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$SlotImplToJson(_$SlotImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'id': instance.id,
    };

_$DemoVideoImpl _$$DemoVideoImplFromJson(Map<String, dynamic> json) =>
    _$DemoVideoImpl(
      title: json['title'] as String? ?? '',
      video: json['video'] as String? ?? '',
    );

Map<String, dynamic> _$$DemoVideoImplToJson(_$DemoVideoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'video': instance.video,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      type: json['type'] as String? ?? '',
      coordinates: (json['coordinates'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      star: (json['star'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
      postedby: json['postedby'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'star': instance.star,
      'comment': instance.comment,
      'postedby': instance.postedby,
      'id': instance.id,
    };

_$DistImpl _$$DistImplFromJson(Map<String, dynamic> json) => _$DistImpl(
      calculated: (json['calculated'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DistImplToJson(_$DistImpl instance) =>
    <String, dynamic>{
      'calculated': instance.calculated,
    };
