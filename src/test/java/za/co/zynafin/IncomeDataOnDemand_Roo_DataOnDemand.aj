package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Income;

privileged aspect IncomeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: IncomeDataOnDemand: @Component;
    
    private Random IncomeDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Income> IncomeDataOnDemand.data;
    
    public Income IncomeDataOnDemand.getNewTransientIncome(int index) {
        za.co.zynafin.Income obj = new za.co.zynafin.Income();
        obj.setIncomeCategory(null);
        obj.setNote("note_" + index);
        obj.setTranzaction(null);
        return obj;
    }
    
    public Income IncomeDataOnDemand.getSpecificIncome(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Income obj = data.get(index);
        return Income.findIncome(obj.getId());
    }
    
    public Income IncomeDataOnDemand.getRandomIncome() {
        init();
        Income obj = data.get(rnd.nextInt(data.size()));
        return Income.findIncome(obj.getId());
    }
    
    public boolean IncomeDataOnDemand.modifyIncome(Income obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void IncomeDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.Income.findIncomeEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Income' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.Income>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.Income obj = getNewTransientIncome(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
