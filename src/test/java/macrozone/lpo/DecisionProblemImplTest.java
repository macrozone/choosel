package macrozone.lpo;

import static org.junit.Assert.*;

import org.junit.Test;

public class DecisionProblemImplTest {

	private static final String TEST_STRING = "a test";

	@Test
	public void testGetTitle() {
		assertNull(new DecisionProblemImpl().getTitle());
	}

	@Test
	public void testSetTitle() {
		DecisionProblemImpl instance = new DecisionProblemImpl();
		instance.setTitle(TEST_STRING);
		assertEquals(TEST_STRING, instance.getTitle());

	}

}
