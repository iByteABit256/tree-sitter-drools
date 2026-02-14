import io.github.treesitter.jtreesitter.Language;
import io.github.treesitter.jtreesitter.drools.TreeSitterDrools;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

public class TreeSitterDroolsTest {
    @Test
    public void testCanLoadLanguage() {
        assertDoesNotThrow(() -> new Language(TreeSitterDrools.language()));
    }
}
