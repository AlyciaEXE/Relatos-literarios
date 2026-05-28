var express = require("express");

var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/buscarResultados", function (req, res) {

    dashboardController.buscarResultados(req, res);

});

module.exports = router;