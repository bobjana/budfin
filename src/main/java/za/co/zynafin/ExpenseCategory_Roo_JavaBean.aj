package za.co.zynafin;

import java.lang.String;

privileged aspect ExpenseCategory_Roo_JavaBean {
    
    public String ExpenseCategory.getName() {
        return this.name;
    }
    
    public void ExpenseCategory.setName(String name) {
        this.name = name;
    }
    
}
