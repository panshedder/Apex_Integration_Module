@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HTTPGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');

        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
            FROM Account WHERE id =: accountId];

        return result;
    }
}
