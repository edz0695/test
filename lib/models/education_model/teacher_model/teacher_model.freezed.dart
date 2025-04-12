// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherEduModel _$TeacherEduModelFromJson(Map<String, dynamic> json) {
  return _TeacherEduModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherEduModel {
  List<Teacher> get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TeacherEduModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherEduModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherEduModelCopyWith<TeacherEduModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherEduModelCopyWith<$Res> {
  factory $TeacherEduModelCopyWith(
          TeacherEduModel value, $Res Function(TeacherEduModel) then) =
      _$TeacherEduModelCopyWithImpl<$Res, TeacherEduModel>;
  @useResult
  $Res call({List<Teacher> data, String status});
}

/// @nodoc
class _$TeacherEduModelCopyWithImpl<$Res, $Val extends TeacherEduModel>
    implements $TeacherEduModelCopyWith<$Res> {
  _$TeacherEduModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherEduModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Teacher>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherEduModelImplCopyWith<$Res>
    implements $TeacherEduModelCopyWith<$Res> {
  factory _$$TeacherEduModelImplCopyWith(_$TeacherEduModelImpl value,
          $Res Function(_$TeacherEduModelImpl) then) =
      __$$TeacherEduModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Teacher> data, String status});
}

/// @nodoc
class __$$TeacherEduModelImplCopyWithImpl<$Res>
    extends _$TeacherEduModelCopyWithImpl<$Res, _$TeacherEduModelImpl>
    implements _$$TeacherEduModelImplCopyWith<$Res> {
  __$$TeacherEduModelImplCopyWithImpl(
      _$TeacherEduModelImpl _value, $Res Function(_$TeacherEduModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherEduModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$TeacherEduModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Teacher>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherEduModelImpl implements _TeacherEduModel {
  const _$TeacherEduModelImpl(
      {final List<Teacher> data = const [], this.status = ''})
      : _data = data;

  factory _$TeacherEduModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherEduModelImplFromJson(json);

  final List<Teacher> _data;
  @override
  @JsonKey()
  List<Teacher> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'TeacherEduModel(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherEduModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), status);

  /// Create a copy of TeacherEduModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherEduModelImplCopyWith<_$TeacherEduModelImpl> get copyWith =>
      __$$TeacherEduModelImplCopyWithImpl<_$TeacherEduModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherEduModelImplToJson(
      this,
    );
  }
}

abstract class _TeacherEduModel implements TeacherEduModel {
  const factory _TeacherEduModel(
      {final List<Teacher> data, final String status}) = _$TeacherEduModelImpl;

  factory _TeacherEduModel.fromJson(Map<String, dynamic> json) =
      _$TeacherEduModelImpl.fromJson;

  @override
  List<Teacher> get data;
  @override
  String get status;

  /// Create a copy of TeacherEduModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherEduModelImplCopyWith<_$TeacherEduModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return _Teacher.fromJson(json);
}

/// @nodoc
mixin _$Teacher {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get imgId => throw _privateConstructorUsedError;
  String get userid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get banner => throw _privateConstructorUsedError;
  String get fee => throw _privateConstructorUsedError;
  List<Slot> get availableSlots => throw _privateConstructorUsedError;
  String get classDuration => throw _privateConstructorUsedError;
  List<String> get teachingMode => throw _privateConstructorUsedError;
  List<String> get language => throw _privateConstructorUsedError;
  List<DemoVideo> get demoVideos => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  List<String> get subjects => throw _privateConstructorUsedError;
  String get village => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get zipcode => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  TeacherLocation get location => throw _privateConstructorUsedError;
  List<Rating> get ratings => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  Dist get dist => throw _privateConstructorUsedError;

  /// Serializes this Teacher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherCopyWith<Teacher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherCopyWith<$Res> {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) then) =
      _$TeacherCopyWithImpl<$Res, Teacher>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String imgId,
      String userid,
      String name,
      String image,
      List<String> banner,
      String fee,
      List<Slot> availableSlots,
      String classDuration,
      List<String> teachingMode,
      List<String> language,
      List<DemoVideo> demoVideos,
      String email,
      String mobile,
      String bio,
      List<String> subjects,
      String village,
      String district,
      String zipcode,
      String state,
      String country,
      String? address,
      TeacherLocation location,
      List<Rating> ratings,
      int status,
      String createdAt,
      String updatedAt,
      Dist dist});

  $LocationCopyWith<$Res> get location;
  $DistCopyWith<$Res> get dist;
}

