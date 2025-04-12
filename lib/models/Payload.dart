import 'package:payapp/models/CircleWisePlanLists.dart';

class Payload {
  Payload({
      this.operatorName, 
      this.operatorId, 
      this.circleWisePlanLists,});

  Payload.fromJson(dynamic json) {
    operatorName = json['operatorName'];
    operatorId = json['operatorId'];
    if (json['circleWisePlanLists'] != null) {
      circleWisePlanLists = [];
      json['circleWisePlanLists'].forEach((v) {
        circleWisePlanLists?.add(CircleWisePlanLists.fromJson(v));
      });
    }
  }
  String? operatorName;
  String? operatorId;
  List<CircleWisePlanLists>? circleWisePlanLists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['operatorName'] = operatorName;
    map['operatorId'] = operatorId;
    if (circleWisePlanLists != null) {
      map['circleWisePlanLists'] = circleWisePlanLists?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}