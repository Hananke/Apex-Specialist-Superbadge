# Apex Specialist Superbadge

https://trailhead.salesforce.com/en/content/learn/superbadges/superbadge_apex

## Part 1: how to play around with this project

This project is uses the Org Development Model 

use the follwing command to "push" and "pull" the project directly to/from the playground.

- Push: `SFDX: Deploy Source to Org` (VS Code) or `sfdx force:source:deploy --manifest` (Salesforce CLI) 
- Pull: `SFDX: Retrieve Source from Org` (VS Code) or `sfdx force:source:retrieve --manifest1` (Salesforce CLI).

## some notes:
1. for check point 2: you will need to add the Warehouse url to the `remote site settings`
1. for check point 3: you could either schedule the class 
    - in the setup (Apex class -> schedule apex class)
    - in dev console with a similar code snippet
  ```
    WarehouseSyncSchedule m = new WarehouseSyncSchedule();
    String sch = '0 1 * * *';
    String jobID = system.schedule('WarehouseSync', sch, m);
  ```

1. that's it, hope you have fun with the project! 
