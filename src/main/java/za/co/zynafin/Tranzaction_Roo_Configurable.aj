package za.co.zynafin;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Tranzaction_Roo_Configurable {
    
    declare @type: Tranzaction: @Configurable;
    
}
