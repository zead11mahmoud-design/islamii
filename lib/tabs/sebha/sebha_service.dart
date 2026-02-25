class SebhaService {
  static List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  static int sebhaCount = 0;
  static int tapCount = 0;
  static int index = 0;

  static void tasbaeh() {
    tapCount++;
    sebhaCount++;

    if (tapCount == 33) {
      index = 1;
    } else if (tapCount == 66) {
      index = 2;
    } else if (tapCount == 99) {
      index = 0;
      tapCount = 0;
    }
  }
}
