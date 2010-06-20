package za.co.zynafin;

import java.lang.String;

privileged aspect Tranzaction_Roo_ToString {
    
    public String Tranzaction.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Reference: ").append(getReference()).append(", ");
        sb.append("Ammount: ").append(getAmmount()).append(", ");
        sb.append("Date: ").append(getDate()).append(", ");
        sb.append("BankAccount: ").append(getBankAccount());
        return sb.toString();
    }
    
}
