@isTest
public class AccountBillandShipTest {
    @isTest static void TestCreateOneAccount(){
        Account acc = new Account(BillingStreet  = 'Street1', BillingCity = 'City1',BillingState = 'State1' ,BillingCountry = 'Country1',BillingPostalCode = 'PostalCode', BillingLatitude = 12345, BillingLongitude = 12345, BillingGeocodeAccuracy = 'Accuracy',
                               ShippingStreet = 'Street2', ShippingCity = 'City2', ShippingState = 'State2', ShippingPostalCode = 'PostalCode2', ShippingCountry = 'Country2', ShippingLatitude = 12346, ShippingLongitude = 12346, ShippingGeocodeAccuracy = 'Accuracy2');
        insert acc;
        Test.startTest();
        Test.stopTest();
    }
}