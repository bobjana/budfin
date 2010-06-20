package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Expense_Roo_Configurable {
    
    declare @type: Expense: @Configurable;
    
}
