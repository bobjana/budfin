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
import za.co.zynafin.ExpenseCategory;

privileged aspect ExpenseCategory_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ExpenseCategory.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ExpenseCategory.id;
    
    @Version
    @Column(name = "version")
    private Integer ExpenseCategory.version;
    
    public Long ExpenseCategory.getId() {
        return this.id;
    }
    
    public void ExpenseCategory.setId(Long id) {
        this.id = id;
    }
    
    public Integer ExpenseCategory.getVersion() {
        return this.version;
    }
    
    public void ExpenseCategory.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ExpenseCategory.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExpenseCategory.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExpenseCategory attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExpenseCategory.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public ExpenseCategory ExpenseCategory.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExpenseCategory merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ExpenseCategory.entityManager() {
        EntityManager em = new ExpenseCategory().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExpenseCategory.countExpenseCategorys() {
        return ((Number) entityManager().createQuery("select count(o) from ExpenseCategory o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ExpenseCategory> ExpenseCategory.findAllExpenseCategorys() {
        return entityManager().createQuery("select o from ExpenseCategory o").getResultList();
    }
    
    public static ExpenseCategory ExpenseCategory.findExpenseCategory(Long id) {
        if (id == null) return null;
        return entityManager().find(ExpenseCategory.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ExpenseCategory> ExpenseCategory.findExpenseCategoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ExpenseCategory o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
