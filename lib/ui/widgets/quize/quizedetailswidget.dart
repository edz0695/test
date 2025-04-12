import 'package:flutter/material.dart';

import '../../../models/quizeModel.dart';

class QuizDetailsWidget extends StatefulWidget {
  final QuizeDetailsModel quizDetails;
  // final List<String> options;
  // final int correctAnswerIndex;
  // final String correctAnswerDescription;

  const QuizDetailsWidget({super.key,
    required this.quizDetails,
  });

  @override
  _QuizDetailsWidgetState createState() => _QuizDetailsWidgetState();
}

class _QuizDetailsWidgetState extends State<QuizDetailsWidget> {
  int? _selectedAnswerIndex;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.quizDetails.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: null,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            onTap: (){
              setState(() => _selectedAnswerIndex = 1);
              if(_selectedAnswerIndex == widget.quizDetails.correct_ans){
              }
              
            },
            title: Text(widget.quizDetails.opt_1),
            trailing: null,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: null,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            onTap: (){
              setState(() => _selectedAnswerIndex = 2);
              if(_selectedAnswerIndex == widget.quizDetails.correct_ans){
              }
              
            },
            title: Text(widget.quizDetails.opt_2),
            trailing: null,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: null,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            onTap: (){
              setState(() => _selectedAnswerIndex = 3);
              if(_selectedAnswerIndex == widget.quizDetails.correct_ans){
              }
              
            },
            title: Text(widget.quizDetails.opt_3),
            trailing: null,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: null,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            onTap: (){
              setState(() => _selectedAnswerIndex = 4);
              if(_selectedAnswerIndex == widget.quizDetails.correct_ans){
              }
            },
            title: Text(widget.quizDetails.opt_4),
            trailing: null,
          ),
        ),
        // ...widget.options
        //     .asMap()
        //     .entries
        //     .map((entry) => Container(
        //           margin: EdgeInsets.only(top: 8.0),
        //           decoration: BoxDecoration(
        //             color: _answered
        //                 ? entry.key == widget.correctAnswerIndex
        //                     ? Colors.green.withOpacity(0.5)
        //                     : _selectedAnswerIndex == entry.key
        //                         ? Colors.red.withOpacity(0.5)
        //                         : null
        //                 : null,
        //             borderRadius: BorderRadius.circular(8.0),
        //           ),
        //           child: ListTile(
        //             onTap: _answered
        //                 ? null
        //                 : () {
        //                     setState(() {
        //                       _selectedAnswerIndex = entry.key;
        //                     });
        //                   },
        //             title: Text(entry.value),
        //             trailing: _answered && entry.key == widget.correctAnswerIndex
        //                 ? Icon(Icons.check, color: Colors.green)
        //                 : null,
        //           ),
        //         ))
        //     .toList(),
        const SizedBox(height: 16.0),
        // ElevatedButton(
        //   onPressed: _selectedAnswerIndex == -1 || _answered
        //       ? null
        //       : () {
        //           setState(() {
        //             _answered = true;
        //           });
        //         },
        //   child: Text(_answered ? widget.quizedetails.correct_ans : 'Submit'),
        // ),
      ],
    );
  }
}
