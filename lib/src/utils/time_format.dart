String formatMinutesToTimeString(int minutes) {
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;

  String hoursString = hours > 0 ? '$hours' : '';
  String minutesString = remainingMinutes > 0 ? '$remainingMinutes' : '';

  String result = '';

  if (hours > 0) {
    result += '${hoursString}h';
  }

  if (remainingMinutes > 0) {
    result += ' ${minutesString}m';
  }

  return result.trim();
}
