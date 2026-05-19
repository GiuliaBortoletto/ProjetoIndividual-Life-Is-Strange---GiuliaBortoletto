var database = require("../database/config");

function buscarDadosDashboard(idUsuario) {
    var instrucaoSql = `
    SELECT
     SUM(CASE
        WHEN tendencia = 'Emotivo' THEN pontosTendencia ELSE 0 END
     ) as Emotivo,
      SUM(CASE
            WHEN tendencia = 'Racional' THEN pontosTendencia ELSE 0 END
     ) as Racional,
      SUM(CASE
            WHEN emocao = 'Justiça' THEN pontosEmocao ELSE 0 END
      ) as Justica,
       SUM(CASE
            WHEN emocao = 'Empatia' THEN pontosEmocao ELSE 0 END
      ) as Empatia,
       SUM(CASE
            WHEN emocao = 'Coragem' THEN pontosEmocao ELSE 0 END
      ) as Coragem,
       SUM(CASE
            WHEN emocao = 'Lealdade' THEN pontosEmocao ELSE 0 END
      ) as Lealdade 
       FROM resposta r JOIN alternativa a ON r.fkAlternativa = a.id
            WHERE r.fkUsuario = ${idUsuario}; 
    `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
    
} 
     module.exports = {
    buscarDadosDashboard
}