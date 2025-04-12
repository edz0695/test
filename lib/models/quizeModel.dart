class QuizeModel {
  String id;
  String title;
    QuizeModel({
        required this.id,
        required this.title,
    });



    factory QuizeModel.fromMap(Map<dynamic, dynamic> map) {
    return QuizeModel(
      id: map['id'] ?? "",
      title: map['title']??"",
    );
  }
}



class QuizeDetailsModel {
  String id;
  String question;
  String opt_1;
  String opt_2;
  String opt_3;
  String opt_4;
  String correct_ans;
  String ans_description;
    QuizeDetailsModel({
        required this.id,
        required this.question,
        required this.opt_1,
        required this.opt_2,
        required this.opt_3,
        required this.opt_4,
        required this.correct_ans,
        required this.ans_description,
    });



    factory QuizeDetailsModel.fromMap(Map<dynamic, dynamic> map) {
    return QuizeDetailsModel(
      id: map['id'] ?? "",
      question: map['question']??"",
      opt_1: map['opt_1']??"",
      opt_2: map['opt_2']??"",
      opt_3: map['opt_3']??"",
      opt_4: map['opt_4']??"",
      correct_ans: map['correct_ans']??"",
      ans_description: map['ans_description']??"",
    );
  }
}
