package za.co.zynafin;

import java.lang.String;

privileged aspect ExpenseCategory_Roo_ToString {
    
    public String ExpenseCategory.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
