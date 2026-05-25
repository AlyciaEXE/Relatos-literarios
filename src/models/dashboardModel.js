var database = require("../database/config");

function buscarResultados() {

    var instrucaoSql = `

        SELECT

        SUM(CASE WHEN Autor_idAutor = 1 THEN 1 ELSE 0 END) AS votosChuuya,

        SUM(CASE WHEN Autor_idAutor = 2 THEN 1 ELSE 0 END) AS votosDazai,

        (SELECT COUNT(*) FROM usuario) AS totalUsuarios

        FROM resposta;

    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarResultados
};