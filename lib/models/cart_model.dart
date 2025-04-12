
class CartModel {
    CartModel({
        required this.id,
        required this.type,
        required this.obj_type,
        required this.obj_id,
        required this.user_id,
    });

    String id;
    String type;
    String obj_type;
    String obj_id;
    String user_id;

    factory CartModel.fromMap(Map<dynamic, dynamic> map) {
    return CartModel(
      id: map['id'] ?? "",
      type: map['type']??"",
      obj_type: map['obj_type']??"",
      obj_id: map['obj_id']??"",
      user_id: map['user_id']??"",
    );
  }
}
