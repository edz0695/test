import 'package:flutter/material.dart';

import '../Widgets/recentActivityTile.dart';

class RecentActivityData extends ChangeNotifier {
  final List<RecentActivityModel> _data = [
    RecentActivityModel(
        name: "Prateek Singh",
        imagePath:
            "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Free-Image.png",
        subtitle: "Send Money",
        amount: "588",
        date: "25-02-20024",
        time: "2:00pm"),
    RecentActivityModel(
        name: "Prateek Singh",
        imagePath:
            "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
        subtitle: "Send Money",
        amount: "-200",
        date: "25-02-20024",
        time: "2:00pm"),
    RecentActivityModel(
        name: "Prateek Singh",
        imagePath:
            "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
        subtitle: "Send Money",
        amount: "588",
        date: "25-02-20024",
        time: "2:00pm"),
    RecentActivityModel(
        name: "Prateek Singh",
        imagePath:
            "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
        subtitle: "Send Money",
        amount: "588",
        date: "25-02-20024",
        time: "2:00pm")
  ];

  List<RecentActivityModel> get data => _data;
}
