public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> cases) {
        // TODO: Complete the method to update workorders
        List<Case> newCases = new List<Case>();
        cases =[
            select id,Subject, Vehicle__c,Equipment__c, 
            (select Equipment__r.Maintenance_Cycle__c from Work_Parts__r ORDER By Equipment__r.Maintenance_Cycle__c LIMIT 1) 
            from case where Id IN:cases AND status = 'Closed' and Type IN ('Repair','Routine Maintenance')];
        System.debug(cases.size());
        for (Case c : cases) {
            Integer days = 0;
            System.debug(c.Work_Parts__r);
            if (c.Work_Parts__r != null && c.Work_Parts__r.size() > 0) 
                days = Integer.valueOf(c.Work_Parts__r[0].Equipment__r.Maintenance_Cycle__c);
            Case nc = new Case(
                Vehicle__c = c.Vehicle__c,
                Equipment__c = c.Equipment__c,
                Type = 'Routine Maintenance',
                Date_Reported__c = Date.today(),
                Subject = c.Subject,
                Date_Due__c = Date.today().addDays(days)
            );
            newCases.add(nc);
           
        }
        System.debug(newCases);
        insert newCases;
    }        
}