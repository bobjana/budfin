package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.TranzactionDataOnDemand;

privileged aspect TranzactionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TranzactionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TranzactionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private TranzactionDataOnDemand TranzactionIntegrationTest.dod;
    
    @Test
    public void TranzactionIntegrationTest.testCountTranzactions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        long count = za.co.zynafin.Tranzaction.countTranzactions();
        org.junit.Assert.assertTrue("Counter for 'Tranzaction' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TranzactionIntegrationTest.testFindTranzaction() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        java.lang.Long id = dod.getRandomTranzaction().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to provide an identifier", id);
        za.co.zynafin.Tranzaction obj = za.co.zynafin.Tranzaction.findTranzaction(id);
        org.junit.Assert.assertNotNull("Find method for 'Tranzaction' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Tranzaction' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TranzactionIntegrationTest.testFindAllTranzactions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        long count = za.co.zynafin.Tranzaction.countTranzactions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Tranzaction', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.Tranzaction> result = za.co.zynafin.Tranzaction.findAllTranzactions();
        org.junit.Assert.assertNotNull("Find all method for 'Tranzaction' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Tranzaction' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TranzactionIntegrationTest.testFindTranzactionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        long count = za.co.zynafin.Tranzaction.countTranzactions();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.Tranzaction> result = za.co.zynafin.Tranzaction.findTranzactionEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Tranzaction' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Tranzaction' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void TranzactionIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        java.lang.Long id = dod.getRandomTranzaction().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to provide an identifier", id);
        za.co.zynafin.Tranzaction obj = za.co.zynafin.Tranzaction.findTranzaction(id);
        org.junit.Assert.assertNotNull("Find method for 'Tranzaction' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTranzaction(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tranzaction' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TranzactionIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        java.lang.Long id = dod.getRandomTranzaction().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to provide an identifier", id);
        za.co.zynafin.Tranzaction obj = za.co.zynafin.Tranzaction.findTranzaction(id);
        org.junit.Assert.assertNotNull("Find method for 'Tranzaction' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTranzaction(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tranzaction' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TranzactionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        za.co.zynafin.Tranzaction obj = dod.getNewTransientTranzaction(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Tranzaction' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Tranzaction' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void TranzactionIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to initialize correctly", dod.getRandomTranzaction());
        java.lang.Long id = dod.getRandomTranzaction().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tranzaction' failed to provide an identifier", id);
        za.co.zynafin.Tranzaction obj = za.co.zynafin.Tranzaction.findTranzaction(id);
        org.junit.Assert.assertNotNull("Find method for 'Tranzaction' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Tranzaction' with identifier '" + id + "'", za.co.zynafin.Tranzaction.findTranzaction(id));
    }
    
}
