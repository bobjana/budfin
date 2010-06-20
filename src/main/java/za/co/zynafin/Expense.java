package za.co.zynafin;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import za.co.zynafin.ExpenseCategory;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import za.co.zynafin.BankAccount;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Expense {

    private String note;

    @ManyToOne(targetEntity = Tranzaction.class)
    @JoinColumn
    private Tranzaction transaction;

    @ManyToOne(targetEntity = ExpenseCategory.class)
    @JoinColumn
    private ExpenseCategory expenseCategory;

    @ManyToOne(targetEntity = BankAccount.class)
    @JoinColumn
    private BankAccount bankAccount;
}
