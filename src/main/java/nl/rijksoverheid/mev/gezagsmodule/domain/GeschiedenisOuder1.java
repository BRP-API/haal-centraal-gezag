package nl.rijksoverheid.mev.gezagsmodule.domain;

import nl.rijksoverheid.mev.brp.brpv.generated.tables.records.Lo3PlPersoonRecord;
import org.apache.commons.lang3.builder.EqualsBuilder;

import java.util.Objects;

/**
 * Geschiedenis persoon
 */
@Categorie(number = "52", name = "ouder 1 (historie)")
public class GeschiedenisOuder1 extends PotentieelInOnderzoek implements WithAktenummer {

    @VeldNummer(number = "528120", name = "aktenummer van ouder 1 (historie)")
    private final String aktenummer;

    public GeschiedenisOuder1(final Lo3PlPersoonRecord lo3PlPersoonRecord) {
        var onderzoekGegevensAanduiding = lo3PlPersoonRecord.getOnderzoekGegevensAand();
        var onderzoekGegevensAanduidingAsString = onderzoekGegevensAanduiding == null ? null : "%06d".formatted(onderzoekGegevensAanduiding);

        aktenummer = lo3PlPersoonRecord.getAkteNr();
        aanduidingGegevensInOnderzoek = onderzoekGegevensAanduidingAsString;
        datumEindeOnderzoek = Objects.toString(lo3PlPersoonRecord.getOnderzoekEindDatum(), null);
    }

    @Override
    public String getAktenummer() {
        registerIfInOnderzoek("aktenummer", getClass());

        return aktenummer;
    }

    @Override
    public boolean equals(Object o) {
        return EqualsBuilder.reflectionEquals(this, o);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                getAktenummer(),
                getAanduidingGegevensInOnderzoek(),
                getDatumEindeOnderzoek());
    }
}