#!/bin/bash

PARAMS="{ \
    \"apiUrl\": \"http://localhost:8080/api/v1/opvragenBevoegdheidTotGezag\" \
}"

npx cucumber-js -f json:./test-reports/cucumber-js/step-definitions/test-result-zonder-dependency-integratie.json \
                -f summary:./test-reports/cucumber-js/step-definitions/test-result-zonder-dependency-integratie-summary.txt \
                -f summary \
                features/docs \
                --tags "not @integratie" \
                --tags "not @skip-verify"

npx cucumber-js -f json:./test-reports/cucumber-js/step-definitions/test-result-met-dependency-integratie.json \
                -f summary:./test-reports/cucumber-js/step-definitions/test-result-met-dependency-integratie-summary.txt \
                -f summary \
                features/docs \
                --tags "@integratie" \
                --tags "not @skip-verify"
