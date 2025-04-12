import 'package:flutter/material.dart';

class HireBottomNavBar extends StatelessWidget {
  const HireBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Recharge',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Post Job',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support),
          label: 'Support',
        ),
      ],
    );
  }
}
