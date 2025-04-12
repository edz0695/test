import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';

class RecentActivityTile extends StatelessWidget {
  final RecentActivityModel data;

  const RecentActivityTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final amount = double.parse(data.amount);
    final formattedAmount = amount < 0 ? "$amount" : "+$amount";

    final textColor = amount < 0 ? Colors.red : Colors.green;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: ThemeColors.lightGrey,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          data.name,
          style: TextStyle(
              color: ThemeColors.darkBlueColor, fontWeight: FontWeight.w600),
        ),
        leading: CircleAvatar(child: Image.network(data.imagePath)),
        subtitle: Text(
          data.subtitle,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const SizedBox(
            height: 10,
          ),
          DefaultTextStyle(
            style: TextStyle(color: textColor),
            child: Text.rich(
              TextSpan(
                text: formattedAmount,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("${data.date} ${data.time}")
        ]),
      ),
    );
  }
}

class RecentActivityModel {
  final String name;
  final String imagePath;
  final String subtitle;
  final String amount;
  final String date;
  final String time;

  RecentActivityModel(
      {required this.name,
      required this.imagePath,
      required this.subtitle,
      required this.amount,
      required this.date,
      required this.time});
}
