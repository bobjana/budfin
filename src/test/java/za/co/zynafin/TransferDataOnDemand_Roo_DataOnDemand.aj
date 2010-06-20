package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Transfer;

privileged aspect TransferDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TransferDataOnDemand: @Component;
    
    private Random TransferDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Transfer> TransferDataOnDemand.data;
    
    public Transfer TransferDataOnDemand.getNewTransientTransfer(int index) {
        za.co.zynafin.Transfer obj = new za.co.zynafin.Transfer();
        obj.setCreditTransaction(null);
        obj.setDebitTransaction(null);
        obj.setNote("note_" + index);
        return obj;
    }
    
    public Transfer TransferDataOnDemand.getSpecificTransfer(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Transfer obj = data.get(index);
        return Transfer.findTransfer(obj.getId());
    }
    
    public Transfer TransferDataOnDemand.getRandomTransfer() {
        init();
        Transfer obj = data.get(rnd.nextInt(data.size()));
        return Transfer.findTransfer(obj.getId());
    }
    
    public boolean TransferDataOnDemand.modifyTransfer(Transfer obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void TransferDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.Transfer.findTransferEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Transfer' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.Transfer>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.Transfer obj = getNewTransientTransfer(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
