package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect BankAccountDataOnDemand_Roo_Configurable {
    
    declare @type: BankAccountDataOnDemand: @Configurable;
    
}
