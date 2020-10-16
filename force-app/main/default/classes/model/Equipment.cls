public with sharing class Equipment {
    public boolean replacement;
    public Integer quantity;
    public String name;
    public Integer maintenanceperiod;
    public Integer lifespan;
    public Integer cost;
    public String sku;

    public Equipment() {

    }

    public static List<Equipment> parse(String json) {
        return (List<Equipment>) System.JSON.deserialize(json, List<Equipment>.class);
    }

}
