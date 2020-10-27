import 'package:flutter/material.dart';
import 'package:interval_timer/providers/timerProvider.dart';
import 'package:provider/provider.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final onPressed;
  CircularButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 2.0,
      fillColor: context.select((TimerProvider t) => t.disableButtons) &&
              (icon == Icons.add || icon == Icons.remove)
          ? Colors.grey
          : Colors.white,
      child: Icon(
        icon,
      ),
      shape: CircleBorder(),
    );
  }
}
