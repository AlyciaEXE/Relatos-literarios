var quizModel = require("../models/quizModel");

function salvarResultado(req, res) {

    var usuario = req.body.fkUsuario;
    var autor = req.body.fkAutor;

    quizModel.salvarResultado(usuario, autor)

        .then(function (resultado) {

            res.json(resultado);

        })

        .catch(function (erro) {

            console.log(erro);

            res.status(500).json(erro.sqlMessage);

        });
}

module.exports = {
    salvarResultado
};