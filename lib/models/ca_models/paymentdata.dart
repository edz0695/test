class paymentdataModel{

  final bool type;
  final String required;
  final String lable;
  final String id;
  paymentdataModel({required this.type, required this.required, required this.lable, required this.id});

  factory paymentdataModel.fromMap(Map<String,dynamic> map){
  return paymentdataModel(type: map['type'],
      required: map['required'],
      lable:  map['lable'],
      id: map['_id']);
  }

  Map<String,dynamic> ToMap(){
    return {
      'type':type,
      'required':required,
      'lable':lable,
      '_id':id,
    };
  }


}

//
// {
// "data": [
// {
// "ca_service_id": "657d5ca1787aa0ddc4291738",
// "form_data": [
// {
// "lable": "Enter Your Legal Name",
// "type": "text",
// "required": true,
// "_id": "657d5d9d787aa0ddc4291762"
// },
// {
// "lable": "Enter Email You Want To Associate With Company",
// "type": "text",
// "required": true,
// "_id": "657d5d9d787aa0ddc4291763"
// },
// {
// "lable": "Upload Electricity Bill",
// "type": "file",
// "required": true,
// "_id": "657d5d9d787aa0ddc4291764"
// },
// {
// "lable": "Upload Adhar Front ",
// "type": "file",
// "required": true,
// "_id": "657d5d9d787aa0ddc4291765"
// },
// {
// "lable": "Upload Pan Card Frot",
// "type": "file",
// "required": false,
// "_id": "657d5d9d787aa0ddc4291766"
// },
// {
// "lable": "Enter Your Address",
// "type": "text",
// "required": false,
// "_id": "657d5d9d787aa0ddc4291767"
// }
// ],
// "id": "657d5d9d787aa0ddc4291761"
// }
// ],
// "status": "success"
// }