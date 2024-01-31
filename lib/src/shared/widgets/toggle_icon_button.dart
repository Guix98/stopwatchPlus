import 'package:flutter/material.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class ToggleIconButton extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final double size;
  final Color color;
  final void Function()? onPressed;

  const ToggleIconButton(
      {super.key,
      required this.icon1,
      required this.icon2,
      this.size = 30,
      this.color = t.Color.white,
      this.onPressed});

  @override
  State<ToggleIconButton> createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton> {
  bool _isIcon1Visible = true;

  @override
  Widget build(BuildContext context) {
    final widgetColor =
        widget.onPressed != null ? widget.color : widget.color.withOpacity(0.5);
    return GestureDetector(
        onTap: () {
          widget.onPressed?.call();
          setState(() {
            _isIcon1Visible = !_isIcon1Visible;
          });
        },
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(t.BorderRadius.r8),
              border: Border.all(color: widgetColor, width: 2)),
          child: _isIcon1Visible
              ? Icon(
                  widget.icon1,
                  color: widgetColor,
                  size: widget.size,
                )
              : Icon(
                  widget.icon2,
                  color: widgetColor,
                  size: widget.size,
                ),
        ));
  }
}
