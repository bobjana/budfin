package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect ExpenseCategory_Roo_Configurable {
    
    declare @type: ExpenseCategory: @Configurable;
    
}
