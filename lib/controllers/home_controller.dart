import 'package:get/state_manager.dart';
import 'dart:async';

class HomeController extends GetxController {
  final stopwatch = Stopwatch();
  late var timeElapsed = stopwatch.elapsed.toString().obs;
  var buttonText = 'Start'.obs;

  String updateButton() =>
      buttonText.value = stopwatch.isRunning ? 'Stop' : 'Start';

  void updateTimer() {
    timeElapsed.value = stopwatch.elapsed.toString();
  }

  void toggleTimer() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      updateButton();
    } else {
      stopwatch.start();
      updateButton();
    }
  }

  void resetTimer() {
    stopwatch.stop();
    stopwatch.reset();
    updateTimer();
  }

  @override
  void onInit() {
    super.onInit();
    Timer timer =
        Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      if (stopwatch.isRunning) {
        updateTimer();
      }
    });
  }
}
