import 'package:flutter/material.dart';

class GridItemTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onTap;
  const GridItemTile({super.key,required this.label,required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Icon(icon,size: 25,)),
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
