import 'PlansInfo.dart';

class CircleWisePlanLists {
  CircleWisePlanLists({
      this.circleName, 
      this.circleId, 
      this.plansInfo,});

  CircleWisePlanLists.fromJson(dynamic json) {
    circleName = json['circleName'];
    circleId = json['circleId'];
    if (json['plansInfo'] != null) {
      plansInfo = [];
      json['plansInfo'].forEach((v) {
        plansInfo?.add(PlansInfo.fromJson(v));
      });
    }
  }
  String? circleName;
  String? circleId;
  List<PlansInfo>? plansInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['circleName'] = circleName;
    map['circleId'] = circleId;
    if (plansInfo != null) {
      map['plansInfo'] = plansInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}