package za.co.zynafin;

import org.springframework.roo.addon.test.RooIntegrationTest;
import za.co.zynafin.Expense;
import org.junit.Test;

@RooIntegrationTest(entity = Expense.class)
public class ExpenseIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
