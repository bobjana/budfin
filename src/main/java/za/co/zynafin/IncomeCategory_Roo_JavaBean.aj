package za.co.zynafin;

import java.lang.String;

privileged aspect IncomeCategory_Roo_JavaBean {
    
    public String IncomeCategory.getName() {
        return this.name;
    }
    
    public void IncomeCategory.setName(String name) {
        this.name = name;
    }
    
}
