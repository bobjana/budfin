package za.co.zynafin;

import java.util.Date;
import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import za.co.zynafin.BankAccount;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Tranzaction {

    private String reference;

    private double ammount;

    private Date date;

    @ManyToOne(targetEntity = BankAccount.class)
    @JoinColumn
    private BankAccount bankAccount;
}
