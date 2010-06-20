package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.IncomeCategory;

privileged aspect IncomeCategoryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: IncomeCategoryDataOnDemand: @Component;
    
    private Random IncomeCategoryDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<IncomeCategory> IncomeCategoryDataOnDemand.data;
    
    public IncomeCategory IncomeCategoryDataOnDemand.getNewTransientIncomeCategory(int index) {
        za.co.zynafin.IncomeCategory obj = new za.co.zynafin.IncomeCategory();
        obj.setName("name_" + index);
        return obj;
    }
    
    public IncomeCategory IncomeCategoryDataOnDemand.getSpecificIncomeCategory(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        IncomeCategory obj = data.get(index);
        return IncomeCategory.findIncomeCategory(obj.getId());
    }
    
    public IncomeCategory IncomeCategoryDataOnDemand.getRandomIncomeCategory() {
        init();
        IncomeCategory obj = data.get(rnd.nextInt(data.size()));
        return IncomeCategory.findIncomeCategory(obj.getId());
    }
    
    public boolean IncomeCategoryDataOnDemand.modifyIncomeCategory(IncomeCategory obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void IncomeCategoryDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.IncomeCategory.findIncomeCategoryEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'IncomeCategory' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.IncomeCategory>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.IncomeCategory obj = getNewTransientIncomeCategory(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
