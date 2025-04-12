


class PlansModel {
  String operatorName;
  String operatorId;
  String circleName;
  String circleId;
 List<PlanModel> plans;


  PlansModel({
    required this.operatorName,
    required this.operatorId,
    required this.circleName,
    required this.circleId,
    required this.plans,


  });





  factory PlansModel.fromMap(Map<dynamic, dynamic> map) {
    final plans = map["circleWisePlanLists"][0]["plansInfo"] as List;
    return PlansModel(
      operatorName: map['operatorName'] ?? "",
      operatorId: map['operatorId']??"",
      circleName: map["circleWisePlanLists"][0]['circleName']??"",
      circleId: map["circleWisePlanLists"][0]['circleId']??"",
      plans: plans.map((e) => PlanModel.fromMap(e)).toList(),

    );
  }







}







class PlanModel {
  String planName;
  String price;
  String validity;
  String talkTime;
  String validityDescription;
  String packageDescription;
  String planType;


  PlanModel({
    required this.planName,
    required this.price,
    required this.validity,
    required this.talkTime,
    required this.validityDescription,
    required this.packageDescription,
    required this.planType,



  });





  factory PlanModel.fromMap(Map<dynamic, dynamic> map) {

    return PlanModel(
      planName: map['planName'] ?? "",
      price: map['price']??"",
      validity: map['validity']??"",
      talkTime: map['talkTime']??"",
      validityDescription: map['validityDescription']??"",
      packageDescription: map['packageDescription']??"",
      planType: map['planType']??"",

    );
  }







}

