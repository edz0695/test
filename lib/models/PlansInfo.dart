class PlansInfo {
  PlansInfo({
      this.planName, 
      this.price, 
      this.validity, 
      this.talkTime, 
      this.validityDescription, 
      this.packageDescription, 
      this.planType,});

  PlansInfo.fromJson(dynamic json) {
    planName = json['planName'];
    price = json['price'];
    validity = json['validity'];
    talkTime = json['talkTime'];
    validityDescription = json['validityDescription'];
    packageDescription = json['packageDescription'];
    planType = json['planType'];
  }
  String? planName;
  String? price;
  String? validity;
  String? talkTime;
  String? validityDescription;
  String? packageDescription;
  String? planType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['planName'] = planName;
    map['price'] = price;
    map['validity'] = validity;
    map['talkTime'] = talkTime;
    map['validityDescription'] = validityDescription;
    map['packageDescription'] = packageDescription;
    map['planType'] = planType;
    return map;
  }

}