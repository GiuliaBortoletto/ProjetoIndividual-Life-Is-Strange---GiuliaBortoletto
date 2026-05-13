var quizModel = require("../models/quizModel")


function responder(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var fkPergunta = req.body.fkPergunta;
    var respostas = req.body.respostas;
    var fkUsuario = req.body.fkUsuario;
   
    quizModel.responder(fkUsuario, respostas)
        .then(function(resultado) {

            res.status(200).json(resultado);

        }).catch(function(erro) {

            console.log(erro);
            console.log("\nHouve um erro ao armazenar as respostas do quiz! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);

        });

}

module.exports = {
    responder
}