/// @nodoc
class _$TeacherCopyWithImpl<$Res, $Val extends Teacher>
    implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgId = null,
    Object? userid = null,
    Object? name = null,
    Object? image = null,
    Object? banner = null,
    Object? fee = null,
    Object? availableSlots = null,
    Object? classDuration = null,
    Object? teachingMode = null,
    Object? language = null,
    Object? demoVideos = null,
    Object? email = null,
    Object? mobile = null,
    Object? bio = null,
    Object? subjects = null,
    Object? village = null,
    Object? district = null,
    Object? zipcode = null,
    Object? state = null,
    Object? country = null,
    Object? address = freezed,
    Object? location = null,
    Object? ratings = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? dist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgId: null == imgId
          ? _value.imgId
          : imgId // ignore: cast_nullable_to_non_nullable
              as String,
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      availableSlots: null == availableSlots
          ? _value.availableSlots
          : availableSlots // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
      classDuration: null == classDuration
          ? _value.classDuration
          : classDuration // ignore: cast_nullable_to_non_nullable
              as String,
      teachingMode: null == teachingMode
          ? _value.teachingMode
          : teachingMode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as List<String>,
      demoVideos: null == demoVideos
          ? _value.demoVideos
          : demoVideos // ignore: cast_nullable_to_non_nullable
              as List<DemoVideo>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      village: null == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as TeacherLocation,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      dist: null == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as Dist,
    ) as $Val);
  }

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistCopyWith<$Res> get dist {
    return $DistCopyWith<$Res>(_value.dist, (value) {
      return _then(_value.copyWith(dist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherImplCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$$TeacherImplCopyWith(
          _$TeacherImpl value, $Res Function(_$TeacherImpl) then) =
      __$$TeacherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String imgId,
      String userid,
      String name,
      String image,
      List<String> banner,
      String fee,
      List<Slot> availableSlots,
      String classDuration,
      List<String> teachingMode,
      List<String> language,
      List<DemoVideo> demoVideos,
      String email,
      String mobile,
      String bio,
      List<String> subjects,
      String village,
      String district,
      String zipcode,
      String state,
      String country,
      String? address,
      TeacherLocation location,
      List<Rating> ratings,
      int status,
      String createdAt,
      String updatedAt,
      Dist dist});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $DistCopyWith<$Res> get dist;
}

/// @nodoc
class __$$TeacherImplCopyWithImpl<$Res>
    extends _$TeacherCopyWithImpl<$Res, _$TeacherImpl>
    implements _$$TeacherImplCopyWith<$Res> {
  __$$TeacherImplCopyWithImpl(
      _$TeacherImpl _value, $Res Function(_$TeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgId = null,
    Object? userid = null,
    Object? name = null,
    Object? image = null,
    Object? banner = null,
    Object? fee = null,
    Object? availableSlots = null,
    Object? classDuration = null,
    Object? teachingMode = null,
    Object? language = null,
    Object? demoVideos = null,
    Object? email = null,
    Object? mobile = null,
    Object? bio = null,
    Object? subjects = null,
    Object? village = null,
    Object? district = null,
    Object? zipcode = null,
    Object? state = null,
    Object? country = null,
    Object? address = freezed,
    Object? location = null,
    Object? ratings = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? dist = null,
  }) {
    return _then(_$TeacherImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgId: null == imgId
          ? _value.imgId
          : imgId // ignore: cast_nullable_to_non_nullable
              as String,
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      availableSlots: null == availableSlots
          ? _value._availableSlots
          : availableSlots // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
      classDuration: null == classDuration
          ? _value.classDuration
          : classDuration // ignore: cast_nullable_to_non_nullable
              as String,
      teachingMode: null == teachingMode
          ? _value._teachingMode
          : teachingMode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value._language
          : language // ignore: cast_nullable_to_non_nullable
              as List<String>,
      demoVideos: null == demoVideos
          ? _value._demoVideos
          : demoVideos // ignore: cast_nullable_to_non_nullable
              as List<DemoVideo>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      village: null == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as TeacherLocation,
      ratings: null == ratings
          ? _value._ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      dist: null == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as Dist,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherImpl implements _Teacher {
  const _$TeacherImpl(
      {@JsonKey(name: "_id") this.id = '',
      this.imgId = '',
      this.userid = '',
      this.name = '',
      this.image = '',
      final List<String> banner = const [],
      this.fee = '',
      final List<Slot> availableSlots = const [],
      this.classDuration = '',
      final List<String> teachingMode = const [],
      final List<String> language = const [],
      final List<DemoVideo> demoVideos = const [],
      this.email = '',
      this.mobile = '',
      this.bio = '',
      final List<String> subjects = const [],
      this.village = '',
      this.district = '',
      this.zipcode = '',
      this.state = '',
      this.country = '',
      this.address = '',
      this.location = const TeacherLocation(type: '', coordinates: []),
      final List<Rating> ratings = const [],
      this.status = 0,
      this.createdAt = '',
      this.updatedAt = '',
      this.dist = const Dist(calculated: 0.0)})
      : _banner = banner,
        _availableSlots = availableSlots,
        _teachingMode = teachingMode,
        _language = language,
        _demoVideos = demoVideos,
        _subjects = subjects,
        _ratings = ratings;

  factory _$TeacherImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey()
  final String imgId;
  @override
  @JsonKey()
  final String userid;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String image;
  final List<String> _banner;
  @override
  @JsonKey()
  List<String> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  @JsonKey()
  final String fee;
  final List<Slot> _availableSlots;
  @override
  @JsonKey()
  List<Slot> get availableSlots {
    if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableSlots);
  }

  @override
  @JsonKey()
  final String classDuration;
  final List<String> _teachingMode;
  @override
  @JsonKey()
  List<String> get teachingMode {
    if (_teachingMode is EqualUnmodifiableListView) return _teachingMode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teachingMode);
  }

  final List<String> _language;
  @override
  @JsonKey()
  List<String> get language {
    if (_language is EqualUnmodifiableListView) return _language;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_language);
  }

  final List<DemoVideo> _demoVideos;
  @override
  @JsonKey()
  List<DemoVideo> get demoVideos {
    if (_demoVideos is EqualUnmodifiableListView) return _demoVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_demoVideos);
  }

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String mobile;
  @override
  @JsonKey()
  final String bio;
  final List<String> _subjects;
  @override
  @JsonKey()
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  @JsonKey()
  final String village;
  @override
  @JsonKey()
  final String district;
  @override
  @JsonKey()
  final String zipcode;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String? address;
  @override
  @JsonKey()
  final TeacherLocation location;
  final List<Rating> _ratings;
  @override
  @JsonKey()
  List<Rating> get ratings {
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ratings);
  }

  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  @override
  @JsonKey()
  final Dist dist;

  @override
  String toString() {
    return 'Teacher(id: $id, imgId: $imgId, userid: $userid, name: $name, image: $image, banner: $banner, fee: $fee, availableSlots: $availableSlots, classDuration: $classDuration, teachingMode: $teachingMode, language: $language, demoVideos: $demoVideos, email: $email, mobile: $mobile, bio: $bio, subjects: $subjects, village: $village, district: $district, zipcode: $zipcode, state: $state, country: $country, address: $address, location: $location, ratings: $ratings, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, dist: $dist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imgId, imgId) || other.imgId == imgId) &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            const DeepCollectionEquality()
                .equals(other._availableSlots, _availableSlots) &&
            (identical(other.classDuration, classDuration) ||
                other.classDuration == classDuration) &&
            const DeepCollectionEquality()
                .equals(other._teachingMode, _teachingMode) &&
            const DeepCollectionEquality().equals(other._language, _language) &&
            const DeepCollectionEquality()
                .equals(other._demoVideos, _demoVideos) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.village, village) || other.village == village) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dist, dist) || other.dist == dist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        imgId,
        userid,
        name,
        image,
        const DeepCollectionEquality().hash(_banner),
        fee,
        const DeepCollectionEquality().hash(_availableSlots),
        classDuration,
        const DeepCollectionEquality().hash(_teachingMode),
        const DeepCollectionEquality().hash(_language),
        const DeepCollectionEquality().hash(_demoVideos),
        email,
        mobile,
        bio,
        const DeepCollectionEquality().hash(_subjects),
        village,
        district,
        zipcode,
        state,
        country,
        address,
        location,
        const DeepCollectionEquality().hash(_ratings),
        status,
        createdAt,
        updatedAt,
        dist
      ]);

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      __$$TeacherImplCopyWithImpl<_$TeacherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherImplToJson(
      this,
    );
  }
}

