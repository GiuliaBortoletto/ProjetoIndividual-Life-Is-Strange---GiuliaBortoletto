var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/kpiFinal/:idUsuario", function(req,res){
    dashboardController.buscarKpiFinal(req,res);
});

router.get("/final/:idUsuario", function (req, res) {
    dashboardController.buscarFinal(req, res);
});

router.get("/:idUsuario", function (req, res) {
    dashboardController.buscarDadosDashboard(req, res);
});



module.exports = router;