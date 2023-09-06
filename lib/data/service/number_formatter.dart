abstract class NumberFormatter {
  static String ageFormat(String age) {
    DateTime birthYearToInt = DateTime.parse(age);
    int yearsOldToInt = DateTime.now().year - birthYearToInt.year;
    if (yearsOldToInt % 10 == 1 && yearsOldToInt % 100 != 11) {
      return '$yearsOldToInt год';
    } else if (yearsOldToInt % 10 >= 2 &&
        yearsOldToInt % 10 <= 4 &&
        (yearsOldToInt % 100 < 10 || yearsOldToInt % 100 >= 20)) {
      return '$yearsOldToInt года';
    } else {
      return '$yearsOldToInt лет';
    }
  }
}