abstract class _Teacher implements Teacher {
  const factory _Teacher(
      {@JsonKey(name: "_id") final String id,
      final String imgId,
      final String userid,
      final String name,
      final String image,
      final List<String> banner,
      final String fee,
      final List<Slot> availableSlots,
      final String classDuration,
      final List<String> teachingMode,
      final List<String> language,
      final List<DemoVideo> demoVideos,
      final String email,
      final String mobile,
      final String bio,
      final List<String> subjects,
      final String village,
      final String district,
      final String zipcode,
      final String state,
      final String country,
      final String? address,
      final TeacherLocation location,
      final List<Rating> ratings,
      final int status,
      final String createdAt,
      final String updatedAt,
      final Dist dist}) = _$TeacherImpl;

  factory _Teacher.fromJson(Map<String, dynamic> json) = _$TeacherImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get imgId;
  @override
  String get userid;
  @override
  String get name;
  @override
  String get image;
  @override
  List<String> get banner;
  @override
  String get fee;
  @override
  List<Slot> get availableSlots;
  @override
  String get classDuration;
  @override
  List<String> get teachingMode;
  @override
  List<String> get language;
  @override
  List<DemoVideo> get demoVideos;
  @override
  String get email;
  @override
  String get mobile;
  @override
  String get bio;
  @override
  List<String> get subjects;
  @override
  String get village;
  @override
  String get district;
  @override
  String get zipcode;
  @override
  String get state;
  @override
  String get country;
  @override
  String? get address;
  @override
  TeacherLocation get location;
  @override
  List<Rating> get ratings;
  @override
  int get status;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  Dist get dist;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return _Slot.fromJson(json);
}

