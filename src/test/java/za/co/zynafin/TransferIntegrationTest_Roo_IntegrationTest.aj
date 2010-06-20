package za.co.zynafin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import za.co.zynafin.TransferDataOnDemand;

privileged aspect TransferIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TransferIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TransferIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private TransferDataOnDemand TransferIntegrationTest.dod;
    
    @Test
    public void TransferIntegrationTest.testCountTransfers() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        long count = za.co.zynafin.Transfer.countTransfers();
        org.junit.Assert.assertTrue("Counter for 'Transfer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TransferIntegrationTest.testFindTransfer() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        java.lang.Long id = dod.getRandomTransfer().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to provide an identifier", id);
        za.co.zynafin.Transfer obj = za.co.zynafin.Transfer.findTransfer(id);
        org.junit.Assert.assertNotNull("Find method for 'Transfer' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Transfer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TransferIntegrationTest.testFindAllTransfers() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        long count = za.co.zynafin.Transfer.countTransfers();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Transfer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<za.co.zynafin.Transfer> result = za.co.zynafin.Transfer.findAllTransfers();
        org.junit.Assert.assertNotNull("Find all method for 'Transfer' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Transfer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TransferIntegrationTest.testFindTransferEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        long count = za.co.zynafin.Transfer.countTransfers();
        if (count > 20) count = 20;
        java.util.List<za.co.zynafin.Transfer> result = za.co.zynafin.Transfer.findTransferEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Transfer' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Transfer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void TransferIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        java.lang.Long id = dod.getRandomTransfer().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to provide an identifier", id);
        za.co.zynafin.Transfer obj = za.co.zynafin.Transfer.findTransfer(id);
        org.junit.Assert.assertNotNull("Find method for 'Transfer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTransfer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Transfer' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TransferIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        java.lang.Long id = dod.getRandomTransfer().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to provide an identifier", id);
        za.co.zynafin.Transfer obj = za.co.zynafin.Transfer.findTransfer(id);
        org.junit.Assert.assertNotNull("Find method for 'Transfer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTransfer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Transfer' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TransferIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        za.co.zynafin.Transfer obj = dod.getNewTransientTransfer(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Transfer' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Transfer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void TransferIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to initialize correctly", dod.getRandomTransfer());
        java.lang.Long id = dod.getRandomTransfer().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Transfer' failed to provide an identifier", id);
        za.co.zynafin.Transfer obj = za.co.zynafin.Transfer.findTransfer(id);
        org.junit.Assert.assertNotNull("Find method for 'Transfer' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Transfer' with identifier '" + id + "'", za.co.zynafin.Transfer.findTransfer(id));
    }
    
}
