var database = require("../database/config");

function buscarResultados() {

    var instrucaoSql = `

        SELECT

        IFNULL(SUM(CASE WHEN fkAutor = 1 THEN 1 ELSE 0 END), 0) AS votosChuuya,

        IFNULL(SUM(CASE WHEN fkAutor = 2 THEN 1 ELSE 0 END), 0) AS votosDazai,

        (SELECT COUNT(*) FROM usuario) AS totalUsuarios

        FROM resposta;

    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarResultados
};