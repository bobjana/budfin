package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Expense;

privileged aspect ExpenseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ExpenseDataOnDemand: @Component;
    
    private Random ExpenseDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Expense> ExpenseDataOnDemand.data;
    
    public Expense ExpenseDataOnDemand.getNewTransientExpense(int index) {
        za.co.zynafin.Expense obj = new za.co.zynafin.Expense();
        obj.setBankAccount(null);
        obj.setExpenseCategory(null);
        obj.setNote("note_" + index);
        obj.setTransaction(null);
        return obj;
    }
    
    public Expense ExpenseDataOnDemand.getSpecificExpense(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Expense obj = data.get(index);
        return Expense.findExpense(obj.getId());
    }
    
    public Expense ExpenseDataOnDemand.getRandomExpense() {
        init();
        Expense obj = data.get(rnd.nextInt(data.size()));
        return Expense.findExpense(obj.getId());
    }
    
    public boolean ExpenseDataOnDemand.modifyExpense(Expense obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ExpenseDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.Expense.findExpenseEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Expense' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.Expense>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.Expense obj = getNewTransientExpense(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
