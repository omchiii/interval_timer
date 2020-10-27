import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerProvider extends ChangeNotifier {
  int numOfIntervals = 1;
  int breakTime = 60;
  int trainingTime = 60;
  int currentRound = 1;

  bool currentlyBreak = false;
  bool disableButtons = false;

  Timer timer;
  int breakTime2 = 60; //copyOfTrainingTime
  int trainingTime2 = 60; //copyOfBreakTime

  //Interval Logic

  incrementInterval() {
    if (!disableButtons) {
      numOfIntervals += 1;
      notifyListeners();
    }
  }

  decrementInterval() {
    if (numOfIntervals > 1 && !disableButtons) {
      numOfIntervals -= 1;
      notifyListeners();
    }
  }

  //

  //Duration of Training Logic

  durationOfTrainingMMSS() {
    String sDuration =
        "${Duration(seconds: trainingTime).inMinutes.remainder(60).toString().padLeft(2, '0')}:${(Duration(seconds: trainingTime).inSeconds.remainder(60).toString().padLeft(2, '0'))}";
    return sDuration;
  }

  incrementTrainingTime() {
    if (trainingTime <= 58 * 60 && !disableButtons) {
      trainingTime += 60;
      trainingTime2 += 60;
      notifyListeners();
    }
  }

  decrementTrainingTime() {
    if (trainingTime >= 2 * 60 && !disableButtons) {
      trainingTime -= 60;
      trainingTime2 -= 60;
      notifyListeners();
    }
  }

  //

  //Duration of Break Logic

  durationOfBreakMMSS() {
    String sDuration =
        "${Duration(seconds: breakTime).inMinutes.remainder(60).toString().padLeft(2, '0')}:${(Duration(seconds: breakTime).inSeconds.remainder(60).toString().padLeft(2, '0'))}";
    return sDuration;
  }

  incrementBreakTime() {
    if (breakTime <= 58 * 60 && !disableButtons && numOfIntervals > 1) {
      breakTime += 60;
      breakTime2 += 60;
      notifyListeners();
    }
  }

  decrementBreakTime() {
    if (breakTime >= 2 * 60 && !disableButtons) {
      breakTime -= 60;
      breakTime2 -= 60;

      notifyListeners();
    }
  }

  //

  trainingOrResting() {
    if (timer != null) {
      if (timer.isActive) {
        if (currentlyBreak) {
          return "currently resting";
        } else {
          return "currently training";
        }
      } else {
        return "lets train!";
      }
    } else {
      return "lets train!";
    }
  }

  //Timer logic

  timerDurationMMSS() {
    if (!currentlyBreak) {
      String sDuration =
          "${Duration(seconds: trainingTime2).inMinutes.remainder(60).toString().padLeft(2, '0')}:${(Duration(seconds: trainingTime2).inSeconds.remainder(60).toString().padLeft(2, '0'))}";
      return sDuration;
    }
    String sDuration =
        "${Duration(seconds: breakTime2).inMinutes.remainder(60).toString().padLeft(2, '0')}:${(Duration(seconds: breakTime2).inSeconds.remainder(60).toString().padLeft(2, '0'))}";
    return sDuration;
  }

  play() {
    disableButtons = true;
    notifyListeners();
    if (timer != null && timer.isActive) {
    } else {
      const oneSec = const Duration(seconds: 1);
      timer = Timer.periodic(oneSec, (timer) {
        if (!currentlyBreak) {
          if (trainingTime2 == 1) {
            if (currentRound < numOfIntervals) {
              currentlyBreak = true;

              trainingTime2 = trainingTime;
              notifyListeners();
            } else {
              trainingTime2 -= 1;
              timer.cancel();
              reset();
              notifyListeners();
            }
          } else {
            trainingTime2 -= 1;
            notifyListeners();
          }
        } else {
          if (breakTime2 == 1) {
            currentlyBreak = false;
            breakTime2 = breakTime;
            currentRound += 1;
            notifyListeners();
          } else {
            breakTime2 -= 1;
            notifyListeners();
          }
        }
      });
    }
  }

  pause() {
    if (timer != null) {
      timer.cancel();
    }
  }

  stop() {
    if (timer != null) {
      timer.cancel();
      reset();
    }
  }

  //helperFunctions
  reset() {
    currentRound = 1;
    currentlyBreak = false;
    disableButtons = false;
    trainingTime2 = trainingTime;
    breakTime2 = breakTime;
    notifyListeners();
  }

  //

  //
}
