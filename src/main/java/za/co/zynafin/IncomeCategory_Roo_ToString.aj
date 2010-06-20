package za.co.zynafin;

import java.lang.String;

privileged aspect IncomeCategory_Roo_ToString {
    
    public String IncomeCategory.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
