package za.co.zynafin;

import java.lang.String;
import za.co.zynafin.Tranzaction;

privileged aspect Transfer_Roo_JavaBean {
    
    public String Transfer.getNote() {
        return this.note;
    }
    
    public void Transfer.setNote(String note) {
        this.note = note;
    }
    
    public Tranzaction Transfer.getDebitTransaction() {
        return this.debitTransaction;
    }
    
    public void Transfer.setDebitTransaction(Tranzaction debitTransaction) {
        this.debitTransaction = debitTransaction;
    }
    
    public Tranzaction Transfer.getCreditTransaction() {
        return this.creditTransaction;
    }
    
    public void Transfer.setCreditTransaction(Tranzaction creditTransaction) {
        this.creditTransaction = creditTransaction;
    }
    
}
