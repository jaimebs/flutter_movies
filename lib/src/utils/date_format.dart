import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final months = [
    '',
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  final day = date.day.toString().padLeft(2, '0');
  final month = months[date.month];
  final year = date.year.toString();

  return '$day de $month de $year';
}

String getYearOfDate(DateTime date) {
  final year = date.year.toString();
  return year;
}

String formatToDdMmYyyy(DateTime date) {
  final formatador = DateFormat('dd/MM/yyyy');
  return formatador.format(date);
}
