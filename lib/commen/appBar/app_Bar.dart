import 'package:flutter/material.dart';

import '../theme/color_schemes.g.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? leadingIcons; // قائمة الأيقونات في اليسار
  final List<Widget>? trailingIcons; // قائمة الأيقونات في اليمين
  final PreferredSizeWidget? bottom;


  const AppBarWidget({
    Key? key,
    required this.title,
    this.leadingIcons,
    this.trailingIcons,
    this.bottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: leadingIcons != null ? Row(children: leadingIcons!) : null,
      actions: trailingIcons,
      bottom: bottom,
      title: Text(
        title,
        style: TextStyle(
          color: lightColorScheme.primary,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: 'Recurisive'
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}