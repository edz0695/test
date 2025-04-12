import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payapp/themes/colors.dart';

class SelectionWidget extends StatefulWidget {
  const SelectionWidget({super.key});

  @override
  _SelectionWidgetState createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  int _selectedItemIndex = -1;

  List<Map<String, dynamic>> items = [
    {
      'name': 'Mastercard',
      'image': 'assets/payments/cc-mastercard.svg',
      'text': '**** **** **** 3461',
    },
    {
      'name': 'Paypal',
      'image': 'assets/payments/paypal.svg',
      'text': 'wilson.casper@bernice.in',
    },
    {
      'name': 'Visa',
      'image': 'assets/payments/visa.svg',
      'text': '**** **** **** 5967',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.length,
        (index) {
          bool isSelected = _selectedItemIndex == index;

          return GestureDetector(
            onTap: () {
              if (_selectedItemIndex == index) {
                setState(() {
                  _selectedItemIndex = -1;

                });
              } else {
                setState(() {
                  _selectedItemIndex = index;

                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 18),
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? ThemeColors.primaryBlueColor : Colors.white,
                  width: isSelected ? 4 : 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(
                      items[index]['image'],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            items[index]['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: Text(
                            items[index]['text'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked_outlined
                        : Icons.radio_button_off_outlined,
                    color: isSelected ? ThemeColors.primaryBlueColor : Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
