package nl.rijksoverheid.mev.gezagsmodule.domain.gezagvraag;

import nl.rijksoverheid.mev.gezagsmodule.domain.Ouder1;
import nl.rijksoverheid.mev.gezagsmodule.domain.Ouder2;
import nl.rijksoverheid.mev.gezagsmodule.domain.Persoonslijst;
import nl.rijksoverheid.mev.gezagsmodule.domain.PreconditieChecker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import static nl.rijksoverheid.mev.gezagsmodule.domain.Persoonslijst.isValideGeslachtsnaam;

/**
 * v2b_1 "Ja" als kind staande huwelijk of partnerschap geboren is, anders "Nee".
 * <p>
 * Nu vastgesteld is dat het kind 1 (of 2) ouder(s) heeft, we controleren of deze ouder(s) een
 * relatie had(den) tijdens de geboorte van het kind. Als dat het geval is (en er geen ontkenning
 * van ouderschap door de ander is en het huwelijk is actueel), dan is het antwoord "Ja".
 */
@Component
public class IsStaandeHuwelijkOfPartnerschapGeboren implements GezagVraag {

    private static final Logger logger = LoggerFactory.getLogger(IsStaandeHuwelijkOfPartnerschapGeboren.class);

    private static final String QUESTION_ID = "v2b.1";
    private static final String V2B_1_JA = "Ja";
    private static final String V2B_1_NEE = "Nee";
    private static final String OUDER_1 = "ouder1";
    private static final String OUDER_2 = "ouder2";

    @Override
    public String getQuestionId() {
        return QUESTION_ID;
    }

    @Override
    public GezagVraagResult perform(final GezagsBepaling gezagsBepaling) {
        final var plPersoon = gezagsBepaling.getPlPersoon();

        var answer = V2B_1_NEE;
        String geboorteDatumKind = plPersoon.getPersoon().getGeboortedatum();
        Ouder1 lOuder1 = plPersoon.getOuder1();
        Ouder2 lOuder2 = plPersoon.getOuder2();
        if (lOuder1 != null && isValideGeslachtsnaam(lOuder1.getGeslachtsnaam())) {
            final var plOuder1 = gezagsBepaling.getPlOuder1();
            PreconditieChecker.preconditieCheckGeregistreerd(OUDER_1, plOuder1);
            if (heeftOuderRelatieBijGeboorteKind(plOuder1, geboorteDatumKind)
                && !plPersoon.ontkenningOuderschapDoorOuder2()
                && !plPersoon.ontkenningErkenningDoorOuder2()) {
                answer = V2B_1_JA;
            }
        }
        if (lOuder2 != null && isValideGeslachtsnaam(lOuder2.getGeslachtsnaam())) {
            final var plOuder2 = gezagsBepaling.getPlOuder2();
            PreconditieChecker.preconditieCheckGeregistreerd(OUDER_2, plOuder2);
            if (heeftOuderRelatieBijGeboorteKind(plOuder2, geboorteDatumKind)
                && !plPersoon.ontkenningOuderschapDoorOuder1()
                && !plPersoon.ontkenningErkenningDoorOuder1()) {
                answer = V2B_1_JA;
            }
        }

        logger.debug("""
            2b.1 Is het kind staande huwelijk of partnerschap geboren?
            {}""", answer);
        gezagsBepaling.getArAntwoordenModel().setV02B01(answer);
        return new GezagVraagResult(QUESTION_ID, answer);
    }

    public boolean heeftOuderRelatieBijGeboorteKind(final Persoonslijst plOuder,
                                                    final String geboortedatum) {
        final var hopPlOuder = plOuder.getHuwelijkOfPartnerschappen();
        if (!hopPlOuder.isEmpty() && hopPlOuder.get(0).getBsnPartner() != null) {
            final var hopRelaties = plOuder.getHopRelaties();
            final var geborenInRelatie =
                hopRelaties.geborenInRelatie(Integer.parseInt(geboortedatum));
            return geborenInRelatie != null;
        }
        return false;
    }
}
