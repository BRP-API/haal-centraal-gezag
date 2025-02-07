# language: nl
@integratie @stap-documentatie
Functionaliteit: Stap definities ten behoeve van specificeren gezagsrelaties

  Achtergrond:
    Gegeven de tabellen 'lo3_pl' bevat geen rijen

  Regel: Een persoon benoemen we functioneel met een naam en technisch met een burgerservicenummer
    Standaard is een persoon in Nederland geboren met een Nederlandse geboorteakte.

    Scenario: de persoon '{naam}' met burgerservicenummer '{bsn}'
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               6030 | 1AA0100 |

  Regel: Meerderjarigheid, minderjarigheid en geboorte worden toegevoegd aan de persoon

    Scenario: is meerderjarig
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is meerderjarig
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          | gisteren - 45 jaar |               6030 | 1AA0100 |

    Scenario: is minderjarig
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is minderjarig
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          | gisteren - 17 jaar |               6030 | 1AA0100 |

    Scenario: is {relatievedatum} geboren
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is <relatieve datum> geboren
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum    | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          | <relatieve datum> |               6030 | 1AA0100 |

      Voorbeelden:
        | relatieve datum |
        | gisteren        |
        |  2 jaar geleden |
        | vorige maand    |

    Scenario: '{naam}' is geboren op {datum}
      # datum heeft formaat d-m-j, met d en m heeft 1 of 2 cijfers, j heeft 4 cijfers
      # met de (optionele) naam wijzigt de context naar deze persoon
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      En de persoon 'Anna' met burgerservicenummer '000000024'
      En 'Tosca' is geboren op <datum>
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum  | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          | <geboortedatum> |               6030 | 1AA0100 |
      En heeft de persoon 'Anna' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     2 | P            |         0 |       0 |         000000024 | Anna           |               6030 | 1AA0100 |

      Voorbeelden:
        | datum      | geboortedatum |
        | 31-12-2022 |      20221231 |
        |   1-1-2023 |      20230101 |

    Scenario: is geboren op {datum}
      # datum heeft formaat d-m-j, met d en m heeft 1 of 2 cijfers, j heeft 4 cijfers
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * 'Tosca' is geboren op <datum>
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum  | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          | <geboortedatum> |               6030 | 1AA0100 |

      Voorbeelden:
        | datum      | geboortedatum |
        | 31-12-2022 |      20221231 |
        |   1-1-2023 |      20230101 |

    Scenario: is geboren in België
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is geboren in België
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               5010 |

  Regel: Inschrijving, immigratie en emigratie wordt vastgelegd in de verblijfplaats

    Scenario: is ingeschreven in een Nederlandse gemeente
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is ingeschreven in een Nederlandse gemeente
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               6030 | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code |
        |     1 |       0 |                       0518 |

    Scenario: is ingeschreven als niet-ingezetene met een verblijfplaats in België
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is ingeschreven als niet-ingezetene met een verblijfplaats in België
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               6030 | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vertrek_land_code |
        |     1 |       0 |                       1999 |              5010 |

    Scenario: is ingeschreven als niet-ingezetene met een volledig onbekende verblijfplaats
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is ingeschreven als niet-ingezetene met een volledig onbekende verblijfplaats
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               6030 | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vertrek_land_code |
        |     1 |       0 |                       1999 |              0000 |

    Scenario: de gemeente heeft vastgesteld dat de minderjarige niet op het adres verblijft
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is ingeschreven in een Nederlandse gemeente
      * de gemeente heeft vastgesteld dat de minderjarige niet op het adres verblijft
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               6030 | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | onderzoek_gegevens_aand |
        |     1 |       0 |                       0518 |                  089999 |

    Scenario: is op {datum} geïmmigreerd
      # datum heeft formaat d-m-j, met d en m heeft 1 of 2 cijfers, j heeft 4 cijfers
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      * is geboren in België
      En is op <immigratiedatum> geïmmigreerd
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               5010 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vestiging_datum   |
        |     1 |       0 |                       0518 | <vestiging datum> |

      Voorbeelden:
        | immigratiedatum | vestiging datum |
        |       15-5-2022 |        20220515 |
        |       3-11-2023 |        20231103 |

    Scenario: '{naam}' is {relatievedatum} geïmmigreerd naar Nederland
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      En 'Tosca' is <relatieve datum> geïmmigreerd naar Nederland
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               5010 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vestiging_datum   |
        |     1 |       0 |                       0518 | <relatieve datum> |

      Voorbeelden:
        | relatieve datum |
        | gisteren        |
        |  2 jaar geleden |
        | vorige maand    |

    Scenario: '{naam}' is {relatievedatum} geëmigreerd naar {landnaam}
      Gegeven de persoon 'Tosca' met burgerservicenummer '000000012'
      En 'Tosca' is 1 maand geleden geëmigreerd naar <land naam>
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Tosca          |               5010 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vestiging_datum   |
        |     1 |       0 |                       0518 | <relatieve datum> |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_verblijfplaats'
        | pl_id | volg_nr | inschrijving_gemeente_code | vestiging_datum   |
        |     1 |       0 |                       0518 | <relatieve datum> |

      Voorbeelden:
        | relatieve datum | land naam | land code |
        | 1 maand geleden | België    |      5010 |
        |  2 jaar geleden | Spanje    |      6037 |

  Regel: Huwelijk wordt toegevoegd als persoon_type 'R' voor beide betrokken personen
    # To Do: welke gegevens van een persoon worden meegenomen - want zijn relevant - in de relatie?
    # geboortedatum, geboorteland, ...?

    Scenario: '{naam1}' en '{naam2}' zijn met elkaar gehuwd
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En 'Arjan' en 'Tosca' zijn met elkaar gehuwd
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |                     |                      |                         |
        |     1 | R            |         0 |       0 |         000000024 | Tosca          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |                     |                      |                         |
        |     2 | R            |         0 |       0 |         000000012 | Arjan          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |

    Scenario: '{naam1}' en '{naam2}' zijn {relatievedatum} gehuwd
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En 'Arjan' en 'Tosca' zijn <relatieve datum> gehuwd
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |                     |                      |                         |
        |     1 | R            |         0 |       0 |         000000024 | Tosca          |                    |         | <relatieve datum>   |                  518 |                    6030 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |                     |                      |                         |
        |     2 | R            |         0 |       0 |         000000012 | Arjan          |                    |         | <relatieve datum>   |                  518 |                    6030 |

      Voorbeelden:
        | relatieve datum   |
        |    2 jaar geleden |
        | gisteren - 5 jaar |

    Scenario: '{naam1}' en '{naam2}' zijn {relatievedatum} gescheiden
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En 'Arjan' en 'Tosca' zijn met elkaar gehuwd
      En 'Arjan' en 'Tosca' zijn <relatieve datum> gescheiden
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code | relatie_eind_datum | relatie_eind_plaats | relatie_eind_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |                     |                      |                         |                    |                     |                        |
        |     1 | R            |         0 |       1 |         000000024 | Tosca          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |                    |                     |                        |
        |     1 | R            |         0 |       0 |         000000024 | Tosca          |                    |         |                     |                      |                         | <relatieve datum>  |                 518 |                   6030 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code | relatie_eind_datum | relatie_eind_plaats | relatie_eind_land_code |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |                     |                      |                         |                    |                     |                        |
        |     2 | R            |         0 |       1 |         000000012 | Arjan          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |                    |                     |                        |
        |     2 | R            |         0 |       0 |         000000012 | Arjan          |                    |         |                     |                      |                         | <relatieve datum>  |                 518 |                   6030 |

      Voorbeelden:
        | relatieve datum   |
        |    2 jaar geleden |
        | gisteren - 5 jaar |

    Scenario: volgende relatie: '{naam1}' en '{naam2}' zijn {relatievedatum} gehuwd
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En 'Arjan' en 'Tosca' zijn met elkaar gehuwd
      En 'Arjan' en 'Tosca' zijn 5 jaar geleden gescheiden
      En 'Arjan' en 'Tosca' zijn <relatieve datum> gehuwd
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code | relatie_eind_datum | relatie_eind_plaats | relatie_eind_land_code |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |                     |                      |                         |                    |                     |                        |
        |     1 | R            |         0 |       1 |         000000024 | Tosca          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |                    |                     |                        |
        |     1 | R            |         0 |       0 |         000000024 | Tosca          |                    |         |                     |                      |                         |     5 jaar geleden |                 518 |                   6030 |
        |     1 | R            |         1 |       0 |         000000024 | Tosca          |                    |         | <relatieve datum>   |                  518 |                    6030 |                    |                     |                        |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | relatie_start_datum | relatie_start_plaats | relatie_start_land_code | relatie_eind_datum | relatie_eind_plaats | relatie_eind_land_code |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |                     |                      |                         |                    |                     |                        |
        |     2 | R            |         0 |       1 |         000000012 | Arjan          |                    |         | gisteren - 20 jaar  |                  518 |                    6030 |                    |                     |                        |
        |     2 | R            |         0 |       0 |         000000012 | Arjan          |                    |         |                     |                      |                         |     5 jaar geleden |                 518 |                   6030 |
        |     2 | R            |         1 |       0 |         000000012 | Arjan          |                    |         | <relatieve datum>   |                  518 |                    6030 |                    |                     |                        |

      Voorbeelden:
        | relatieve datum   |
        |    2 jaar geleden |
        | gisteren - 3 jaar |
        | vorige maand      |

  Regel: Ouders worden toegevoegd als persoon_type respectievelijk '1' en '2' aan de persoon en de persoon als persoon_type 'K' bij de ouders
    # To Do: welke gegevens van een persoon worden meegenomen - want zijn relevant - in de relatie?
    # geboortedatum, geboorteland, ...?

    Scenario: heeft '{naam1}' en '{naam2}' als ouders
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * is minderjarig
      * heeft 'Arjan' en 'Tosca' als ouders
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |
        |     2 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           | gisteren - 17 jaar |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          |                    |                    | 1AA0100 | gisteren - 17 jaar         |
        |     3 |            2 |         0 |       0 |         000000024 | Tosca          |                    |                    | 1AA0100 | gisteren - 17 jaar         |

    Scenario: heeft '{naam}' als ouder
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * is minderjarig
      * heeft 'Arjan' als ouder
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           | gisteren - 17 jaar |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          |                    |                    | 1AA0100 | gisteren - 17 jaar         |

    Scenario: neem gegevens van de ouder over: heeft '{naam}' als ouder
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      * <eigenschap ouder>
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * is minderjarig
      * heeft 'Arjan' als ouder
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum  | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          | <geboortedatum> |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                 |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           | gisteren - 17 jaar |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          | <geboortedatum>    |                    | 1AA0100 | gisteren - 17 jaar         |

      Voorbeelden:
        | eigenschap ouder       | geboortedatum      |
        | is meerderjarig        | gisteren - 45 jaar |
        | is minderjarig         | gisteren - 17 jaar |
        | is geboren op 5-8-1998 |           19980805 |

    Scenario: heeft '{naam}' als ouder die niet met burgerservicenummer is ingeschreven in de BRP
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * is minderjarig
      * heeft 'Arjan' als ouder
      * heeft 'Tosca' als ouder die niet met burgerservicenummer is ingeschreven in de BRP
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           | gisteren - 17 jaar |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          |                    |                    | 1AA0100 | gisteren - 17 jaar         |
        |     3 |            2 |         0 |       0 |                   | Tosca          | gisteren - 45 jaar |                    | 1AA0100 | gisteren - 17 jaar         |

  Regel: Een gerechtelijke uitspraak wordt vastgelegd in de gezagsverhouding

    Scenario: <stapdefinitie>
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * heeft 'Arjan' en 'Tosca' als ouders
      En in een gerechtelijke uitspraak is <gezag uitspraak>
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |
        |     2 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          |                    | 1AA0100 | gisteren - 17 jaar         |
        |     3 |            2 |         0 |       0 |         000000024 | Tosca          |                    | 1AA0100 | gisteren - 17 jaar         |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_gezagsverhouding'
        | pl_id | volg_nr | minderjarig_gezag_ind | geldigheid_start_datum |
        |     3 |       0 | <indicatie gezag>     | gisteren - 1 jaar      |

      Voorbeelden:
        | gezag uitspraak                                                    | indicatie gezag | stapdefinitie                                                                          |
        | in een gerechtelijke uitspraak is het gezag toegewezen aan 'Arjan' |               1 | in een gerechtelijke uitspraak is het gezag toegewezen aan '{naam}'                    |
        | in een gerechtelijke uitspraak is het gezag toegewezen aan 'Tosca' |               2 | in een gerechtelijke uitspraak is het gezag toegewezen aan '{naam}'                    |
        | het gezag toegewezen aan beide ouders                              |              12 | in een gerechtelijke uitspraak is het gezag toegewezen aan beide ouders                |
        | een voogdijinstelling tot voogd benoemd                            | D               | in een gerechtelijke uitspraak is een voogdijinstelling tot voogd benoemd              |
        | een derde tot voogd benoemd                                        | D               | in een gerechtelijke uitspraak is een derde tot voogd benoemd                          |
        | het gezag toegewezen aan ouder 'Arjan' en een derde                |              1D | in een gerechtelijke uitspraak is het gezag toegewezen aan ouder '{naam}' en een derde |
        | het gezag toegewezen aan ouder 'Tosca' en een derde                |              2D | in een gerechtelijke uitspraak is het gezag toegewezen aan ouder '{naam}' en een derde |

    Scenario: {relatievedatum} is in een gerechtelijke uitspraak het gezag toegewezen aan <gezaghebbende in stapdefinitie>
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En de persoon 'Theo' met burgerservicenummer '000000036'
      * heeft 'Arjan' en 'Tosca' als ouders
      En <relatieve datum> is in een gerechtelijke uitspraak het gezag toegewezen aan <gezaghebbende>
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          |               6030 | 1AA0100 |
        |     1 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |
        |     2 | K            |         0 |       0 |         000000036 | Theo           |                    | 1AA0100 |
      En heeft de persoon 'Theo' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     3 |          0 |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr | familie_betrek_start_datum |
        |     3 | P            |         0 |       0 |         000000036 | Theo           |               6030 | 1AA0100 |                            |
        |     3 |            1 |         0 |       0 |         000000012 | Arjan          |                    | 1AA0100 | gisteren - 17 jaar         |
        |     3 |            2 |         0 |       0 |         000000024 | Tosca          |                    | 1AA0100 | gisteren - 17 jaar         |
      En heeft de persoon 'Theo' de volgende rijen in tabel 'lo3_pl_gezagsverhouding'
        | pl_id | volg_nr | minderjarig_gezag_ind | geldigheid_start_datum |
        |     3 |       0 | <indicatie gezag>     | <relatieve datum>      |

      Voorbeelden:
        | relatieve datum   | gezaghebbende              | indicatie gezag | gezaghebbende in stapdefinitie |
        |    6 jaar geleden | 'Arjan'                    |               1 | '{naam}'                       |
        | vorige maand      | 'Tosca'                    |               2 | '{naam}'                       |
        | gisteren - 5 jaar | een voogdijinstelling      | D               | een voogdijinstelling          |
        |    2 jaar geleden | beide ouders               |              12 | beide ouders                   |
        |    2 jaar geleden | ouder 'Arjan' en een derde |              1D | ouder '{naam}' en een derde    |
        |    2 jaar geleden | ouder 'Tosca' en een derde |              2D | ouder '{naam}' en een derde    |

  Regel: Je kan de context wijzigen naar een eerder opgevoerde persoon

    Scenario: persoon '{naam}'
      Gegeven de persoon 'Arjan' met burgerservicenummer '000000012'
      En de persoon 'Tosca' met burgerservicenummer '000000024'
      En persoon 'Arjan'
      * is meerderjarig
      Als de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd
      Dan heeft de persoon 'Arjan' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     1 |          0 |
      En heeft de persoon 'Arjan' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_datum     | geboorte_land_code | akte_nr |
        |     1 | P            |         0 |       0 |         000000012 | Arjan          | gisteren - 45 jaar |               6030 | 1AA0100 |
      En heeft de persoon 'Tosca' de volgende rij in tabel 'lo3_pl'
        | pl_id | geheim_ind |
        |     2 |          0 |
      En heeft de persoon 'Tosca' de volgende rijen in tabel 'lo3_pl_persoon'
        | pl_id | persoon_type | stapel_nr | volg_nr | burger_service_nr | geslachts_naam | geboorte_land_code | akte_nr |
        |     2 | P            |         0 |       0 |         000000024 | Tosca          |               6030 | 1AA0100 |
