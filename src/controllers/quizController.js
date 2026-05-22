var QuizModel = require("../models/quizModel");

function salvarResultado(req, res) {

    var fkUsuario = req.body.fkUsuario;
    var fkPergunta = req.body.fkPergunta;
    var fkOpcao = req.body.fkOpcao;

    console.log(req.body);

    QuizModel.salvarResultado(fkUsuario, fkPergunta, fkOpcao)

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