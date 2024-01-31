import 'package:flutter/material.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class StaticIconButton extends StatefulWidget {
  final IconData icon;

  final double size;
  final Color color;
  final void Function()? onPressed;

  const StaticIconButton(
      {super.key,
      required this.icon,
      this.size = 30,
      this.color = t.Color.white,
      this.onPressed});

  @override
  State<StaticIconButton> createState() => _StaticIconButtonState();
}

class _StaticIconButtonState extends State<StaticIconButton> {
  @override
  Widget build(BuildContext context) {
    final widgetColor =
        widget.onPressed != null ? widget.color : widget.color.withOpacity(0.5);
    return GestureDetector(
        onTap: () {
          widget.onPressed?.call();
        },
        child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(t.BorderRadius.r8),
                border: Border.all(color: widgetColor, width: 2)),
            child: Icon(
              widget.icon,
              color: widgetColor,
              size: widget.size,
            )));
  }
}
