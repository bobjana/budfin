package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.BankAccountDataOnDemand;

privileged aspect BankAccountIntegrationTest_Roo_IntegrationTest {
    
    declare @type: BankAccountIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: BankAccountIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private BankAccountDataOnDemand BankAccountIntegrationTest.dod;
    
    @Test
    public void BankAccountIntegrationTest.testCountBankAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        long count = za.co.zynafin.BankAccount.countBankAccounts();
        org.junit.Assert.assertTrue("Counter for 'BankAccount' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void BankAccountIntegrationTest.testFindBankAccount() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        java.lang.Long id = dod.getRandomBankAccount().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to provide an identifier", id);
        za.co.zynafin.BankAccount obj = za.co.zynafin.BankAccount.findBankAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'BankAccount' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'BankAccount' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void BankAccountIntegrationTest.testFindAllBankAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        long count = za.co.zynafin.BankAccount.countBankAccounts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'BankAccount', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.BankAccount> result = za.co.zynafin.BankAccount.findAllBankAccounts();
        org.junit.Assert.assertNotNull("Find all method for 'BankAccount' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'BankAccount' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void BankAccountIntegrationTest.testFindBankAccountEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        long count = za.co.zynafin.BankAccount.countBankAccounts();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.BankAccount> result = za.co.zynafin.BankAccount.findBankAccountEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'BankAccount' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'BankAccount' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void BankAccountIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        java.lang.Long id = dod.getRandomBankAccount().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to provide an identifier", id);
        za.co.zynafin.BankAccount obj = za.co.zynafin.BankAccount.findBankAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'BankAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyBankAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'BankAccount' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void BankAccountIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        java.lang.Long id = dod.getRandomBankAccount().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to provide an identifier", id);
        za.co.zynafin.BankAccount obj = za.co.zynafin.BankAccount.findBankAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'BankAccount' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyBankAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'BankAccount' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void BankAccountIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        za.co.zynafin.BankAccount obj = dod.getNewTransientBankAccount(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'BankAccount' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'BankAccount' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void BankAccountIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to initialize correctly", dod.getRandomBankAccount());
        java.lang.Long id = dod.getRandomBankAccount().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'BankAccount' failed to provide an identifier", id);
        za.co.zynafin.BankAccount obj = za.co.zynafin.BankAccount.findBankAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'BankAccount' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'BankAccount' with identifier '" + id + "'", za.co.zynafin.BankAccount.findBankAccount(id));
    }
    
}
