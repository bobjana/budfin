package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.IncomeCategoryDataOnDemand;

privileged aspect IncomeCategoryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: IncomeCategoryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: IncomeCategoryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private IncomeCategoryDataOnDemand IncomeCategoryIntegrationTest.dod;
    
    @Test
    public void IncomeCategoryIntegrationTest.testCountIncomeCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        long count = za.co.zynafin.IncomeCategory.countIncomeCategorys();
        org.junit.Assert.assertTrue("Counter for 'IncomeCategory' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void IncomeCategoryIntegrationTest.testFindIncomeCategory() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        java.lang.Long id = dod.getRandomIncomeCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to provide an identifier", id);
        za.co.zynafin.IncomeCategory obj = za.co.zynafin.IncomeCategory.findIncomeCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'IncomeCategory' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'IncomeCategory' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void IncomeCategoryIntegrationTest.testFindAllIncomeCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        long count = za.co.zynafin.IncomeCategory.countIncomeCategorys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'IncomeCategory', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.IncomeCategory> result = za.co.zynafin.IncomeCategory.findAllIncomeCategorys();
        org.junit.Assert.assertNotNull("Find all method for 'IncomeCategory' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'IncomeCategory' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void IncomeCategoryIntegrationTest.testFindIncomeCategoryEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        long count = za.co.zynafin.IncomeCategory.countIncomeCategorys();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.IncomeCategory> result = za.co.zynafin.IncomeCategory.findIncomeCategoryEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'IncomeCategory' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'IncomeCategory' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void IncomeCategoryIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        java.lang.Long id = dod.getRandomIncomeCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to provide an identifier", id);
        za.co.zynafin.IncomeCategory obj = za.co.zynafin.IncomeCategory.findIncomeCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'IncomeCategory' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIncomeCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'IncomeCategory' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void IncomeCategoryIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        java.lang.Long id = dod.getRandomIncomeCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to provide an identifier", id);
        za.co.zynafin.IncomeCategory obj = za.co.zynafin.IncomeCategory.findIncomeCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'IncomeCategory' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIncomeCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'IncomeCategory' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void IncomeCategoryIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        za.co.zynafin.IncomeCategory obj = dod.getNewTransientIncomeCategory(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'IncomeCategory' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'IncomeCategory' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void IncomeCategoryIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to initialize correctly", dod.getRandomIncomeCategory());
        java.lang.Long id = dod.getRandomIncomeCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'IncomeCategory' failed to provide an identifier", id);
        za.co.zynafin.IncomeCategory obj = za.co.zynafin.IncomeCategory.findIncomeCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'IncomeCategory' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'IncomeCategory' with identifier '" + id + "'", za.co.zynafin.IncomeCategory.findIncomeCategory(id));
    }
    
}
