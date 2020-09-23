trigger MaintenanceRequest on Case (after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
    MaintenanceRequestHelper.updateWorkOrders(trigger.new);
}