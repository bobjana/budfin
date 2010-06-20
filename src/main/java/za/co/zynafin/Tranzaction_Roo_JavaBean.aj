package za.co.zynafin;

import java.lang.String;
import java.util.Date;
import za.co.zynafin.BankAccount;

privileged aspect Tranzaction_Roo_JavaBean {
    
    public String Tranzaction.getReference() {
        return this.reference;
    }
    
    public void Tranzaction.setReference(String reference) {
        this.reference = reference;
    }
    
    public double Tranzaction.getAmmount() {
        return this.ammount;
    }
    
    public void Tranzaction.setAmmount(double ammount) {
        this.ammount = ammount;
    }
    
    public Date Tranzaction.getDate() {
        return this.date;
    }
    
    public void Tranzaction.setDate(Date date) {
        this.date = date;
    }
    
    public BankAccount Tranzaction.getBankAccount() {
        return this.bankAccount;
    }
    
    public void Tranzaction.setBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }
    
}
