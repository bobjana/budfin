package za.co.zynafin;

import java.lang.String;

privileged aspect Expense_Roo_ToString {
    
    public String Expense.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Note: ").append(getNote()).append(", ");
        sb.append("Transaction: ").append(getTransaction()).append(", ");
        sb.append("ExpenseCategory: ").append(getExpenseCategory()).append(", ");
        sb.append("BankAccount: ").append(getBankAccount());
        return sb.toString();
    }
    
}
