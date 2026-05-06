var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM usuario WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT id, nome, email, senha FROM usuario`;

  return database.executar(instrucaoSql);
}
/*
function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}
  */

function cadastrar(nome, email, senha) {
  var instrucaoSql = `INSERT INTO usuario (nome,email, senha) VALUES ('${nome}', '${email}', '${senha}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorId, cadastrar, listar };
