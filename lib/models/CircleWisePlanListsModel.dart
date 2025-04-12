import 'Payload.dart';

class CircleWisePlanListsModel {
  CircleWisePlanListsModel({
      this.code, 
      this.status, 
      this.payload,});

  CircleWisePlanListsModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(Payload.fromJson(v));
      });
    }
  }
  int? code;
  String? status;
  List<Payload>? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (payload != null) {
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}