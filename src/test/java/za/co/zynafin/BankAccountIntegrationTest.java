package za.co.zynafin;

import org.springframework.roo.addon.test.RooIntegrationTest;
import za.co.zynafin.BankAccount;
import org.junit.Test;

@RooIntegrationTest(entity = BankAccount.class)
public class BankAccountIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
