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
import za.co.zynafin.IncomeCategory;

privileged aspect IncomeCategory_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager IncomeCategory.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long IncomeCategory.id;
    
    @Version
    @Column(name = "version")
    private Integer IncomeCategory.version;
    
    public Long IncomeCategory.getId() {
        return this.id;
    }
    
    public void IncomeCategory.setId(Long id) {
        this.id = id;
    }
    
    public Integer IncomeCategory.getVersion() {
        return this.version;
    }
    
    public void IncomeCategory.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void IncomeCategory.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void IncomeCategory.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            IncomeCategory attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void IncomeCategory.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public IncomeCategory IncomeCategory.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        IncomeCategory merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager IncomeCategory.entityManager() {
        EntityManager em = new IncomeCategory().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long IncomeCategory.countIncomeCategorys() {
        return ((Number) entityManager().createQuery("select count(o) from IncomeCategory o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<IncomeCategory> IncomeCategory.findAllIncomeCategorys() {
        return entityManager().createQuery("select o from IncomeCategory o").getResultList();
    }
    
    public static IncomeCategory IncomeCategory.findIncomeCategory(Long id) {
        if (id == null) return null;
        return entityManager().find(IncomeCategory.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<IncomeCategory> IncomeCategory.findIncomeCategoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from IncomeCategory o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
