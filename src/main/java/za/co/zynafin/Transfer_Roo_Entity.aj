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
import za.co.zynafin.Transfer;

privileged aspect Transfer_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Transfer.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Transfer.id;
    
    @Version
    @Column(name = "version")
    private Integer Transfer.version;
    
    public Long Transfer.getId() {
        return this.id;
    }
    
    public void Transfer.setId(Long id) {
        this.id = id;
    }
    
    public Integer Transfer.getVersion() {
        return this.version;
    }
    
    public void Transfer.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Transfer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Transfer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Transfer attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Transfer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Transfer Transfer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Transfer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Transfer.entityManager() {
        EntityManager em = new Transfer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Transfer.countTransfers() {
        return ((Number) entityManager().createQuery("select count(o) from Transfer o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Transfer> Transfer.findAllTransfers() {
        return entityManager().createQuery("select o from Transfer o").getResultList();
    }
    
    public static Transfer Transfer.findTransfer(Long id) {
        if (id == null) return null;
        return entityManager().find(Transfer.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Transfer> Transfer.findTransferEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Transfer o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
