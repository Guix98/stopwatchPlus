import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatches_plus/modules/stopwatch/widgets/stopwatch_container.dart';
import 'package:stopwatches_plus/modules/stopwatch/widgets/stopwatch_controls.dart';
import 'package:stopwatches_plus/shared/widgets/responsive_layout.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Duration _currentTime = Duration.zero;
  List<Duration> _pauseTimes = [];
  bool _isRunning = false;
  Timer? timer;

  void _startTimer() {
    _isRunning = true;
    timer = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
      setState(() {
        _currentTime = _currentTime + Duration(milliseconds: 10);
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      timer?.cancel();
      timer = null;
      _pauseTimes.add(_currentTime);
      // _startPauseTimer();
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _currentTime = Duration.zero;
      _pauseTimes = [];
      timer?.cancel();
      timer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronómetro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: t.Spacing.s16),
          child: ResponsiveLayout(
            children: <Widget>[
              Column(
                children: [
                  StopwatchContainer(currentTime: _currentTime),
                  const SizedBox(
                    height: 20,
                  ),
                  StopwatchControls(
                    onPlayButton: () {
                      if (_isRunning) {
                        _stopTimer();
                      } else {
                        _startTimer();
                      }
                    },
                    onResetButton: _resetTimer,
                    isRunning: _isRunning,
                  ),
                ],
              ),
              const SizedBox(
                width: t.Spacing.s16,
                height: t.Spacing.s16,
              ),
              Expanded(
                child: Container(
                  color: t.Color.black3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: t.Spacing.s16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Pausas:',
                        style: TextStyle(fontSize: 18),
                        textScaler: _isRunning
                            ? MediaQuery.textScalerOf(context)
                            : null,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _pauseTimes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  'Pausa ${index + 1}: ${_pauseTimes[index].inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_pauseTimes[index].inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
