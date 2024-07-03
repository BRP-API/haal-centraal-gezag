package nl.rijksoverheid.mev.gmapi;

import nl.rijksoverheid.mev.brpadapter.service.BrpService;
import nl.rijksoverheid.mev.common.util.BSNValidator;
import nl.rijksoverheid.mev.exception.GezagException;
import nl.rijksoverheid.mev.gezagsmodule.service.GezagService;
import nl.rijksoverheid.mev.transaction.Transaction;
import org.openapitools.model.GezagRequest;
import org.openapitools.model.Gezagsrelatie;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

/**
 * Service om te bepalen of personen <i>bevoegdheid tot gezag</i> hebben.
 */
@Service
public class BevoegdheidTotGezagService {

    private final BrpService brpService;
    private final GezagService gezagService;
    private final BSNValidator bsnValidator;

    public BevoegdheidTotGezagService(BrpService brpService, GezagService gezagService) {
        this.brpService = brpService;
        this.gezagService = gezagService;
        this.bsnValidator = new BSNValidator();
    }

    /**
     * Bepaal <i>bevoegdheid tot gezag</i> van persoon.
     * <p>
     * Voor een bsn van een minderjarige geeft deze methode alle gezagsrelaties
     * van deze persoon terug. Voor een bsn van een meerderjarige, geeft deze
     * service alle gezagsrelaties van de kinderen terug, dit kunnen ook
     * gezagsrelaties zijn met andere meerderjarigen dan degene waarvoor gezag
     * was opgevraagd. Voor een minderjarige ouder, geeft deze methode alle
     * gezaghebbenden van deze minderjarige terug, plus alle gezaghebbenden van
     * diens kinderen.
     *
     * @param gezagRequest <i>lijst van burgerservicenummer(s)</i> van de
     * persoon of personen van wie de
     * <i>bevoegdheid tot gezag</i> bepaald moet worden
     * @param transaction de transactie zoals gemaakt bij het ontvangen van de
     * aanvraag
     * @return 0, 1 of meerdere gezagsrelaties
     * @throws nl.rijksoverheid.mev.exception.GezagException wanneer onverwacht
     * het gezag niet kan worden bepaald
     */
    public List<Gezagsrelatie> bepaalBevoegdheidTotGezag(
            final GezagRequest gezagRequest,
            final Transaction transaction
    ) throws GezagException {
        List<String> bsns = gezagRequest.getBsns();
        if (!bsnValidator.isValid(bsns)) {
            return Collections.emptyList();
        }

        return Stream
                .concat(
                        gezagService.getGezag(bsns, transaction).stream().map(Gezagsrelaties::of),
                        vindGezagsrelatiesVoorKinderen(bsns, transaction)
                )
                .toList();
    }

    private Stream<Gezagsrelatie> vindGezagsrelatiesVoorKinderen(final List<String> bsns, final Transaction transaction) throws GezagException {
        return brpService.getBsnsMinderjarigeKinderen(bsns, transaction).stream()
                .map(bsn -> gezagService.getGezag(bsns, transaction))
                .flatMap(Collection::stream)
                .map(Gezagsrelaties::of)
                .filter(gezagsrelatie -> bsns.contains(gezagsrelatie.getBsnMeerderjarige()));
    }
}
