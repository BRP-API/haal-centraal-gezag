package nl.rijksoverheid.mev.gezagsmodule.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * Gezagsrelatie tussen minderjarig en meerderjarige met soort gezag
 */
@AllArgsConstructor
@Getter
@Setter
public class Gezagsrelatie {

    private String bsnBevraagdePersoon;
    private String bsnMinderjarige;
    private String soortGezag;
    private String bsnMeerderjarige;
    private String toelichting;

    public Gezagsrelatie(final String bsnMinderjarige,
            final String soortGezag) {
        this.bsnMinderjarige = bsnMinderjarige;
        this.soortGezag = soortGezag;
    }
}
