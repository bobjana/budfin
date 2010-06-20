package za.co.zynafin;

import java.lang.Double;
import java.lang.String;
import za.co.zynafin.Bank;

privileged aspect BankAccount_Roo_JavaBean {
    
    public String BankAccount.getAccountNumber() {
        return this.accountNumber;
    }
    
    public void BankAccount.setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    public Bank BankAccount.getBank() {
        return this.bank;
    }
    
    public void BankAccount.setBank(Bank bank) {
        this.bank = bank;
    }
    
    public Double BankAccount.getBalance() {
        return this.balance;
    }
    
    public void BankAccount.setBalance(Double balance) {
        this.balance = balance;
    }
    
}
