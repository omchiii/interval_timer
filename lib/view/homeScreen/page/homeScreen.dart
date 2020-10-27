import 'package:flutter/material.dart';
import 'package:interval_timer/utils/sizeConfig.dart';
import 'package:interval_timer/view/homeScreen/widgets/durationOfBreak.dart';
import 'package:interval_timer/view/homeScreen/widgets/durationOfTraining.dart';
import 'package:interval_timer/view/homeScreen/widgets/numberOfIntervals.dart';
import 'package:interval_timer/view/homeScreen/widgets/quote.dart';
import 'package:interval_timer/view/homeScreen/widgets/timer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            NumberOfIntervals(),
            DurationOfTraining(),
            DurationOfBreak(),
            Spacer(),
            Timer(),
            Quote()
          ],
        ),
      ),
    );
  }
}
