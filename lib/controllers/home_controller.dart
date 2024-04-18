import 'package:get/state_manager.dart';
import 'dart:async';

class HomeController extends GetxController {
  bool stopTimer = true;
  final stopwatch = Stopwatch();
  late var timeElapsed = stopwatch.elapsed.toString().obs;
  var buttonText = 'Start'.obs;

  void updateButton() =>
      buttonText.value = stopwatch.isRunning ? 'Stop' : 'Start';

  void updateTimer() => timeElapsed.value = stopwatch.elapsed.toString();

  void toggleTimer() {
    if (stopwatch.isRunning) {
      stopTimer = true;
      stopwatch.stop();
      updateButton();
    } else {
      startTimer();
      stopwatch.start();
      updateButton();
    }
  }

  void resetTimer() {
    stopwatch.stop();
    stopwatch.reset();
    updateTimer();
  }

  void startTimer() {
    stopTimer = false;
    Timer timer =
        Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      print('timer is running');
      updateTimer();
      if (stopTimer) {
        timer.cancel();
      }
    });
  }
}
