package za.co.zynafin;

import org.springframework.roo.addon.test.RooIntegrationTest;
import za.co.zynafin.Person;
import org.junit.Test;

@RooIntegrationTest(entity = Person.class)
public class PersonIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
