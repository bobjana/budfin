package za.co.zynafin;

import java.lang.String;

privileged aspect Income_Roo_ToString {
    
    public String Income.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Note: ").append(getNote()).append(", ");
        sb.append("Tranzaction: ").append(getTranzaction()).append(", ");
        sb.append("IncomeCategory: ").append(getIncomeCategory());
        return sb.toString();
    }
    
}
