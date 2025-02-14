const { Given, When, Then } = require('@cucumber/cucumber');
const { execute, truncate, select } = require('./postgresqlHelpers-2');
const { generateSqlStatementsFrom } = require('./sqlStatementsFactory');

Given(/de tabel '(.*)' bevat geen rijen/, async function (tabel) {
    await truncate(tabel);
});


When(/^de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd$/, async function () {
    if(this.context.data) {
        await execute(generateSqlStatementsFrom(this.context.data));
    }
});

Then(/heeft de persoon '(.*)' de volgende rij in tabel '(.*)'/, async function(aanduiding, tabel, dataTable) {    
    let columnNames = dataTable.rawTable[0];
    let columnValues = dataTable.rawTable[1];
    let actual = await select(tabel, columnNames);

    validateRows(columnNames, columnValues, actual.rows);
});


Then(/heeft de persoon '(.*)' de volgende rijen in tabel '(.*)'/, function(aanduiding, tabel, dataTable) {
    return 'Not implemented';
});

function validateRows(columnNames, columnValues, actualRows) {
    if (actualRows.length !== 1) {
        throw new Error(`Expected 1 row, but got ${actualRows.length}`);
    }

    const actualRow = actualRows[0];
    for (let i = 0; i < columnNames.length; i++) {
        const columnName = columnNames[i];
        const expectedValue = columnValues[i];
        const actualValue = actualRow[columnName];

        if (actualValue != expectedValue) { 
            throw new Error(`Mismatch for column ${columnName}: expected ${expectedValue}, but got ${actualValue}`);
        }
    }
}

function getPersoon(context, aanduiding) {
    return !aanduiding
        ? context.data.personen.at(-1)
        : context.data.personen.find(p => p.id === `persoon-${aanduiding}`);
}