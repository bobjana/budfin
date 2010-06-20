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
import za.co.zynafin.Tranzaction;

privileged aspect Tranzaction_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Tranzaction.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Tranzaction.id;
    
    @Version
    @Column(name = "version")
    private Integer Tranzaction.version;
    
    public Long Tranzaction.getId() {
        return this.id;
    }
    
    public void Tranzaction.setId(Long id) {
        this.id = id;
    }
    
    public Integer Tranzaction.getVersion() {
        return this.version;
    }
    
    public void Tranzaction.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Tranzaction.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Tranzaction.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Tranzaction attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Tranzaction.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Tranzaction Tranzaction.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tranzaction merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Tranzaction.entityManager() {
        EntityManager em = new Tranzaction().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Tranzaction.countTranzactions() {
        return ((Number) entityManager().createQuery("select count(o) from Tranzaction o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Tranzaction> Tranzaction.findAllTranzactions() {
        return entityManager().createQuery("select o from Tranzaction o").getResultList();
    }
    
    public static Tranzaction Tranzaction.findTranzaction(Long id) {
        if (id == null) return null;
        return entityManager().find(Tranzaction.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Tranzaction> Tranzaction.findTranzactionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Tranzaction o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
