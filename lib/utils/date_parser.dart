import 'package:flutter/widgets.dart';

String monthParser(int month) {
  switch (month) {
    case DateTime.january:
      return "Janeiro     ";
    case DateTime.february:
      return "Fevereiro ";
    case DateTime.march:
      return "Março       ";
    case DateTime.april:
      return "Abril          ";
    case DateTime.may:
      return "Maio          ";
    case DateTime.june:
      return "Junho         ";
    case DateTime.july:
      return "Julho          ";
    case DateTime.august:
      return "Agosto       ";
    case DateTime.september:
      return "Setembro  ";
    case DateTime.october:
      return "Outubro    ";
    case DateTime.november:
      return "Novembro";
    case DateTime.december:
      return "Dezembro";
      break;
    default:
      return "";
  }
}

String weekParser(int week) {
  switch (week) {
    case DateTime.monday:
      return "Segunda-feira";
    case DateTime.tuesday:
      return "Terça-feira      ";
    case DateTime.wednesday:
      return "Quarta-feira   ";
    case DateTime.thursday:
      return "Quinta-feira   ";
    case DateTime.friday:
      return "Sexta-feira      ";
    case DateTime.saturday:
      return "Sábado             ";
    case DateTime.sunday:
      return "Domingo          ";
      break;
    default:
      return "";
  }
}

String timeParser(DateTime date) {
  return "${date.hour < 10 ? "0" + date.hour.toString() : date.hour}:${date.minute < 10 ? "0" + date.minute.toString() : date.minute} ${date.hour >= 12 ? "pm" : "am"}";
}
