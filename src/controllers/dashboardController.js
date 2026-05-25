var dashboardModel = require("../models/dashboardModel");

function buscarResultados(req, res) {

    dashboardModel.buscarResultados()

        .then(function(resultado){

            res.json(resultado);

        })

        .catch(function(erro){

            console.log(erro);

            res.status(500).json(erro.sqlMessage);

        });
}

module.exports = {
    buscarResultados
};
