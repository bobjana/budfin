package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.BankAccount;

privileged aspect BankAccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BankAccountDataOnDemand: @Component;
    
    private Random BankAccountDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<BankAccount> BankAccountDataOnDemand.data;
    
    public BankAccount BankAccountDataOnDemand.getNewTransientBankAccount(int index) {
        za.co.zynafin.BankAccount obj = new za.co.zynafin.BankAccount();
        obj.setAccountNumber("accountNumber_" + index);
        obj.setBalance(new Integer(index).doubleValue());
        obj.setBank(null);
        return obj;
    }
    
    public BankAccount BankAccountDataOnDemand.getSpecificBankAccount(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        BankAccount obj = data.get(index);
        return BankAccount.findBankAccount(obj.getId());
    }
    
    public BankAccount BankAccountDataOnDemand.getRandomBankAccount() {
        init();
        BankAccount obj = data.get(rnd.nextInt(data.size()));
        return BankAccount.findBankAccount(obj.getId());
    }
    
    public boolean BankAccountDataOnDemand.modifyBankAccount(BankAccount obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void BankAccountDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.BankAccount.findBankAccountEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'BankAccount' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.BankAccount>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.BankAccount obj = getNewTransientBankAccount(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
