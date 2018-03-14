/**
 * Created by Donato on 3/9/18.
 */

@IsTest public class TestAccountTrigger {
    // Class that only calls Insert Trigger and sends Account List
    public static List<Account> testSAccountsInsert(List<Account> acc) {
        insert acc;
        return acc;
    }
    // Class that only calls Update Trigger and sends Account List
    public static List<Account> testSAccountsUpdate(List<Account> accs) {
        update accs;
        return accs;
    }
    // Class that only calls Delete Trigger and sends Account List
    public static List<Account> testSAccountsDelete(List<Account> acc) {
        delete acc;
        return acc;
    }
}