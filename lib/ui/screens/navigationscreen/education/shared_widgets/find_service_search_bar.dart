import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';

class FindServiceSearchBar extends StatelessWidget {
  const FindServiceSearchBar({super.key, this.hint});

  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint ?? "Find service",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.blueAccent.withOpacity(0.1),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: Container(
              width: 20,
              decoration: BoxDecoration(
                color: ThemeColors.primaryBlueColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
