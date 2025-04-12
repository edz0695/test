class MessaeModel {
  String id;
  String sender_id;
  String reciever_id;
  String message;
  String created_at;
  String reciever_name;
  String messageType;
  
  MessaeModel({
      required this.id,
      required this.sender_id,
      required this.reciever_id,
      required this.message,
      required this.created_at,
      required this.reciever_name,
      required this.messageType,
  });



    factory MessaeModel.fromMap(Map<dynamic, dynamic> map) {
    return MessaeModel(
      id: map['id'] ?? "",
      sender_id: map['sender_id']??"",
      reciever_id: map['reciever_id']??"",
      message: map['message']??"",
      created_at: map['created_at']??"",
      reciever_name: map['sender_name']??"",
      messageType:map['messageType']??"",
    );
  }
}
