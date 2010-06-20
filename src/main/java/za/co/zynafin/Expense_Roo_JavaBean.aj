package za.co.zynafin;

import java.lang.String;
import za.co.zynafin.BankAccount;
import za.co.zynafin.ExpenseCategory;
import za.co.zynafin.Tranzaction;

privileged aspect Expense_Roo_JavaBean {
    
    public String Expense.getNote() {
        return this.note;
    }
    
    public void Expense.setNote(String note) {
        this.note = note;
    }
    
    public Tranzaction Expense.getTransaction() {
        return this.transaction;
    }
    
    public void Expense.setTransaction(Tranzaction transaction) {
        this.transaction = transaction;
    }
    
    public ExpenseCategory Expense.getExpenseCategory() {
        return this.expenseCategory;
    }
    
    public void Expense.setExpenseCategory(ExpenseCategory expenseCategory) {
        this.expenseCategory = expenseCategory;
    }
    
    public BankAccount Expense.getBankAccount() {
        return this.bankAccount;
    }
    
    public void Expense.setBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }
    
}
