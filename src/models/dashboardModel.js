var database = require("../database/config");

function buscarDados(){

    var instrucaoSql = `

        SELECT

        SUM(
            CASE
                WHEN fkOpcao IN (1,3,5)
                THEN 1
                ELSE 0
            END
        ) AS votosDazai,

        SUM(
            CASE
                WHEN fkOpcao IN (2,4,6)
                THEN 1
                ELSE 0
            END
        ) AS votosChuuya,

        (
            SELECT COUNT(*)
            FROM usuario
        ) AS totalUsuarios

        FROM resposta;

    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);

}

module.exports = {

    buscarDados

}