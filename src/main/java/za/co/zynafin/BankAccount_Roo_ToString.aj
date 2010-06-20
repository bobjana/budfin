package za.co.zynafin;

import java.lang.String;

privileged aspect BankAccount_Roo_ToString {
    
    public String BankAccount.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("AccountNumber: ").append(getAccountNumber()).append(", ");
        sb.append("Bank: ").append(getBank()).append(", ");
        sb.append("Balance: ").append(getBalance());
        return sb.toString();
    }
    
}
