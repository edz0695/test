import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/helper.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
    required this.w,
    required this.qf,
    required this.tf,
    required this.gap,
    required this.price,
    this.isCart = false,
    this.isDecrement = false,
  });

  final ValueNotifier<int> quantity;
  final Function() increment, decrement;
  final double w, qf, tf, gap, price;
  final bool? isCart, isDecrement;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: quantity,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isCart!
                  ? const SizedBox()
                  : Row(
                      children: [
                        Text(
                          " $price * ${quantity.value} = ${(price * quantity.value).toStringAsFixed(2)} ₹ ",
                          style: isCart!
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.blueGrey)
                              : Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
              isCart!
                  ? Column(
                      children: [
                        SizedBox(
                          width: w,
                          height: w,
                          child: Card(
                              shape: const StadiumBorder(),
                              color: Colors.indigo,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    overlayColor: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                onPressed: increment,
                                child: Text(
                                  "+",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: tf, color: Colors.white),
                                ),
                              )),
                        ),
                        Text(
                          quantity.value.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: qf, fontWeight: FontWeight.bold),
                        ),
                        if (isDecrement!)
                          SizedBox(
                            width: w,
                            height: w,
                            child: Card(
                                shape: const StadiumBorder(),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      overlayColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  onPressed: decrement,
                                  child: Text(
                                    "-",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: tf),
                                  ),
                                )),
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: w,
                          height: w,
                          child: Card(
                              shape: const StadiumBorder(),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    overlayColor: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                onPressed: decrement,
                                child: Text(
                                  "-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: tf),
                                ),
                              )),
                        ),
                        width(gap),
                        Text(
                          quantity.value.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: qf),
                        ),
                        width(gap),
                        SizedBox(
                          width: w,
                          height: w,
                          child: Card(
                              shape: const StadiumBorder(),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    overlayColor: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                onPressed: increment,
                                child: Text(
                                  "+",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: tf),
                                ),
                              )),
                        ),
                      ],
                    ),
            ],
          );
        });
  }
}
