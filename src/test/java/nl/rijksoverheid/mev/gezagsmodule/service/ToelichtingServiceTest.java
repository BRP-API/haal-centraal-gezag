package nl.rijksoverheid.mev.gezagsmodule.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;

class ToelichtingServiceTest {

    private ToelichtingService classUnderTest;

    private static final String BASE_TOELICHTING = "mock";
    private static final String BASE_MISSENDE_VELDEN_TOELICHTING = "missende gegevens: %s";
    private static final String FIELD_1 = "field 1";
    private static final String FIELD_2 = "field 2";

    @BeforeEach
    public void setup() {
        classUnderTest = new ToelichtingService();
    }

    @Test
    void nullBaseToelichtingAndMissendeGegevensExpectingEmptyString() {
        String toelichting = null;
        List<String> missendeGegevens = null;

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);

        assertTrue(result.isEmpty());
    }

    @Test
    void emptyBaseToelichtingAndMissendeGegevensExpectingEmptyString() {
        String toelichting = "";
        List<String> missendeGegevens = null;

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);

        assertTrue(result.isEmpty());
    }

    @Test
    void baseToelichtingAndMissendeGegevensExpectingEmpty() {
        String toelichting = BASE_TOELICHTING;
        List<String> missendeGegevens = null;

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);

        assertTrue(result.isEmpty());
    }

    @Test
    void baseToelichtingAndEmptyMissendeGegevensExpectingEmpty() {
        String toelichting = BASE_TOELICHTING;
        List<String> missendeGegevens = new ArrayList<>();

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);

        assertTrue(result.isEmpty());
    }

    @Test
    void baseToelichtingAndOneMissendeGegegevensExpectingFormattedToelichting() {
        String toelichting = BASE_MISSENDE_VELDEN_TOELICHTING;
        List<String> missendeGegevens = List.of(FIELD_1);

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);
        
        assertTrue(result.startsWith(toelichting.substring(0, (toelichting.length() - 2))));
        assertTrue(result.contains(FIELD_1));
    }
        
    @Test
    void baseToelichtingAndTwoMissendeGegegevensExpectingFormattedToelichting() {
        String toelichting = BASE_MISSENDE_VELDEN_TOELICHTING;
        List<String> missendeGegevens = List.of(FIELD_1, FIELD_2);

        String result = classUnderTest.decorateToelichting(toelichting, missendeGegevens);
        
        assertTrue(result.startsWith(toelichting.substring(0, (toelichting.length() - 2))));
        assertTrue(result.contains(FIELD_1));
        assertTrue(result.contains(FIELD_2));
    }
}
