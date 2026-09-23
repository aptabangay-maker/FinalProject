package com.bootcamp;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class HelloWorldTest {
    @Test
    public void testMessage() {
        HelloWorld hw = new HelloWorld();
        assertEquals("You completed DevOps bootcamp Batch 17!", hw.getMessage());
    }
}
