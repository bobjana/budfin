package za.co.zynafin;

import java.lang.String;

privileged aspect Person_Roo_ToString {
    
    public String Person.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Email: ").append(getEmail()).append(", ");
        sb.append("BankAccount: ").append(getBankAccount()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
