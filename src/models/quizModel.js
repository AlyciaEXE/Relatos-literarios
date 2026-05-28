var database = require("../database/config");

function salvarResultado(usuario, autor) {

    var instrucaoSql = `

        INSERT INTO resposta
        (fkUsuario, fkAutor)
        VALUES
        (${usuario}, ${autor});

    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    salvarResultado
};