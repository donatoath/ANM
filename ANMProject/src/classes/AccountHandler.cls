public class AccountHandler {
    public static Account insertNewAccount(String sParam){
        try{
            Account acc = new Account();
            acc.name = sParam;
            insert acc;
            return acc;
        }catch (exception e){
            return null;
        }
    }
}