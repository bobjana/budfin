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
import za.co.zynafin.BankAccount;

privileged aspect BankAccount_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager BankAccount.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long BankAccount.id;
    
    @Version
    @Column(name = "version")
    private Integer BankAccount.version;
    
    public Long BankAccount.getId() {
        return this.id;
    }
    
    public void BankAccount.setId(Long id) {
        this.id = id;
    }
    
    public Integer BankAccount.getVersion() {
        return this.version;
    }
    
    public void BankAccount.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void BankAccount.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BankAccount.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BankAccount attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BankAccount.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public BankAccount BankAccount.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BankAccount merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager BankAccount.entityManager() {
        EntityManager em = new BankAccount().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BankAccount.countBankAccounts() {
        return ((Number) entityManager().createQuery("select count(o) from BankAccount o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<BankAccount> BankAccount.findAllBankAccounts() {
        return entityManager().createQuery("select o from BankAccount o").getResultList();
    }
    
    public static BankAccount BankAccount.findBankAccount(Long id) {
        if (id == null) return null;
        return entityManager().find(BankAccount.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<BankAccount> BankAccount.findBankAccountEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from BankAccount o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
