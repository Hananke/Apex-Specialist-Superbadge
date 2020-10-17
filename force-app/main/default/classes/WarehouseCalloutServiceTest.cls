@IsTest
private class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    @IsTest
    static void testCallout(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        List<Product2> actual = [SELECT Id FROM Product2];
        System.assertEquals(1, actual.size(), 'should have inserted 1 record');
    }
}