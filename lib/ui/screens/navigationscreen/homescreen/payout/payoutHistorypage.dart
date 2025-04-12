import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PayoutHistoryPage extends StatefulWidget {
  const PayoutHistoryPage({super.key});

  @override
  State<PayoutHistoryPage> createState() => _PayoutHistoryPageState();
}

class _PayoutHistoryPageState extends State<PayoutHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        itemBuilder: (_, index) {
          return Container(
            height: 75,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05), blurRadius: 10)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Send To Bob Account Holder",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        DateFormat('yyyy-MM-dd ').format(DateTime.now()),
                        style: TextStyle(color: Colors.grey.withOpacity(.5)),
                      )
                    ],
                  ),
                ),
                const Text("₹ 500",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17))
              ],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 15);
        },
        itemCount: 10);
  }
}
