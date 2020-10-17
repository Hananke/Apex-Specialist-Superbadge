@isTest
private class SchdulerTest {
    @IsTest
    static void test(){
        
        Test.startTest();
        WarehouseSyncSchedule test1 = new WarehouseSyncSchedule();   
        String cron = '0 0 23 * * ?';        
        system.schedule('Test Sched', cron, test1);
        Test.stopTest();
        
    }
}
