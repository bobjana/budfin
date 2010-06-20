package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.ExpenseCategory;

privileged aspect ExpenseCategoryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ExpenseCategoryDataOnDemand: @Component;
    
    private Random ExpenseCategoryDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ExpenseCategory> ExpenseCategoryDataOnDemand.data;
    
    public ExpenseCategory ExpenseCategoryDataOnDemand.getNewTransientExpenseCategory(int index) {
        za.co.zynafin.ExpenseCategory obj = new za.co.zynafin.ExpenseCategory();
        obj.setName("name_" + index);
        return obj;
    }
    
    public ExpenseCategory ExpenseCategoryDataOnDemand.getSpecificExpenseCategory(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ExpenseCategory obj = data.get(index);
        return ExpenseCategory.findExpenseCategory(obj.getId());
    }
    
    public ExpenseCategory ExpenseCategoryDataOnDemand.getRandomExpenseCategory() {
        init();
        ExpenseCategory obj = data.get(rnd.nextInt(data.size()));
        return ExpenseCategory.findExpenseCategory(obj.getId());
    }
    
    public boolean ExpenseCategoryDataOnDemand.modifyExpenseCategory(ExpenseCategory obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ExpenseCategoryDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.ExpenseCategory.findExpenseCategoryEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ExpenseCategory' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.ExpenseCategory>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.ExpenseCategory obj = getNewTransientExpenseCategory(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
