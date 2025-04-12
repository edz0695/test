class CAOrderDetailsModel {
  final String title;
  final String serviceId;
  final String logo;
  final List<FormDetail> formDetails;
  final String orderId;
  final String payPrice;
  final String caRemarks;
  final String serviceCompletedDetails;
  final String status;
  final String id;

  CAOrderDetailsModel({
    required this.title,
    required this.serviceId,
    required this.logo,
    required this.formDetails,
    required this.orderId,
    required this.payPrice,
    required this.caRemarks,
    required this.serviceCompletedDetails,
    required this.status,
    required this.id,
  });

  factory CAOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return CAOrderDetailsModel(
      title: json['data']['title'] as String,
      serviceId: json['data']['serviceid'] as String,
      logo: json['data']['logo'] as String,
      formDetails: (json['data']['formdetails'] as List)
          .map((detail) => FormDetail.fromJson(detail))
          .toList(),
      orderId: json['data']['orderid'] as String,
      payPrice: json['data']['pay_price'] as String,
      caRemarks: json['data']['ca_remarks'] as String,
      serviceCompletedDetails:
          json['data']['servis_completed_details'] as String,
      status: json['data']['status'] as String,
      id: json['data']['id'] as String,
    );
  }
}

class FormDetail {
  final String label;
  final String type;
  final String value;
  final String id;

  FormDetail({
    required this.label,
    required this.type,
    required this.value,
    required this.id,
  });

  factory FormDetail.fromJson(Map<String, dynamic> json) {
    return FormDetail(
      label: json['label'] as String,
      type: json['type'] as String,
      value: json['value'] as String,
      id: json['_id'] as String,
    );
  }
}
