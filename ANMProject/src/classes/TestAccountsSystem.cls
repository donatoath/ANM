/**
 * Created by Donato on 3/9/18.
 */

@IsTest
private class TestAccountsSystem {
    @IsTest static void TestAccountInsert() {
        List<Account> accs = new List<Account>();
        //Crea los Accounts Nuevos
        for(Integer iX = 0; iX < 10; iX++){
            Account acc = new Account(Name = 'TestAccount' + iX, BillingStreet = 'BillingStreet' + iX, BillingCity = 'BillingCity' + iX, BillingState = 'BillingState' + iX,
                    BillingPostalCode = 'BillingPostalCode' + iX, BillingCountry = 'BillingCountry' +iX,
                    BillingLatitude = iX, BillingLongitude = iX,
                    ShippingStreet = 'ShippingStreet' + iX, ShippingCity = 'ShippingCity' + iX, ShippingState = 'ShippingState' + iX,
                    ShippingPostalCode = 'ShippingPostalCode' + iX, ShippingCountry = 'ShippingCountry' + iX, ShippingLatitude = iX, ShippingLongitude = iX );
            accs.add(acc);
        }
        //Manda los Accounts a Insertar
        TestAccountTrigger.testSAccountsInsert(accs);
        //Lista auxiliar que guarda todos los accounts
        List<Account> accAux = [SELECT id FROM  Account];
        //Revisa si la lista auxiliar que guarda todos los accounts son los mismos insertados, el cual deberian ser iguales
        System.assertEquals(accs.size(),accAux.size());
    }
    @isTest static void TestAccountUpdate(){
        List<Account> accs = new List<Account>();
        //Crea los Accounts Nuevos
        for(Integer iX = 0; iX < 10; iX++){
            Account acc = new Account(Name = 'TestAccount' + iX, BillingStreet = 'BillingStreet' + iX, BillingCity = 'BillingCity' + iX, BillingState = 'BillingState' + iX,
                    BillingPostalCode = 'BillingPostalCode' + iX, BillingCountry = 'BillingCountry' +iX,
                    BillingLatitude = iX, BillingLongitude = iX,
                    ShippingStreet = 'ShippingStreet' + iX, ShippingCity = 'ShippingCity' + iX, ShippingState = 'ShippingState' + iX,
                    ShippingPostalCode = 'ShippingPostalCode' + iX, ShippingCountry = 'ShippingCountry' + iX, ShippingLatitude = iX, ShippingLongitude = iX );
            accs.add(acc);
        }
        //Manda los Accounts a Insertar para tener donde hacer los cambios
        TestAccountTrigger.testSAccountsInsert(accs);
        //Guarda en un String Auxiliar el Billing y Shipping Street, se usara para revisar si hubo un cambio
        String strBillTemp1 = accs[0].BillingStreet;
        String strShipTemp1 = accs[0].ShippingStreet;
        //Se modifica el Field de Billing Street y Shipping Street de 3 Accounts
        accs[0].BillingStreet = 'BillSt';
        accs[1].BillingStreet = 'BillSt';
        accs[2].BillingStreet = 'BillSt';
        accs[0].ShippingStreet = 'ShipSt';
        accs[1].ShippingStreet = 'ShipSt';
        accs[2].ShippingStreet = 'ShipSt';
        //Se manda los Accounts para que se Modifiquen
        TestAccountTrigger.testSAccountsUpdate(new List<Account>{accs[0], accs[1], accs[2]});
        //Guarda en un segundo String Auxiliar el Billing y Shipping Street, se usara para revisar si hubo un cambio
        String strBillTemp2 = accs[0].BillingStreet;
        String strShipTemp2 = accs[0].ShippingStreet;
        //Se hace un AssertNotEqual porque tienen que ser diferentes, ya que se debio cambiar
        System.assertNotEquals(strBillTemp1,strBillTemp2);
        System.assertNotEquals(strShipTemp1,strShipTemp2);
    }
    @isTest static void TestAccountDelete(){
        List<Account> accs = new List<Account>();
        //Crea los Accounts Nuevos
        for(Integer iX = 0; iX < 10; iX++){
            Account acc = new Account(Name = 'TestAccount' + iX, BillingStreet = 'BillingStreet' + iX, BillingCity = 'BillingCity' + iX, BillingState = 'BillingState' + iX,
                    BillingPostalCode = 'BillingPostalCode' + iX, BillingCountry = 'BillingCountry' +iX,
                    BillingLatitude = iX, BillingLongitude = iX,
                    ShippingStreet = 'ShippingStreet' + iX, ShippingCity = 'ShippingCity' + iX, ShippingState = 'ShippingState' + iX,
                    ShippingPostalCode = 'ShippingPostalCode' + iX, ShippingCountry = 'ShippingCountry' + iX, ShippingLatitude = iX, ShippingLongitude = iX );
            accs.add(acc);
        }
        //Manda los Accounts a Insertar para tener donde borrar
        TestAccountTrigger.testSAccountsInsert(accs);
        // Se hace listas auxiliar para saber cuantos Registros hay
        List<In_Sync_Biling__c> billAux1= [SELECT Account__c FROM In_Sync_Biling__c];
        List<In_Sync_Shipping__c> shipAux1= [SELECT Account__c FROM In_Sync_Shipping__c];
        //Se borran las respectivas listas
        TestAccountTrigger.testSAccountsDelete(new List<Account>{accs[4], accs[5]});
        //Se hace segunda lista auxiliar para saber nuevamente cuantos registros hay
        List<In_Sync_Biling__c> billAux2 = [SELECT Account__c FROM In_Sync_Biling__c];
        List<In_Sync_Shipping__c> shipAux2 = [SELECT Account__c FROM In_Sync_Shipping__c];
        //Se hace una comparacion de numeros de registros, el cual deben ser igual
        System.assertEquals(billAux1.size() - 2,billAux2.size());
        System.assertEquals(shipAux1.size() - 2,shipAux2.size());
    }
}