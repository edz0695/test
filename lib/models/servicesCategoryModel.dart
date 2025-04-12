


class ServiceCategoryModel {
  String title;
  List<ServiceModel> services;



  ServiceCategoryModel({
    required this.title,
    required this.services,
  });





  // factory ServiceCategoryModel.fromMap(Map<dynamic, dynamic> map) {
  //   final transactions = map['transaction'] as List;
  //   return ServiceCategoryModel(
  //     balance: double.tryParse(map['balance'])??0,
  //     totalEarning: double.tryParse(map['total-earning'])??0,
  //     transactions: transactions.map((e) => WalletTransactionModel.fromMap(e)).toList(),
  //   );
  // }







}








class ServiceModel {
  String serviceName;
  String? serviceType;
  String svgIcon;
  Function ()? onTap;


  ServiceModel({
    required this.serviceName,
    this.serviceType,
    required this.svgIcon,
    this.onTap,

  });





  // factory ServiceModel.fromMap(Map<dynamic, dynamic> map) {
  //   return ServiceModel(
  //     id: map['id'] ?? "",
  //     userId: map['user_id']??"",
  //     amount: map['amount']??"",
  //     message: map['message']??"",
  //     status: map['status']??"",
  //     date: map['date_created']??"",
  //   );
  // }







}

