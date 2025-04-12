import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  // final Function()? onSearchTap;
  final PreferredSizeWidget? bottom;
  final double? size;
  final VoidCallback? onArrowClick;

  final double? fs;

  const AppBarWidget({
    super.key,
    required this.title,
    this.bottom,
    this.size,
    this.actions,
    this.onArrowClick,
    this.fs,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      bottom: bottom,
      titleTextStyle: TextStyle(
          fontSize: fs ?? MediaQuery.of(context).size.width * .045,
          color: ThemeColors.primaryBlueColor,
          fontWeight: FontWeight.bold),
      titleSpacing: 5,
      actions: actions,
      leading: InkWell(
        borderRadius: BorderRadius.circular(1000),
        onTap: onArrowClick ?? () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8),
          child: Icon(
            Icons.arrow_left,
            color: ThemeColors.primaryBlueColor,
          ),
        ),
      ),
    ); // Your custom widget implementation.
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 120);
}
