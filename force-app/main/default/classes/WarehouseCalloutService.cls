public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    @Future(callout=true)
    public static void runWarehouseEquipmentSync() {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.
        Http h = new Http();
 
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
       HttpRequest req = new HttpRequest();
       req.setEndpoint(WAREHOUSE_URL);
       req.setMethod('GET');
    
       HttpResponse res = h.send(req);
       List<Equipment> equipments = Equipment.parse(res.getBody());

       
        //    Your class maps the following fields: 
        // replacement part (always true), 
        // cost, 
        // current inventory, 
        // lifespan, 
        // maintenance cycle, and warehouse SKU. 
        // Use the warehouse SKU as the external ID
        List<Product2> updates = new List<Product2>();

        for (Equipment eq : equipments){
            updates.add(new Product2(
                Name = eq.name,
                Warehouse_SKU__c = eq.sku,
                Cost__c = eq.cost,
                Lifespan_Months__c = eq.lifespan,
                Current_Inventory__c = eq.quantity,
                Maintenance_Cycle__c = eq.maintenanceperiod,
                Replacement_Part__c = true
            ));
        }
        upsert updates;
    }

}