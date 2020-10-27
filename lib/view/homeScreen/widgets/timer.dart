import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interval_timer/providers/timerProvider.dart';
import 'package:provider/provider.dart';
import 'package:interval_timer/utils/sizeConfig.dart';

import 'circularButton.dart';

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 2,
                    vertical: SizeConfig.blockSizeVertical * 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
                child: Text(
                  "Round #${context.select((TimerProvider t) => t.currentRound)}",
                  style: TextStyle(color: Colors.white),
                )),
            Text(
                "${context.select((TimerProvider t) => t.trainingOrResting())}"),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Text(
              "${context.select((TimerProvider t) => t.timerDurationMMSS())}",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularButton(
                  icon: Icons.play_arrow,
                  onPressed: () {
                    context.read<TimerProvider>().play();
                  },
                ),
                CircularButton(
                  icon: Icons.pause,
                  onPressed: () {
                    context.read<TimerProvider>().pause();
                  },
                ),
                CircularButton(
                  icon: Icons.stop,
                  onPressed: () {
                    context.read<TimerProvider>().stop();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
