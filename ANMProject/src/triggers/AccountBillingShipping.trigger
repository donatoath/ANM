/**
 * Created by Donato on 2/20/18.
 */

trigger AccountBillingShipping on Account (after insert, after update, before delete) {
    //Create List of Billing/Shipping
    List<In_Sync_Biling__c> syncBillList = new List<In_Sync_Biling__c>();
    List<In_Sync_Shipping__c> syncShipList = new List<In_Sync_Shipping__c>();
    // If Account is Inserted
    if(Trigger.isInsert && Trigger.isAfter) {
        //For to get the new accounts to insert
        for(Account acc : Trigger.new) {
            // Data is inserted into Bill List
            syncBillList.add(new In_Sync_Biling__c(Account__c = acc.id, Billing_Street__c = acc.BillingStreet, Billing_City__c = acc.BillingCity, Billing_State__c = acc.BillingState,
                    Billing_Postal_Code__c = acc.BillingPostalCode, Billing_Country__c = acc.BillingCountry, Billing_Latitude__c = acc.BillingLatitude,Billing_Longitude_Code__c = acc.BillingLongitude,Billing_Accuracy__c = acc.BillingGeocodeAccuracy));

            // Data is inserted into Ship List
            syncShipList.add(new In_Sync_Shipping__c(Account__c = acc.id ,Shipping_Street__c = acc.ShippingStreet,Shipping_City__c =  acc.ShippingCity,Shipping_State__c = acc.ShippingState, Shipping_Postal_Code__c = acc.ShippingPostalCode,
                    Shipping_Country__c = acc.ShippingCountry,Shipping_Latitude__c = acc.ShippingLatitude, Shipping_Longitude_Code__c = acc.ShippingLongitude, Shipping_Accuracy__c = acc.ShippingGeocodeAccuracy));
        }
        // Data is stored in List and inserted
        insert syncBillList;
        insert syncShipList;
    }
    // If Account is Update
    if(Trigger.isUpdate && Trigger.isAfter){
        //Set ID as KeySet
        Set<Id> newAccId = Trigger.newMap.keySet();
        //Stores Data in temp list of billing and shipping using a query with the ID of the accounts that are going to be updated
        List<In_Sync_Biling__c> syncBillingTemp = [SELECT Account__c, Billing_Street__c, Billing_City__c, Billing_State__c, Billing_Postal_Code__c, Billing_Country__c, Billing_Latitude__c, Billing_Longitude_Code__c, Billing_Accuracy__c FROM In_Sync_Biling__c WHERE  Account__c in: newAccId];
        List<In_Sync_Shipping__c> syncShippingTemp = [SELECT Account__c,Shipping_Street__c,Shipping_City__c,Shipping_State__c,Shipping_Postal_Code__c,Shipping_Country__c,Shipping_Latitude__c,Shipping_Longitude_Code__c,Shipping_Accuracy__c FROM In_Sync_Shipping__c WHERE  Account__c in: newAccId];
        //Calls function to set in map the ids as Key sending the Temp list
        Map<Id, In_Sync_Biling__c> accToBillingMap = AddAccountList.getAccIdToInSyncBilingMap(syncBillingTemp);
        Map<Id, In_Sync_Shipping__c> accToShippingMap = AddAccountList.getAccIdToInSyncShippingMap(syncShippingTemp);
        //Calls function to update the specific Field
        List<In_Sync_Biling__c> billingToUpdate = AddAccountList.getBilingRecordsToUpdate(Trigger.new, accToBillingMap);
        List<In_Sync_Shipping__c> shippingToUpdate = AddAccountList.getShippingRecordsToUpdate(Trigger.new, accToShippingMap);
        //List Updated
        update billingToUpdate;
        update shippingToUpdate;
    }
    //If Account isDelete
    if(Trigger.isDelete && Trigger.isBefore){
        //Set ID as KeySet
        Set<Id> oldAccId = Trigger.oldMap.keySet();
        //Stores Data in temp list of billing and shipping using a query with the ID of the accounts that are going to be deleted
        List<In_Sync_Biling__c> syncBillingTemp = [SELECT Account__c, Billing_Street__c, Billing_City__c, Billing_State__c, Billing_Postal_Code__c, Billing_Country__c, Billing_Latitude__c, Billing_Longitude_Code__c, Billing_Accuracy__c FROM In_Sync_Biling__c WHERE  Account__c in: oldAccId];
        List<In_Sync_Shipping__c> syncShippingTemp = [SELECT Account__c,Shipping_Street__c,Shipping_City__c,Shipping_State__c,Shipping_Postal_Code__c,Shipping_Country__c,Shipping_Latitude__c,Shipping_Longitude_Code__c,Shipping_Accuracy__c FROM In_Sync_Shipping__c WHERE  Account__c in: oldAccId];
        //List Deleted
        delete syncBillingTemp;
        delete syncShippingTemp;
    }
}