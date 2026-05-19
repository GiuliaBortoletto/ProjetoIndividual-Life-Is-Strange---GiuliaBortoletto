
var dashboardModel = require("../models/dashboardModel");

function buscarDadosDashboard(req,res) {
    var idUsuario = req.params.idUsuario;

    dashboardModel.buscarDadosDashboard(idUsuario)
        .then (function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "Houve um erro ao buscar os dados da dashboard: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}


function buscarFinal(req,res) {
    var idUsuario = req.params.idUsuario;

    dashboardModel.buscarFinal(idUsuario)
        .then (function (resultado) {
              res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "Houve um erro ao buscar os dados da dashboard: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
     }

module.exports = {
    buscarDadosDashboard,
    buscarFinal
}