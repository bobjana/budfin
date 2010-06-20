package za.co.zynafin;

import java.lang.String;
import za.co.zynafin.IncomeCategory;
import za.co.zynafin.Tranzaction;

privileged aspect Income_Roo_JavaBean {
    
    public String Income.getNote() {
        return this.note;
    }
    
    public void Income.setNote(String note) {
        this.note = note;
    }
    
    public Tranzaction Income.getTranzaction() {
        return this.tranzaction;
    }
    
    public void Income.setTranzaction(Tranzaction tranzaction) {
        this.tranzaction = tranzaction;
    }
    
    public IncomeCategory Income.getIncomeCategory() {
        return this.incomeCategory;
    }
    
    public void Income.setIncomeCategory(IncomeCategory incomeCategory) {
        this.incomeCategory = incomeCategory;
    }
    
}
