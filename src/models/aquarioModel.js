var database = require("../database/config");

/*
function buscarAquariosPorEmpresa(empresaId) {

  var instrucaoSql = `SELECT * FROM aquario a WHERE fk_empresa = ${empresaId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
} 
*/

function cadastrar(email, senha) {
  
  var instrucaoSql = `INSERT INTO (email, senha) usuario VALUES (${email}, ${senha})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  
}
