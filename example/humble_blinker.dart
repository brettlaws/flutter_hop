import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hop/flutter_hop.dart';

bool testBlinkerLogic() {
  bool pressed = false;
  final logic = BlinkerLogic(
      text: 'some-text',
      primary: Colors.red,
      secondary: Colors.grey,
      period: const Duration(seconds: 1),
      onPress: () {
        pressed = true;
      });
  if (logic.text != 'some-text') return false;
  if (logic.primary != Colors.red) return false;
  if (logic.secondary != Colors.grey) return false;
  if (logic.period != const Duration(seconds: 1)) return false;
  if (pressed == false) return false;
  return true;
}

class BlinkerLogic {
  BlinkerLogic(
      {required this.text,
      required this.primary,
      required this.secondary,
      required this.period,
      required this.onPress});

  final String text;
  final Color primary;
  final Color secondary;
  final Duration period;
  final Function() onPress;
}

class Blinker extends HumbleStatefulWidget<BlinkerLogic> {
  const Blinker(BlinkerLogic logic) : super(logic, const Key('Blinker'));

  @override
  State<StatefulWidget> createState() => _BlinkerState();
}

class _BlinkerState extends HumbleState<BlinkerLogic> {
  bool _blink = false;

  @override
  void initState() {
    Timer.periodic(logic.period, (timer) {
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
        logic.onPress();
      },
      style: ElevatedButton.styleFrom(
        primary: _blink ? logic.primary : logic.secondary,
      ),
      child: Text(logic.text),
    );
  }
}
