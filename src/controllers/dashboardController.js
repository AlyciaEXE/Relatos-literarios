var dashboardModel = require("../models/dashboardModel");

function buscarDados(req, res){

    dashboardModel.buscarDados()

    .then(function(resultado){

        res.json(resultado);

    })

    .catch(function(erro){

        console.log(erro);

        res.status(500).json(erro.sqlMessage);

    });

}

module.exports = {

    buscarDados

}
