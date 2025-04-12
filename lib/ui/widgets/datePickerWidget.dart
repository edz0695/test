import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DatePickerWidget extends StatefulWidget {
  late String? pickedDate;
  final String label;

  DatePickerWidget({
    super.key,
    this.pickedDate,
    required this.label,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // widget.pickedDate = picked;
        widget.pickedDate = "${selectedDate.toLocal()}".split(' ')[0];

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15),
          child: Text(
            "${widget.label[0].toUpperCase()}${widget.label.substring(1).toLowerCase()}",
            // widget.title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: MediaQuery.of(context).size.width * .04,
                letterSpacing: 1,
                fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Material(
          color: Colors.white,

          borderRadius:const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius:const BorderRadius.all(Radius.circular(10)),
            onTap: (){

              _selectDate(context);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                width: double.infinity,
                decoration: const BoxDecoration(  borderRadius:BorderRadius.all(Radius.circular(10)),),
                child: Text("${selectedDate.toLocal()}".split(' ')[0])),
          ),
        ),
      ],
    );
  }
}
