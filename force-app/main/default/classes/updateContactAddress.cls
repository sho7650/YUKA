public class UpdateContactAddress {
    // コンストラクタ
    public UpdateContactAddress() {
        System.debug('UpdateContactAddressインスタンスが生成されました.');
    }

    // メソッド
    public void updateContacts(List<Contact> contacts) {
        System.debug('updateContactsメソッドが呼び出されました: ' + contacts);
        List<Contact> updatedContacts = new List<Contact>();
        for (Contact contact : contacts) {
            contact.MailingCountry = 'JP';
            updatedContacts.add(contact);
        }
        System.debug('国(郵送先)が更新された取引先責任者: ' + updatedContacts);
    }

}
