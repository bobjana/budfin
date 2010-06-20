package za.co.zynafin;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.Person;

privileged aspect PersonDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PersonDataOnDemand: @Component;
    
    private Random PersonDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Person> PersonDataOnDemand.data;
    
    public Person PersonDataOnDemand.getNewTransientPerson(int index) {
        za.co.zynafin.Person obj = new za.co.zynafin.Person();
        obj.setBankAccount(null);
        obj.setEmail("email_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Person PersonDataOnDemand.getSpecificPerson(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Person obj = data.get(index);
        return Person.findPerson(obj.getId());
    }
    
    public Person PersonDataOnDemand.getRandomPerson() {
        init();
        Person obj = data.get(rnd.nextInt(data.size()));
        return Person.findPerson(obj.getId());
    }
    
    public boolean PersonDataOnDemand.modifyPerson(Person obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void PersonDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = za.co.zynafin.Person.findPersonEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Person' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<za.co.zynafin.Person>();
        for (int i = 0; i < 10; i++) {
            za.co.zynafin.Person obj = getNewTransientPerson(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
