package za.co.zynafin;

import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Expense;

privileged aspect Expense_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Expense.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Expense.id;
    
    @Version
    @Column(name = "version")
    private Integer Expense.version;
    
    public Long Expense.getId() {
        return this.id;
    }
    
    public void Expense.setId(Long id) {
        this.id = id;
    }
    
    public Integer Expense.getVersion() {
        return this.version;
    }
    
    public void Expense.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Expense.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Expense.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Expense attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Expense.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Expense Expense.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Expense merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Expense.entityManager() {
        EntityManager em = new Expense().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Expense.countExpenses() {
        return ((Number) entityManager().createQuery("select count(o) from Expense o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Expense> Expense.findAllExpenses() {
        return entityManager().createQuery("select o from Expense o").getResultList();
    }
    
    public static Expense Expense.findExpense(Long id) {
        if (id == null) return null;
        return entityManager().find(Expense.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Expense> Expense.findExpenseEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Expense o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
