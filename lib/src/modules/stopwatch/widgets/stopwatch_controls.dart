import 'package:flutter/material.dart';

import 'package:stopwatches_plus/src/shared/widgets/static_icon_button.dart';
import 'package:stopwatches_plus/src/shared/widgets/toggle_icon_button.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class StopwatchControls extends StatelessWidget {
  final bool isRunning;
  final void Function() onPlayButton;
  final void Function() onResetButton;
  const StopwatchControls({
    super.key,
    required this.onPlayButton,
    required this.onResetButton,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return OverflowBar(
      spacing: t.Spacing.s24,
      children: [
        ToggleIconButton(
          icon1: Icons.play_arrow_rounded,
          icon2: Icons.pause,
          size: screenSize.width * 0.2,
          onPressed: onPlayButton,
        ),
        StaticIconButton(
          size: screenSize.width * 0.2,
          icon: Icons.restart_alt_rounded,
          onPressed: isRunning ? null : onResetButton,
        ),
      ],
    );
  }
}
