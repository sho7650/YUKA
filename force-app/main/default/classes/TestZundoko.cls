/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestZundoko {
  @isTest
  static void testZundoko() {
    String Z = 'ズン';
    String D = 'ドコ';
    String K = 'キ・ヨ・シ！';

    Test.startTest();

    // ズンドコキヨシのパターン
    List<String> ZD = new List<String>{ Z, D };
    List<String> Complete = new List<String>{ Z, Z, Z, Z, D };

    Integer R, i = 0;
    do {
      R = Math.abs(Math.mod(Crypto.getRandomInteger(), 2));
      System.assertEquals(ZD[R], ZD[0]);
      if (Complete[i] == ZD[R])
        i++;
      else
        i = 0;
    } while (i < 5);

    // キヨシの出力
    System.assertEquals(K, K);

    Test.stopTest();
  }
}
