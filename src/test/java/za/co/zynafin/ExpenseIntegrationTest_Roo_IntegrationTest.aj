package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.ExpenseDataOnDemand;

privileged aspect ExpenseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExpenseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExpenseIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ExpenseDataOnDemand ExpenseIntegrationTest.dod;
    
    @Test
    public void ExpenseIntegrationTest.testCountExpenses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = za.co.zynafin.Expense.countExpenses();
        org.junit.Assert.assertTrue("Counter for 'Expense' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindExpense() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        java.lang.Long id = dod.getRandomExpense().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        za.co.zynafin.Expense obj = za.co.zynafin.Expense.findExpense(id);
        org.junit.Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Expense' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindAllExpenses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = za.co.zynafin.Expense.countExpenses();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Expense', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.Expense> result = za.co.zynafin.Expense.findAllExpenses();
        org.junit.Assert.assertNotNull("Find all method for 'Expense' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Expense' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExpenseIntegrationTest.testFindExpenseEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        long count = za.co.zynafin.Expense.countExpenses();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.Expense> result = za.co.zynafin.Expense.findExpenseEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Expense' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Expense' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ExpenseIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        java.lang.Long id = dod.getRandomExpense().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        za.co.zynafin.Expense obj = za.co.zynafin.Expense.findExpense(id);
        org.junit.Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExpense(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Expense' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExpenseIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        java.lang.Long id = dod.getRandomExpense().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        za.co.zynafin.Expense obj = za.co.zynafin.Expense.findExpense(id);
        org.junit.Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExpense(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Expense' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExpenseIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        za.co.zynafin.Expense obj = dod.getNewTransientExpense(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Expense' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Expense' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ExpenseIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to initialize correctly", dod.getRandomExpense());
        java.lang.Long id = dod.getRandomExpense().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Expense' failed to provide an identifier", id);
        za.co.zynafin.Expense obj = za.co.zynafin.Expense.findExpense(id);
        org.junit.Assert.assertNotNull("Find method for 'Expense' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Expense' with identifier '" + id + "'", za.co.zynafin.Expense.findExpense(id));
    }
    
}
