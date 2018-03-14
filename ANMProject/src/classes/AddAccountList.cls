/**
 * Created by Donato on 3/2/18
 */

public class AddAccountList {
    // Function to set Map with Id, and Billing Record
    public static Map<Id, In_Sync_Biling__c> getAccIdToInSyncBilingMap(List<In_Sync_Biling__c> billingRecords){
        Map<Id, In_Sync_Biling__c> accIdToInSyncBilingMap = new Map<Id, In_Sync_Biling__c>();
        for(In_Sync_Biling__c billingRecord : billingRecords){
            accIdToInSyncBilingMap.put(billingRecord.Account__c, billingRecord);
        }
        return accIdToInSyncBilingMap;
    }
    // Function to set Map with Id, and Shipping Record
    public static Map<Id, In_Sync_Shipping__c> getAccIdToInSyncShippingMap(List<In_Sync_Shipping__c> shippingRecords){
        Map<Id, In_Sync_Shipping__c> accIdToInSyncShippingMap = new Map<Id, In_Sync_Shipping__c>();
        for(In_Sync_Shipping__c shippingRecord : shippingRecords){
            accIdToInSyncShippingMap.put(shippingRecord.Account__c, shippingRecord);
        }
        return accIdToInSyncShippingMap;
    }
    //Function to Change the updated Fields in Billings
    public static List<In_Sync_Biling__c> getBilingRecordsToUpdate(List<Account> accs, Map<Id, In_Sync_Biling__c> billingRecordsMap){
        List<In_Sync_Biling__c> bilingRecordToUpdate = new List<In_Sync_Biling__c>();
        for(Account acc : accs){
            // There has to be an IF for each field, to check every field exactly
            In_Sync_Biling__c billingRecordUpdated = billingRecordsMap.get(acc.Id);
            if(acc.BillingStreet != billingRecordUpdated.Billing_Street__c){
                billingRecordUpdated.Billing_Street__c = acc.BillingStreet;
            }
            if(acc.BillingCity != billingRecordUpdated.Billing_City__c){
                billingRecordUpdated.Billing_City__c = acc.BillingCity;
            }
            if(acc.BillingState != billingRecordUpdated.Billing_State__c){
                billingRecordUpdated.Billing_State__c = acc.BillingState;
            }
            if(acc.BillingPostalCode != billingRecordUpdated.Billing_Postal_Code__c){
                billingRecordUpdated.Billing_Postal_Code__c = acc.BillingPostalCode;
            }
            if(acc.BillingCountry != billingRecordUpdated.Billing_Country__c){
                billingRecordUpdated.Billing_Country__c = acc.BillingCountry;
            }
            if(acc.BillingLatitude != billingRecordUpdated.Billing_Latitude__c){
                billingRecordUpdated.Billing_Latitude__c = acc.BillingLatitude;
            }
            if(acc.BillingLongitude != billingRecordUpdated.Billing_Longitude_Code__c){
                billingRecordUpdated.Billing_Longitude_Code__c = acc.BillingLongitude;
            }
            if(acc.BillingGeocodeAccuracy != billingRecordUpdated.Billing_Accuracy__c) {
                billingRecordUpdated.Billing_Accuracy__c = acc.BillingGeocodeAccuracy;
            }
            bilingRecordToUpdate.add(billingRecordUpdated);
        }
        return bilingRecordToUpdate;
    }
    //Function to Change the updated Fields in Shippings
    public static List<In_Sync_Shipping__c> getShippingRecordsToUpdate(List<Account> accs, Map<Id, In_Sync_Shipping__c> shippingRecordsMap){
        List<In_Sync_Shipping__c> shippingRecordToUpdate = new List<In_Sync_Shipping__c>();
        for(Account acc : accs){
            // There has to be an IF for each field, to check every field exactly
            In_Sync_Shipping__c shippingRecordUpdate = shippingRecordsMap.get(acc.Id);
            if(acc.ShippingStreet != shippingRecordUpdate.Shipping_Street__c){
                shippingRecordUpdate.Shipping_Street__c = acc.ShippingStreet;
            }
            if(acc.ShippingCity != shippingRecordUpdate.Shipping_City__c){
                shippingRecordUpdate.Shipping_City__c = acc.ShippingCity;
            }
            if(acc.ShippingState != shippingRecordUpdate.Shipping_State__c){
                shippingRecordUpdate.Shipping_State__c = acc.ShippingState;
            }
            if(acc.ShippingPostalCode != shippingRecordUpdate.Shipping_Postal_Code__c){
                shippingRecordUpdate.Shipping_Postal_Code__c = acc.ShippingPostalCode;
            }
            if(acc.ShippingCountry != shippingRecordUpdate.Shipping_Country__c){
                shippingRecordUpdate.Shipping_Country__c = acc.ShippingCountry;
            }
            if(acc.ShippingLatitude != shippingRecordUpdate.Shipping_Latitude__c){
                shippingRecordUpdate.Shipping_Latitude__c = acc.ShippingLatitude;
            }
            if(acc.ShippingLongitude != shippingRecordUpdate.Shipping_Longitude_Code__c){
                shippingRecordUpdate.Shipping_Longitude_Code__c = acc.ShippingLongitude;
            }
            if(acc.ShippingGeocodeAccuracy != shippingRecordUpdate.Shipping_Accuracy__c) {
                shippingRecordUpdate.Shipping_Accuracy__c = acc.ShippingGeocodeAccuracy;
            }
            shippingRecordToUpdate.add(shippingRecordUpdate);
        }
        return shippingRecordToUpdate;
    }
}