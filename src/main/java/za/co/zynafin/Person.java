package za.co.zynafin;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import za.co.zynafin.BankAccount;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Person {

	@NotNull
    @Size(min = 4, max = 50)
	private String email;

    @ManyToOne(targetEntity = BankAccount.class)
    @JoinColumn
    private BankAccount bankAccount;

    @NotNull
    @Size(min = 4, max = 50)
    private String name;
}
