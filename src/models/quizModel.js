var database = require("../database/config");

function responder(fkUsuario, respostas) {

    let promises = [];

    for (let i = 0; i < respostas.length; i++) {

        let instrucaoSql = `
            INSERT INTO resposta
            (fkUsuario, fkPergunta, fkAlternativa)
            VALUES
            (${fkUsuario},
             ${respostas[i].fkPergunta},
             ${respostas[i].fkAlternativa});
        `;

       console.log("Executando a instrução SQL: \n" + instrucaoSql);

        promises.push(database.executar(instrucaoSql));
    }

    return Promise.all(promises);
}

module.exports = {
    responder
}