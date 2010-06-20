package za.co.zynafin;

import java.lang.String;

privileged aspect Transfer_Roo_ToString {
    
    public String Transfer.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Note: ").append(getNote()).append(", ");
        sb.append("DebitTransaction: ").append(getDebitTransaction()).append(", ");
        sb.append("CreditTransaction: ").append(getCreditTransaction());
        return sb.toString();
    }
    
}
