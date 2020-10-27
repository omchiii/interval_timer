import 'package:flutter/material.dart';
import 'package:interval_timer/providers/timerProvider.dart';
import 'package:interval_timer/utils/sizeConfig.dart';
import 'package:provider/provider.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final onPressed;
  CircularButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(0),
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
        size: SizeConfig.blockSizeVertical * 4,
      ),
      shape: CircleBorder(),
    );
  }
}
