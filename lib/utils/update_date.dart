DateTime updateDate(DateTime atual,
    {int day, int month, int year, int minute}) {
  return DateTime(
      year ?? atual.year,
      month ?? atual.month,
      day ?? atual.day,
      year ?? atual.year,
      year ?? atual.year,
      minute ?? atual.minute,
      atual.hour);
}
