package za.co.zynafin;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import za.co.zynafin.Tranzaction;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Transfer {

    private String note;

    @ManyToOne(targetEntity = Tranzaction.class)
    @JoinColumn
    private Tranzaction debitTransaction;

    @ManyToOne(targetEntity = Tranzaction.class)
    @JoinColumn
    private Tranzaction creditTransaction;
}
