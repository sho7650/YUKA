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
@IsTest
private class UpdateContactAddressTest {
  // テストデータを作成する
  @testSetup
  static void setup() {
    // 取引先責任者の作成
    List<Contact> contacts = new List<Contact>();
    for (Integer i = 0; i < 5; i++) {
      contacts.add(new Contact(
        LastName = 'Test' + i,
        MailingCountry = 'US'
      ));
    }
    insert contacts;
  }

  // updateContactsメソッドをテストする
  @IsTest
  static void testUpdateContacts() {
    // テストデータの取得
    List<Contact> contacts = [SELECT Id, LastName, MailingCountry FROM Contact];

    // 更新する取引先責任者のリストを作成
    List<Contact> contactsToUpdate = new List<Contact>();
    for (Contact contact : contacts) {
      contact.MailingCountry = 'JP';
      contactsToUpdate.add(contact);
    }

    // テストコードの実行
    UpdateContactAddress updateContactAddress = new UpdateContactAddress();
    updateContactAddress.updateContacts(contactsToUpdate);

    // 結果の確認
    List<Contact> updatedContacts = [SELECT Id, LastName, MailingCountry FROM Contact];
    for (Contact updatedContact : updatedContacts) {
      System.assertEquals('JP', updatedContact.MailingCountry, '国(郵送先)が更新されていません。');
    }
  }
}
