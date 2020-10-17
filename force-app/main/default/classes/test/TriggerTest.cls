@isTest
private class TriggerTest {

    @IsTest
    static void postiveTest(){
        Case testCase = new Case(Type='Repair', Subject='hello');
        Vehicle__c car = new Vehicle__c(name='car');
        Product2 e = new Product2(name='eq', Maintenance_Cycle__c=10, Replacement_Part__c=true);
        
        List<Sobject> records = new List<SObject>{car, e};
        insert records;

        testCase.Vehicle__c = car.Id;
        testCase.Equipment__c = e.Id;
        insert testCase;

        Work_Part__c wp = new Work_Part__c(Equipment__c=e.Id, Maintenance_Request__c=testCase.Id);
        insert wp;
        Test.startTest();
        testCase.Status = 'Closed';
        update testCase;

        List<Case> actual = [SELECT Id FROM Case where Subject='hello' AND Type = 'Routine Maintenance' AND Date_Reported__c =: Date.today()];
        System.assertEquals(1, actual.size());
        Test.stopTest();
    }

    @IsTest
    static void negativeTest(){
        Case testCase = new Case(Type='Custom', Subject='hello');
        Vehicle__c car = new Vehicle__c(name='car');
        Product2 e = new Product2(name='eq');
        List<Sobject> records = new List<SObject>{car, e};
        insert records;

        testCase.Vehicle__c = car.Id;
        testCase.Equipment__c = e.Id;
        insert testCase;
        Test.startTest();
        testCase.Status = 'Closed';
        update testCase;

        List<Case> actual = [SELECT Id FROM Case where Subject='hello' AND Type = 'Routine Maintenance' AND Date_Reported__c =: Date.today()];
        System.assertEquals(0, actual.size());
        Test.stopTest();
    }
}
