import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600.0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
  }
}
