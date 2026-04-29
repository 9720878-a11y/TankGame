class Timer {
  int savedTime;
  int totalTime;

  Timer(int totalTime) {
    this.totalTime = totalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    return millis() - savedTime > totalTime;
  }
}
