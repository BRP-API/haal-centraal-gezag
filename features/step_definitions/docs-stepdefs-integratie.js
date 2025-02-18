const { Given, When, Then } = require('@cucumber/cucumber');
const { execute, truncate, select } = require('./postgresqlHelpers-2');
const { generateSqlStatementsFrom } = require('./sqlStatementsFactory');

Given(/de tabel '(.*)' bevat geen rijen/, async function (tabelNaam) {
    await truncate(tabelNaam);
});


When(/^de sql statements gegenereerd uit de gegeven stappen zijn uitgevoerd$/, async function () {
    if(this.context.data) {
        await execute(generateSqlStatementsFrom(this.context.data));
    }
});

Then(/heeft de persoon '(.*)' de volgende rij in tabel '(.*)'/, async function(_, tabelNaam, dataTable) {    
    let actual = await select(tabelNaam, dataTable);

    validateRows(dataTable, actual);
});


Then(/heeft de persoon '(.*)' de volgende rijen in tabel '(.*)'/, async function(_, tabelNaam, dataTable) {
    let actual = await select(tabelNaam, dataTable);

    validateRows(dataTable, actual);
});

function validateRows(dataTable, actual) {
    if(!actual) {
        global.logger.info('geen actual');
    }
    
    if (actual.rows.length == 0) {
        throw new Error(`Expected more than 0 rows, but got ${actual.rows.length}`);
    }
    
    let columnNames = dataTable.rawTable[0]; //header row
    
    for(let row = 1; row < dataTable.rawTable.count; row++) {
        let actualRow = actual.rows[columnIndex-1];
        let columnValues = dataTable.rawTable[columnIndex];

        for (let i = 0; i < columnNames.length; i++) {
            const columnName = columnNames[i];
            const expectedValue = columnValues[i];
            const actualValue = actualRow[columnName];
    
            if (actualValue != expectedValue) { 
                throw new Error(`Mismatch for column ${columnName}: expected ${expectedValue}, but got ${actualValue}`);
            }
        }
    }
}
