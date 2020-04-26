global with sharing class AccountRemoter {

    public String accountName { get; set; }
    public static Account account { get; set; }
    public AccountRemoter() { } // empty constructor
    
    //The RemoteAction annotated apex methods is for JavaScript to call them from Visualforce page
    //Apex @RemoteAction methods must be static and either global or public.
    @RemoteAction
    global static Account getAccount(String accountName) {
        //to use a variable in static method, it has to be a static variable
        account = [SELECT Id, Name, Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accountName];
        return account;
    }
}