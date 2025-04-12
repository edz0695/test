import 'package:flutter/material.dart';

class ExchangeWidget extends StatelessWidget {
  const ExchangeWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        shape: const StadiumBorder(side: BorderSide(color: Colors.indigo)),
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: Colors.indigo,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
