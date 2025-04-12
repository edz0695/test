
class BatchModel {
    BatchModel({
        required this.id,
        required this.classes,
        required this.subject,
        required this.banner,
        required this.description,
        required this.start_time,
        required this.end_time  ,
        required this.start_date,
        required this.end_date,
    });

    String id;
    String classes;
    String description;
    String banner;
    String subject;
    String start_time;
    String end_time;
    String start_date;
    String end_date;

    factory BatchModel.fromMap(Map<dynamic, dynamic> map) {
    return BatchModel(
      id: map['id'] ?? "",
      classes: map['class']??"",
      description: map['description']??"",
      banner: map['banner']??"",
      subject: map['subject']??"",
      start_time: map['start_time']??"",
      end_time: map['end_time']??"",
      start_date: map['start_date']??"",
      end_date: map['end_date']??"",
    );
  }
}
