package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect TranzactionDataOnDemand_Roo_Configurable {
    
    declare @type: TranzactionDataOnDemand: @Configurable;
    
}
