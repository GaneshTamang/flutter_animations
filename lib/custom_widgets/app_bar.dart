import 'package:flutter/material.dart';

class MCAppBAr extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const MCAppBAr({
    super.key,
    required this.appBarTitle,
  });
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(appBarTitle),
    );
  }
}
