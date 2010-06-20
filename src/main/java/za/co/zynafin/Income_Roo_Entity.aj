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
import za.co.zynafin.Income;

privileged aspect Income_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Income.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Income.id;
    
    @Version
    @Column(name = "version")
    private Integer Income.version;
    
    public Long Income.getId() {
        return this.id;
    }
    
    public void Income.setId(Long id) {
        this.id = id;
    }
    
    public Integer Income.getVersion() {
        return this.version;
    }
    
    public void Income.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Income.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Income.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Income attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Income.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Income Income.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Income merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Income.entityManager() {
        EntityManager em = new Income().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Income.countIncomes() {
        return ((Number) entityManager().createQuery("select count(o) from Income o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Income> Income.findAllIncomes() {
        return entityManager().createQuery("select o from Income o").getResultList();
    }
    
    public static Income Income.findIncome(Long id) {
        if (id == null) return null;
        return entityManager().find(Income.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Income> Income.findIncomeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Income o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
