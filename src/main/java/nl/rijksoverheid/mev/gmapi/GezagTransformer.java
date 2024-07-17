package nl.rijksoverheid.mev.gmapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nl.rijksoverheid.mev.gezagsmodule.model.Gezagsrelatie;
import org.springframework.stereotype.Component;
import org.openapitools.model.*;

/**
 * Vertaal gezagrelaties naar Persoon met abstract gezagrelatie.
 *
 * <p>
 * FUTURE_WORK: Voor het correct bepalen van de relaties is meer informatie
 * nodig dan op dit moment beschikbaar is in de gezagsmodule. In de huidige BRP
 * API wordt deze functionaliteit wel opgenomen en kan gebruikt worden als
 * referentie. Voor het correct bepalen van de relaties is meer informatie over
 * de personen nodig.
 * <br>
 * Zie: Rvig.HaalCentraalApi.Personen.Interfaces.GezagTransformer Zie ook:
 * Rvig.HaalCentraalApi.Personen.Services.GbaPersonenApiService
 * <br>
 * Deze aanvulling kan gemaakt worden wanneer de database communicatie
 * beschikbaar is
 * </p>
 */
@Component
public class GezagTransformer {

    /**
     * Gegeven de gezagrelaties zoals deze nu uit de gezagmodule geleverd worden
     *
     * @param gezagrelaties de gezagrelaties om te vertalen
     * @return de persoon objecten met de vertaalde gezag relaties
     */
    public List<Persoon> fromGezagrelaties(final List<Gezagsrelatie> gezagrelaties) {
        Map<String, Persoon> personen = new HashMap<>();

        if (gezagrelaties != null && !gezagrelaties.isEmpty()) {
            for (Gezagsrelatie gezagsrelatie : gezagrelaties) {
                Persoon persoon;
                String bsnBevraagdePersoon = gezagsrelatie.bsnBevraagdePersoon();
                if (personen.containsKey(bsnBevraagdePersoon)) {
                    persoon = personen.get(bsnBevraagdePersoon);
                } else {
                    persoon = new Persoon().burgerservicenummer(gezagsrelatie.bsnBevraagdePersoon());

                    personen.put(bsnBevraagdePersoon, persoon);
                }

                transformGezagForPersoon(persoon, gezagsrelatie);
            }

        }

        return new ArrayList<>(personen.values());
    }

    /**
     * Transformeer gezag voor persoon
     * <br>
     * FUTURE_WORK: bij GG en bij Voogdij moet de ouder en niet ouder gescheiden
     * worden, hier is meer informatie voor nodig
     *
     * @param persoon de persoon
     * @param gezagsrelatie de gezagsrelatie
     */
    private void transformGezagForPersoon(final Persoon persoon, final Gezagsrelatie gezagsrelatie) {
        switch (gezagsrelatie.soortGezag()) {
            case "OG1" -> {
                AbstractGezagsrelatie gezag = new EenhoofdigOuderlijkGezag()
                        .ouder(new GezagOuder().burgerservicenummer(gezagsrelatie.bsnMeerderjarige()))
                        .minderjarige(new Minderjarige().burgerservicenummer(gezagsrelatie.bsnMinderjarige()))
                        .toelichting(gezagsrelatie.toelichting());

                persoon.addGezagItem(gezag);
            }
            case "OG2" -> {
                AbstractGezagsrelatie gezag = new TweehoofdigOuderlijkGezag()
                        .minderjarige(new Minderjarige().burgerservicenummer(gezagsrelatie.bsnMinderjarige()))
                        .addOudersItem(new GezagOuder().burgerservicenummer(gezagsrelatie.bsnMeerderjarige()))
                        .toelichting(gezagsrelatie.toelichting());

                persoon.addGezagItem(gezag);
            }
            case "GG" -> {
                AbstractGezagsrelatie gezag = new GezamenlijkGezag()
                        .minderjarige(new Minderjarige().burgerservicenummer(gezagsrelatie.bsnMinderjarige()))
                        .ouder(new GezagOuder().burgerservicenummer(gezagsrelatie.bsnMeerderjarige()))
                        .toelichting(gezagsrelatie.toelichting());

                persoon.addGezagItem(gezag);
            }
            case "V" -> {
                AbstractGezagsrelatie gezag = new Voogdij()
                        .minderjarige(new Minderjarige().burgerservicenummer(gezagsrelatie.bsnMinderjarige()))
                        .addDerdenItem(new Meerderjarige().burgerservicenummer(gezagsrelatie.bsnMeerderjarige()))
                        .toelichting(gezagsrelatie.toelichting());

                persoon.addGezagItem(gezag);
            }
            case "G" ->
                persoon.addGezagItem(new TijdelijkGeenGezag().toelichting(gezagsrelatie.toelichting()));
            case "N" ->
                persoon.addGezagItem(new GezagNietTeBepalen().toelichting(gezagsrelatie.toelichting()));
        }
    }
}
