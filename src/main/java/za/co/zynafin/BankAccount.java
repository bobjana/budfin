package za.co.zynafin;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import za.co.zynafin.Bank;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class BankAccount {

    @NotNull
    @Size(min = 4, max = 20)
    private String accountNumber;

    @Enumerated
    private Bank bank;

    private Double balance;
}
