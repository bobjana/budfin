package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.IncomeDataOnDemand;

privileged aspect IncomeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: IncomeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: IncomeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private IncomeDataOnDemand IncomeIntegrationTest.dod;
    
    @Test
    public void IncomeIntegrationTest.testCountIncomes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        long count = za.co.zynafin.Income.countIncomes();
        org.junit.Assert.assertTrue("Counter for 'Income' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void IncomeIntegrationTest.testFindIncome() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        java.lang.Long id = dod.getRandomIncome().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to provide an identifier", id);
        za.co.zynafin.Income obj = za.co.zynafin.Income.findIncome(id);
        org.junit.Assert.assertNotNull("Find method for 'Income' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Income' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void IncomeIntegrationTest.testFindAllIncomes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        long count = za.co.zynafin.Income.countIncomes();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Income', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.Income> result = za.co.zynafin.Income.findAllIncomes();
        org.junit.Assert.assertNotNull("Find all method for 'Income' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Income' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void IncomeIntegrationTest.testFindIncomeEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        long count = za.co.zynafin.Income.countIncomes();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.Income> result = za.co.zynafin.Income.findIncomeEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Income' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Income' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void IncomeIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        java.lang.Long id = dod.getRandomIncome().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to provide an identifier", id);
        za.co.zynafin.Income obj = za.co.zynafin.Income.findIncome(id);
        org.junit.Assert.assertNotNull("Find method for 'Income' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIncome(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Income' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void IncomeIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        java.lang.Long id = dod.getRandomIncome().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to provide an identifier", id);
        za.co.zynafin.Income obj = za.co.zynafin.Income.findIncome(id);
        org.junit.Assert.assertNotNull("Find method for 'Income' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIncome(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Income' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void IncomeIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        za.co.zynafin.Income obj = dod.getNewTransientIncome(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Income' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Income' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void IncomeIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to initialize correctly", dod.getRandomIncome());
        java.lang.Long id = dod.getRandomIncome().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Income' failed to provide an identifier", id);
        za.co.zynafin.Income obj = za.co.zynafin.Income.findIncome(id);
        org.junit.Assert.assertNotNull("Find method for 'Income' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Income' with identifier '" + id + "'", za.co.zynafin.Income.findIncome(id));
    }
    
}
