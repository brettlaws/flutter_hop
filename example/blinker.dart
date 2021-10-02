import 'dart:async';
import 'package:flutter/material.dart';

// Good luck testing logic used by the widget...

class Blinker extends StatefulWidget {
  const Blinker(
      {required this.text,
      required this.primary,
      required this.secondary,
      required this.period,
      required this.onPress})
      : super(key: const Key('Blinker'));

  final String text;
  final Color primary;
  final Color secondary;
  final Duration period;
  final Function() onPress;

  @override
  State<StatefulWidget> createState() => _BlinkerState();
}

class _BlinkerState extends State<Blinker> {
  bool _blink = false;

  @override
  void initState() {
    Timer.periodic(widget.period, (timer) {
      if (mounted) {
        setState(() => _blink = !_blink);
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPress();
      },
      style: ElevatedButton.styleFrom(
        primary: _blink ? widget.primary : widget.secondary,
      ),
      child: Text(widget.text),
    );
  }
}
