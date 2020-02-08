DateTime updateDate(DateTime atual,
    {int day, int month, int year, int minute}) {
  return DateTime(year ?? atual.year, month ?? atual.month, day ?? atual.day,
      atual.hour, minute ?? atual.minute, 0, 0, 0);
}
