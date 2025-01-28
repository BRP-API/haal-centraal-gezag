package nl.rijksoverheid.mev.gezagsmodule.service;

import nl.rijksoverheid.mev.gezagsmodule.domain.ARAntwoordenModel;
import nl.rijksoverheid.mev.gezagsmodule.domain.gezagvraag.GezagsBepaling;
import org.openapitools.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GezagsrelatieService {

    private static final Logger logger = LoggerFactory.getLogger(GezagsrelatieService.class);
    private static final String TYPE_TWEEHOOFDIG_OUDERLIJK_GEZAG = "TweehoofdigOuderlijkGezag";
    private static final String TYPE_EENHOOFDIG_OUDERLIJK_GEZAG = "EenhoofdigOuderlijkGezag";
    private static final String TYPE_GEZAMELIJK_GEZAG = "GezamenlijkGezag";
    private static final String TYPE_VOOGDIJ = "Voogdij";
    private static final String TYPE_TIJDELIJK_GEEN_GEZAG = "TijdelijkGeenGezag";
    private static final String TYPE_GEZAG_NIET_TE_BEPALEN = "GezagNietTeBepalen";

    /**
     * Bepaal op basis van het antwoorden model (resultaat van een gezagsbepaling) wat de gezagsrelaties zijn voor de persoon
     *
     * @param arAntwoordenModel resultaat van de gezagsbepaling
     * @param gezagsBepaling    de (uitgevoerde gezags bepaling
     * @return de gezagsrelaties of leeg
     */
    public List<AbstractGezagsrelatie> bepaalGezagsrelaties(
        final ARAntwoordenModel arAntwoordenModel,
        final GezagsBepaling gezagsBepaling) {
        List<AbstractGezagsrelatie> gezagsrelaties = new ArrayList<>();
        if (hasRequired(arAntwoordenModel, gezagsBepaling)) {
            return gezagsrelaties;
        }

        String burgerservicenummer = gezagsBepaling.getBurgerservicenummer();
        String burgerservicenummerPersoon = gezagsBepaling.getBurgerservicenummerPersoon();
        String burgerservicenummerOuder1 = gezagsBepaling.getBurgerservicenummerOuder1();
        String burgerservicenummerOuder2 = gezagsBepaling.getBurgerservicenummerOuder2();
        String burgerservicenummerNietOuder = gezagsBepaling.getBurgerservicenummerNietOuder();

        boolean warenVeldenInOnderzoek = gezagsBepaling.warenVeldenInOnderzoek();
        boolean bevraagdePersoonIsDeMinderjarige = burgerservicenummer.equals(burgerservicenummerPersoon);
        if (tenminsteEenRelatieMetPersoon(bevraagdePersoonIsDeMinderjarige, burgerservicenummerPersoon, burgerservicenummerOuder1, burgerservicenummerOuder2, burgerservicenummerNietOuder)) {
            String soortGezag = arAntwoordenModel.getSoortGezag();
            AbstractGezagsrelatie gezag = switch (soortGezag) {
                case "OG1" -> createEenhoofdelijkOuderlijkGezag(
                    arAntwoordenModel,
                    bevraagdePersoonIsDeMinderjarige,
                    burgerservicenummerOuder1,
                    burgerservicenummerOuder2,
                    burgerservicenummer,
                    burgerservicenummerPersoon,
                    warenVeldenInOnderzoek);
                case "OG2" -> createTweehoofdigOuderlijkGezag(
                    burgerservicenummer,
                    burgerservicenummerOuder1,
                    burgerservicenummerOuder2,
                    warenVeldenInOnderzoek);
                case "GG" -> createGezamenlijkGezag(
                    burgerservicenummer,
                    burgerservicenummerNietOuder,
                    arAntwoordenModel.hasOuder1Gezag(),
                    burgerservicenummerOuder1,
                    burgerservicenummerOuder2,
                    warenVeldenInOnderzoek);
                case "V" -> createVoogdij(
                    bevraagdePersoonIsDeMinderjarige,
                    burgerservicenummerPersoon,
                    burgerservicenummerNietOuder,
                    burgerservicenummer,
                    arAntwoordenModel.hasNietOuderGezag(),
                    warenVeldenInOnderzoek);
                case "G" ->
                    createTijdelijkeGeenGezag(bevraagdePersoonIsDeMinderjarige, burgerservicenummer, arAntwoordenModel.getUitleg(), warenVeldenInOnderzoek);
                case "N" ->
                    createGezagNietTeBepalen(bevraagdePersoonIsDeMinderjarige, burgerservicenummer, arAntwoordenModel.getUitleg(), warenVeldenInOnderzoek);
                case "NVT" -> {
                    logger.info("Gezag uitkomst is NVT");
                    yield null;
                }
                default -> {
                    logger.warn("Onverwachte gezagsoort ontvangen: {}", soortGezag);
                    yield null;
                }
            };
            if(gezag != null) {
                gezagsrelaties.add(gezag);
            }
        }

        return gezagsrelaties;
    }

    private boolean hasRequired(final ARAntwoordenModel arAntwoordenModel, final GezagsBepaling gezagsBepaling) {
        return arAntwoordenModel == null ||
            gezagsBepaling == null ||
            gezagsBepaling.getBurgerservicenummer() == null ||
            gezagsBepaling.getBurgerservicenummerPersoon() == null;
    }

    private AbstractGezagsrelatie createEenhoofdelijkOuderlijkGezag(
        final ARAntwoordenModel arAntwoordenModel,
        final boolean bevraagdePersoonIsDeMinderjarige,
        final String burgerservicenummerOuder1,
        final String burgerservicenummerOuder2,
        final String burgerservicenummer,
        final String burgerservicenummerPersoon,
        final boolean warenVeldenInOnderzoek) {
        if (arAntwoordenModel.hasOuder1Gezag() && burgerservicenummerOuder1 != null && (bevraagdePersoonIsDeMinderjarige || burgerservicenummerPersoon.equals(burgerservicenummerOuder1))) {
            return new EenhoofdigOuderlijkGezag()
                .ouder(new GezagOuder().burgerservicenummer(burgerservicenummerOuder1))
                .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
                .inOnderzoek(warenVeldenInOnderzoek)
                .type(TYPE_EENHOOFDIG_OUDERLIJK_GEZAG);
        }
        if (arAntwoordenModel.hasOuder2Gezag() && burgerservicenummerOuder2 != null && (bevraagdePersoonIsDeMinderjarige || burgerservicenummerPersoon.equals(burgerservicenummerOuder2))) {
            return new EenhoofdigOuderlijkGezag()
                .ouder(new GezagOuder().burgerservicenummer(burgerservicenummerOuder2))
                .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
                .inOnderzoek(warenVeldenInOnderzoek)
                .type(TYPE_EENHOOFDIG_OUDERLIJK_GEZAG);
        }

        return null;
    }

    private AbstractGezagsrelatie createTweehoofdigOuderlijkGezag(
        final String burgerservicenummer,
        final String burgerservicenummerOuder1,
        final String burgerservicenummerOuder2,
        final boolean warenVeldenInOnderzoek) {
        return new TweehoofdigOuderlijkGezag()
            .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
            .addOudersItem(new GezagOuder().burgerservicenummer(burgerservicenummerOuder1))
            .addOudersItem(new GezagOuder().burgerservicenummer(burgerservicenummerOuder2))
            .inOnderzoek(warenVeldenInOnderzoek)
            .type(TYPE_TWEEHOOFDIG_OUDERLIJK_GEZAG);
    }

    private AbstractGezagsrelatie createGezamenlijkGezag(
        final String burgerservicenummer,
        final String burgerservicenummerNietOuder,
        final boolean ouder1Gezag,
        final String burgerservicenummerOuder1,
        final String burgerservicenummerOuder2,
        final boolean warenVeldenInOnderzoek) {
        GezamenlijkGezag gezag = new GezamenlijkGezag()
            .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
            .type(TYPE_GEZAMELIJK_GEZAG);

        if (burgerservicenummerNietOuder != null) {
            gezag.derde(new Meerderjarige().burgerservicenummer(burgerservicenummerNietOuder));
        }

        if (ouder1Gezag && burgerservicenummerOuder1 != null) {
            gezag.ouder(new GezagOuder().burgerservicenummer(burgerservicenummerOuder1));
        } else {
            gezag.ouder(new GezagOuder().burgerservicenummer(burgerservicenummerOuder2));
        }
        gezag.inOnderzoek(warenVeldenInOnderzoek);

        return gezag;
    }

    private AbstractGezagsrelatie createVoogdij(
        final boolean bevraagdePersoonIsDeMinderjarige,
        final String burgerservicenummerPersoon,
        final String burgerservicenummerNietOuder,
        final String burgerservicenummer,
        final boolean nietOuderGezag,
        final boolean warenVeldenInOnderzoek) {
        if (bevraagdePersoonIsDeMinderjarige || burgerservicenummerPersoon.equals(burgerservicenummerNietOuder)) {
            Voogdij gezag = new Voogdij()
                .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
                .inOnderzoek(warenVeldenInOnderzoek)
                .type(TYPE_VOOGDIJ);

            if (nietOuderGezag && burgerservicenummerNietOuder != null) {
                gezag.addDerdenItem(new Meerderjarige().burgerservicenummer(burgerservicenummerNietOuder));
            }

            return gezag;
        }

        return null;
    }

    private AbstractGezagsrelatie createTijdelijkeGeenGezag(
        final boolean bevraagdePersoonIsDeMinderjarige,
        final String burgerservicenummer,
        final String uitleg,
        final boolean warenVeldenInOnderzoek) {
        if (bevraagdePersoonIsDeMinderjarige) {
            return new TijdelijkGeenGezag()
                .type(TYPE_TIJDELIJK_GEEN_GEZAG)
                .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
                .inOnderzoek(warenVeldenInOnderzoek)
                .toelichting(uitleg);
        }
        return null;
    }

    private AbstractGezagsrelatie createGezagNietTeBepalen(
        final boolean bevraagdePersoonIsDeMinderjarige,
        final String burgerservicenummer,
        final String uitleg,
        final boolean warenVeldenInOnderzoek) {
        if (bevraagdePersoonIsDeMinderjarige) {
            return new GezagNietTeBepalen()
                .type(TYPE_GEZAG_NIET_TE_BEPALEN)
                .minderjarige(new Minderjarige().burgerservicenummer(burgerservicenummer))
                .inOnderzoek(warenVeldenInOnderzoek)
                .toelichting(uitleg);
        }
        return null;
    }

    private boolean tenminsteEenRelatieMetPersoon(
        final boolean bevraagdePersoonIsDeMinderjarige,
        final String burgerservicenummerPersoon,
        final String burgerservicenummerOuder1,
        final String burgerservicenummerOuder2,
        final String burgerservicenummerNietOuder) {
        return bevraagdePersoonIsDeMinderjarige ||
            burgerservicenummerPersoon.equals(burgerservicenummerOuder1) ||
            burgerservicenummerPersoon.equals(burgerservicenummerOuder2) ||
            burgerservicenummerPersoon.equals(burgerservicenummerNietOuder);
    }
}
