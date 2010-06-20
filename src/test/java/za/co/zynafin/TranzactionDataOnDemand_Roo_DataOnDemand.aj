package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Tranzaction;

privileged aspect TranzactionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TranzactionDataOnDemand: @Component;
    
    private Random TranzactionDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Tranzaction> TranzactionDataOnDemand.data;
    
    public Tranzaction TranzactionDataOnDemand.getNewTransientTranzaction(int index) {
        za.co.zynafin.Tranzaction obj = new za.co.zynafin.Tranzaction();
        obj.setAmmount(new Integer(index).doubleValue());
        obj.setBankAccount(null);
        obj.setDate(new java.util.Date());
        obj.setReference("reference_" + index);
        return obj;
    }
    
    public Tranzaction TranzactionDataOnDemand.getSpecificTranzaction(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Tranzaction obj = data.get(index);
        return Tranzaction.findTranzaction(obj.getId());
    }
    
    public Tranzaction TranzactionDataOnDemand.getRandomTranzaction() {
        init();
        Tranzaction obj = data.get(rnd.nextInt(data.size()));
        return Tranzaction.findTranzaction(obj.getId());
    }
    
    public boolean TranzactionDataOnDemand.modifyTranzaction(Tranzaction obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void TranzactionDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.Tranzaction.findTranzactionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Tranzaction' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.Tranzaction>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.Tranzaction obj = getNewTransientTranzaction(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
