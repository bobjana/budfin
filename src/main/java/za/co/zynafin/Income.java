package za.co.zynafin;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Income {
	
	private String note;
	
    @ManyToOne(targetEntity = Tranzaction.class)
    @JoinColumn
	private Tranzaction tranzaction;
	
    @ManyToOne(targetEntity = IncomeCategory.class)
    @JoinColumn
	private IncomeCategory incomeCategory;
}
