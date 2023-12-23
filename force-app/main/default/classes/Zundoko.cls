public with sharing class Zundoko {
  String Z = 'ズン';
  String D = 'ドコ';
  String K = 'キ・ヨ・シ！';
  Integer R;

  List<String> ZD = new List<String>{ Z, D };
  List<String> Complete = new List<String>{ Z, Z, Z, Z, D };

  public void Kiyoshi(List<String> Nominees) {
    if (Complete == Nominees) {
      System.debug(K);
      return;
    } else {
      if (Nominees.size() > 4) {
        Nominees.remove(0);
      }
      R = Math.abs(Math.mod(Crypto.getRandomInteger(), 2));
      Nominees.add(ZD[R]);
      System.debug(ZD[R]);
      this.Kiyoshi(Nominees);
    }
  }
}
