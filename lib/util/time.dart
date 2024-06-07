String formatDuration(int seconds) {
  final minutes = (seconds / 60).floor();
  final remainingSeconds = seconds % 60;

  // Ensure two-digit format for minutes (01:23 instead of 1:23)
  final formattedMinutes = minutes.toString().padLeft(2, '0');
  final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

  return '$formattedMinutes:$formattedSeconds';
}

String setTimer(int seconds, double percentage) {
  int time_in_sec = ((seconds) * percentage).toInt();
  return formatDuration(time_in_sec);
}
