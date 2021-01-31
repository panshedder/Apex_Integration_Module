@isTest
private with sharing class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id accountId = createTestRecord();

        RestRequest request = new RestRequest();
        //'https://curious-hawk-23ibts-dev-ed.lightning.force.com/services/apexrest/Accounts/' 

        request.requestURI =
            'https://login.salesforce.com/services/apexrest/Accounts/'
            + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name='Test record');
        insert accountTest;
        return accountTest.Id;
    }          
}
