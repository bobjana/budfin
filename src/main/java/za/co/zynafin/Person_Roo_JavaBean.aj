package za.co.zynafin;

import java.lang.String;
import za.co.zynafin.BankAccount;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getEmail() {
        return this.email;
    }
    
    public void Person.setEmail(String email) {
        this.email = email;
    }
    
    public BankAccount Person.getBankAccount() {
        return this.bankAccount;
    }
    
    public void Person.setBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }
    
    public String Person.getName() {
        return this.name;
    }
    
    public void Person.setName(String name) {
        this.name = name;
    }
    
}
