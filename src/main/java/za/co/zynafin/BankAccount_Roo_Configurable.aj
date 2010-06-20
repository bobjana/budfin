package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect BankAccount_Roo_Configurable {
    
    declare @type: BankAccount: @Configurable;
    
}
