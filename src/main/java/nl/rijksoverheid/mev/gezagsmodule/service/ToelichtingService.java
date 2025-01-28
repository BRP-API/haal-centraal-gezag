package nl.rijksoverheid.mev.gezagsmodule.service;

import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service voor het samenstellen van de toelichting bij het gezag uitspraak.
 */
@Service
public class ToelichtingService {

    private static final String PLACEHOLDER = "%s";

    /**
     * Past de basis toelichting zoals opgenomen in het antwoordenmodel aan op basis van of velden in onderzoek of missende gegevens.
     *
     * @param baseToelichting   de basis toelichting
     * @param missendeGegevens  de missende gegevens, of null
     * @return de toelichting zoals uit het antwoorden model bewerkt met de additionele gegevens
     */
    public String decorateToelichting(final String baseToelichting, final List<String> missendeGegevens) {
        StringBuilder sb = new StringBuilder();
        if (baseToelichting != null && !baseToelichting.isEmpty() &&
            missendeGegevens != null && !missendeGegevens.isEmpty()) {
            setMissendeGegevens(sb, baseToelichting, missendeGegevens);
        }

        return sb.toString();
    }

    /**
     * Maakt een toelichting op basis van een error trace code en de toelichting zoals opgenomen bij route 0 in het antwoordenmodel
     *
     * @param baseToelichting de basis toelichting
     * @param errorTraceCode  de error trace code
     * @return de toelichting zoals uit het antwoorden model bewerkt met de error trace code
     */
    public String setErrorReferenceToelichting(final String baseToelichting, final String errorTraceCode) {
        return String.format(baseToelichting, errorTraceCode);
    }

    private void setMissendeGegevens(final StringBuilder sb, final String baseUitleg, final List<String> missendeGegevens) {
        if (baseUitleg.contains(PLACEHOLDER)) {
            sb.append(String.format(baseUitleg, String.join(", ", missendeGegevens)));
        } else {
            sb.append(baseUitleg);
        }
    }
}
