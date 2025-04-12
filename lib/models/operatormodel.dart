import 'package:flutter/cupertino.dart';

class OperatorModel {
  String id;
  String type;
  String category;
  String name;
  String region;
  String regionCode;
  String fetchOption;
  String state;
  String billerEffectiveFrom;
  String billerEffctvTo;
  String supportBillValidation;
  String billerLogoURL;
  List<CustomerParametersModel> customerParameters;
  String code;


  OperatorModel({
    required this.id,
    required this.type,
    required this.category,
    required this.name,
    required this.region,
    required this.regionCode,
    required this.fetchOption,
    required this.state,
    required this.billerEffectiveFrom,
    required this.billerEffctvTo,
    required this.supportBillValidation,
    required this.billerLogoURL,
    required this.customerParameters,
    required this.code,

  });


  factory OperatorModel.fromMap(Map<dynamic, dynamic> map) {

    final customerParameters = ( map["customerParams"]!=null)?map["customerParams"] as List:[];
    return OperatorModel(
      id: map['billerId'] ?? "",
      type: map['type']??"",
      category: map['category']??"",
      name: map['billerName']??"",
      region: map['region']??"",
      regionCode: map['regionCode']??"",
      fetchOption: map['fetchOption']??"",
      state: map['state']??"",
      billerEffectiveFrom: map['billerEffctvFrom']??"",
      billerEffctvTo: map['billerEffctvTo']??"",
      supportBillValidation: map['supportBillValidation']??"",
      billerLogoURL: map['billerLogoURL']??"",
      customerParameters: customerParameters.map((e) => CustomerParametersModel.fromMap(e)).toList(),
      code: map['code']??"",


    );
  }







}


class CustomerParametersModel {
  String regex;
  String visibility;
  String dataType;
  String minLength;
  String optional;
  String paramName;
  String maxLength;
  List<String> values;
  TextEditingController? controller;



  CustomerParametersModel({
    required this.regex,
    required this.visibility,
    required this.minLength,
    required this.optional,
    required this.paramName,
    required this.dataType,
    required this.maxLength,
    required this.values,
     this.controller
  });


  factory CustomerParametersModel.fromMap(Map<dynamic, dynamic> map) {
    return CustomerParametersModel(
      regex: map['regex'] ?? "",
      visibility: map['visibility'].toString(),
      dataType: map['dataType']??"",
      minLength: map['minLength'].toString(),
      optional: map['optional'].toString(),
      paramName: map['paramName']??"",
      values: map["values"]!=null?map["values"].toString().split(","):[],
      maxLength: map['maxLength'].toString()

    );
  }

}