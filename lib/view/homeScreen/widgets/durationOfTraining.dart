import 'package:flutter/material.dart';
import 'package:interval_timer/providers/timerProvider.dart';
import 'package:provider/provider.dart';
import 'package:interval_timer/utils/sizeConfig.dart';

import 'circularButton.dart';

class DurationOfTraining extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
        child: Column(
          children: [
            Text("Duration of each Training"),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text(
              "${context.select((TimerProvider t) => t.durationOfTrainingMMSS())}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularButton(
                  icon: Icons.add,
                  onPressed: () {
                    context.read<TimerProvider>().incrementTrainingTime();
                  },
                ),
                CircularButton(
                    icon: Icons.remove,
                    onPressed: () {
                      context.read<TimerProvider>().decrementTrainingTime();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
