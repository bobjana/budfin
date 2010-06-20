package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.ExpenseCategoryDataOnDemand;

privileged aspect ExpenseCategoryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExpenseCategoryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExpenseCategoryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ExpenseCategoryDataOnDemand ExpenseCategoryIntegrationTest.dod;
    
    @Test
    public void ExpenseCategoryIntegrationTest.testCountExpenseCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        long count = za.co.zynafin.ExpenseCategory.countExpenseCategorys();
        org.junit.Assert.assertTrue("Counter for 'ExpenseCategory' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExpenseCategoryIntegrationTest.testFindExpenseCategory() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        java.lang.Long id = dod.getRandomExpenseCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to provide an identifier", id);
        za.co.zynafin.ExpenseCategory obj = za.co.zynafin.ExpenseCategory.findExpenseCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'ExpenseCategory' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ExpenseCategory' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExpenseCategoryIntegrationTest.testFindAllExpenseCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        long count = za.co.zynafin.ExpenseCategory.countExpenseCategorys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ExpenseCategory', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.ExpenseCategory> result = za.co.zynafin.ExpenseCategory.findAllExpenseCategorys();
        org.junit.Assert.assertNotNull("Find all method for 'ExpenseCategory' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ExpenseCategory' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExpenseCategoryIntegrationTest.testFindExpenseCategoryEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        long count = za.co.zynafin.ExpenseCategory.countExpenseCategorys();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.ExpenseCategory> result = za.co.zynafin.ExpenseCategory.findExpenseCategoryEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ExpenseCategory' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ExpenseCategory' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ExpenseCategoryIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        java.lang.Long id = dod.getRandomExpenseCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to provide an identifier", id);
        za.co.zynafin.ExpenseCategory obj = za.co.zynafin.ExpenseCategory.findExpenseCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'ExpenseCategory' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExpenseCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ExpenseCategory' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExpenseCategoryIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        java.lang.Long id = dod.getRandomExpenseCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to provide an identifier", id);
        za.co.zynafin.ExpenseCategory obj = za.co.zynafin.ExpenseCategory.findExpenseCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'ExpenseCategory' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExpenseCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ExpenseCategory' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExpenseCategoryIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        za.co.zynafin.ExpenseCategory obj = dod.getNewTransientExpenseCategory(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ExpenseCategory' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ExpenseCategory' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ExpenseCategoryIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to initialize correctly", dod.getRandomExpenseCategory());
        java.lang.Long id = dod.getRandomExpenseCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ExpenseCategory' failed to provide an identifier", id);
        za.co.zynafin.ExpenseCategory obj = za.co.zynafin.ExpenseCategory.findExpenseCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'ExpenseCategory' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ExpenseCategory' with identifier '" + id + "'", za.co.zynafin.ExpenseCategory.findExpenseCategory(id));
    }
    
}
