import 'package:flutter/material.dart';
import 'package:interval_timer/providers/timerProvider.dart';
import 'package:interval_timer/utils/sizeConfig.dart';
import 'package:provider/provider.dart';

import 'circularButton.dart';

class NumberOfIntervals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 8),
        child: Column(
          children: [
            Text("Number of intervals"),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Text(
              "${context.select((TimerProvider t) => t.numOfIntervals)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularButton(
                    icon: Icons.add,
                    onPressed: () {
                      context.read<TimerProvider>().incrementInterval();
                    }),
                CircularButton(
                    icon: Icons.remove,
                    onPressed: () {
                      context.read<TimerProvider>().decrementInterval();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
