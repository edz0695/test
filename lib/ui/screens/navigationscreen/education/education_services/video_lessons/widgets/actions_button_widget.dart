import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionsButtonWidget extends StatelessWidget {
  const ActionsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.zero,
                          bottomRight: Radius.zero))),
              onPressed: () {},
              label: Text("5.5K"),
              icon: Icon(Icons.thumb_up),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(48, 40),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.zero,
                          bottomLeft: Radius.zero))),
              onPressed: () {},
              label: Text(""),
              icon: Icon(Icons.thumb_down_outlined),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                    width: Get.size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column());
              },
            );
          },
          label: Text("Comments"),
          icon: Icon(CupertinoIcons.chat_bubble),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text("Share"),
          icon: Icon(CupertinoIcons.share),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text("Save"),
          icon: Icon(Icons.download),
        ),
      ],
    );
  }
}
