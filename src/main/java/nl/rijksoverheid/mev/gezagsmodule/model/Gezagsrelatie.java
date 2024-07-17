package nl.rijksoverheid.mev.gezagsmodule.model;

/**
 * Gezagsrelatie tussen minderjarig en meerderjarige met soort gezag
 */
public record Gezagsrelatie(
    String bsnBevraagdePersoon,
    String bsnMinderjarige,
    String soortGezag,
    String bsnMeerderjarige,
    String toelichting
) {
}