/// @nodoc
mixin _$Slot {
  String get day => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this Slot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlotCopyWith<Slot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) then) =
      _$SlotCopyWithImpl<$Res, Slot>;
  @useResult
  $Res call({String day, String startTime, String endTime, String id});
}

/// @nodoc
class _$SlotCopyWithImpl<$Res, $Val extends Slot>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlotImplCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$$SlotImplCopyWith(
          _$SlotImpl value, $Res Function(_$SlotImpl) then) =
      __$$SlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, String startTime, String endTime, String id});
}

/// @nodoc
class __$$SlotImplCopyWithImpl<$Res>
    extends _$SlotCopyWithImpl<$Res, _$SlotImpl>
    implements _$$SlotImplCopyWith<$Res> {
  __$$SlotImplCopyWithImpl(_$SlotImpl _value, $Res Function(_$SlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? id = null,
  }) {
    return _then(_$SlotImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlotImpl implements _Slot {
  const _$SlotImpl(
      {this.day = '', this.startTime = '', this.endTime = '', this.id = ''});

  factory _$SlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlotImplFromJson(json);

  @override
  @JsonKey()
  final String day;
  @override
  @JsonKey()
  final String startTime;
  @override
  @JsonKey()
  final String endTime;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'Slot(day: $day, startTime: $startTime, endTime: $endTime, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlotImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, startTime, endTime, id);

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlotImplCopyWith<_$SlotImpl> get copyWith =>
      __$$SlotImplCopyWithImpl<_$SlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlotImplToJson(
      this,
    );
  }
}

abstract class _Slot implements Slot {
  const factory _Slot(
      {final String day,
      final String startTime,
      final String endTime,
      final String id}) = _$SlotImpl;

  factory _Slot.fromJson(Map<String, dynamic> json) = _$SlotImpl.fromJson;

  @override
  String get day;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get id;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlotImplCopyWith<_$SlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DemoVideo _$DemoVideoFromJson(Map<String, dynamic> json) {
  return _DemoVideo.fromJson(json);
}

/// @nodoc
mixin _$DemoVideo {
  String get title => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;

  /// Serializes this DemoVideo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DemoVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DemoVideoCopyWith<DemoVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoVideoCopyWith<$Res> {
  factory $DemoVideoCopyWith(DemoVideo value, $Res Function(DemoVideo) then) =
      _$DemoVideoCopyWithImpl<$Res, DemoVideo>;
  @useResult
  $Res call({String title, String video});
}

/// @nodoc
class _$DemoVideoCopyWithImpl<$Res, $Val extends DemoVideo>
    implements $DemoVideoCopyWith<$Res> {
  _$DemoVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DemoVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? video = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DemoVideoImplCopyWith<$Res>
    implements $DemoVideoCopyWith<$Res> {
  factory _$$DemoVideoImplCopyWith(
          _$DemoVideoImpl value, $Res Function(_$DemoVideoImpl) then) =
      __$$DemoVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String video});
}

/// @nodoc
class __$$DemoVideoImplCopyWithImpl<$Res>
    extends _$DemoVideoCopyWithImpl<$Res, _$DemoVideoImpl>
    implements _$$DemoVideoImplCopyWith<$Res> {
  __$$DemoVideoImplCopyWithImpl(
      _$DemoVideoImpl _value, $Res Function(_$DemoVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DemoVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? video = null,
  }) {
    return _then(_$DemoVideoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DemoVideoImpl implements _DemoVideo {
  const _$DemoVideoImpl({this.title = '', this.video = ''});

  factory _$DemoVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DemoVideoImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String video;

  @override
  String toString() {
    return 'DemoVideo(title: $title, video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemoVideoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, video);

  /// Create a copy of DemoVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DemoVideoImplCopyWith<_$DemoVideoImpl> get copyWith =>
      __$$DemoVideoImplCopyWithImpl<_$DemoVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DemoVideoImplToJson(
      this,
    );
  }
}

abstract class _DemoVideo implements DemoVideo {
  const factory _DemoVideo({final String title, final String video}) =
      _$DemoVideoImpl;

  factory _DemoVideo.fromJson(Map<String, dynamic> json) =
      _$DemoVideoImpl.fromJson;

  @override
  String get title;
  @override
  String get video;

  /// Create a copy of DemoVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DemoVideoImplCopyWith<_$DemoVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherLocation _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<TeacherLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(
          TeacherLocation value, $Res Function(TeacherLocation) then) =
      _$LocationCopyWithImpl<$Res, TeacherLocation>;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends TeacherLocation>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$LocationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {this.type = '', final List<double> coordinates = const []})
      : _coordinates = coordinates;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  final List<double> _coordinates;
  @override
  @JsonKey()
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'Location(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements TeacherLocation {
  const factory _Location({final String type, final List<double> coordinates}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get type;
  @override
  List<double> get coordinates;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
mixin _$Rating {
  int get star => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get postedby => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this Rating to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res, Rating>;
  @useResult
  $Res call({int star, String comment, String postedby, String id});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res, $Val extends Rating>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? star = null,
    Object? comment = null,
    Object? postedby = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      postedby: null == postedby
          ? _value.postedby
          : postedby // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingImplCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$$RatingImplCopyWith(
          _$RatingImpl value, $Res Function(_$RatingImpl) then) =
      __$$RatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int star, String comment, String postedby, String id});
}

/// @nodoc
class __$$RatingImplCopyWithImpl<$Res>
    extends _$RatingCopyWithImpl<$Res, _$RatingImpl>
    implements _$$RatingImplCopyWith<$Res> {
  __$$RatingImplCopyWithImpl(
      _$RatingImpl _value, $Res Function(_$RatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? star = null,
    Object? comment = null,
    Object? postedby = null,
    Object? id = null,
  }) {
    return _then(_$RatingImpl(
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      postedby: null == postedby
          ? _value.postedby
          : postedby // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingImpl implements _Rating {
  const _$RatingImpl(
      {this.star = 0, this.comment = '', this.postedby = '', this.id = ''});

  factory _$RatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingImplFromJson(json);

  @override
  @JsonKey()
  final int star;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String postedby;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'Rating(star: $star, comment: $comment, postedby: $postedby, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingImpl &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.postedby, postedby) ||
                other.postedby == postedby) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, star, comment, postedby, id);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      __$$RatingImplCopyWithImpl<_$RatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingImplToJson(
      this,
    );
  }
}

abstract class _Rating implements Rating {
  const factory _Rating(
      {final int star,
      final String comment,
      final String postedby,
      final String id}) = _$RatingImpl;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$RatingImpl.fromJson;

  @override
  int get star;
  @override
  String get comment;
  @override
  String get postedby;
  @override
  String get id;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dist _$DistFromJson(Map<String, dynamic> json) {
  return _Dist.fromJson(json);
}

/// @nodoc
mixin _$Dist {
  double get calculated => throw _privateConstructorUsedError;

  /// Serializes this Dist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistCopyWith<Dist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistCopyWith<$Res> {
  factory $DistCopyWith(Dist value, $Res Function(Dist) then) =
      _$DistCopyWithImpl<$Res, Dist>;
  @useResult
  $Res call({double calculated});
}

/// @nodoc
class _$DistCopyWithImpl<$Res, $Val extends Dist>
    implements $DistCopyWith<$Res> {
  _$DistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculated = null,
  }) {
    return _then(_value.copyWith(
      calculated: null == calculated
          ? _value.calculated
          : calculated // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistImplCopyWith<$Res> implements $DistCopyWith<$Res> {
  factory _$$DistImplCopyWith(
          _$DistImpl value, $Res Function(_$DistImpl) then) =
      __$$DistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double calculated});
}

/// @nodoc
class __$$DistImplCopyWithImpl<$Res>
    extends _$DistCopyWithImpl<$Res, _$DistImpl>
    implements _$$DistImplCopyWith<$Res> {
  __$$DistImplCopyWithImpl(_$DistImpl _value, $Res Function(_$DistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculated = null,
  }) {
    return _then(_$DistImpl(
      calculated: null == calculated
          ? _value.calculated
          : calculated // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistImpl implements _Dist {
  const _$DistImpl({this.calculated = 0.0});

  factory _$DistImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistImplFromJson(json);

  @override
  @JsonKey()
  final double calculated;

  @override
  String toString() {
    return 'Dist(calculated: $calculated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistImpl &&
            (identical(other.calculated, calculated) ||
                other.calculated == calculated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, calculated);

  /// Create a copy of Dist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistImplCopyWith<_$DistImpl> get copyWith =>
      __$$DistImplCopyWithImpl<_$DistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistImplToJson(
      this,
    );
  }
}

abstract class _Dist implements Dist {
  const factory _Dist({final double calculated}) = _$DistImpl;

  factory _Dist.fromJson(Map<String, dynamic> json) = _$DistImpl.fromJson;

  @override
  double get calculated;

  /// Create a copy of Dist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistImplCopyWith<_$DistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
