var database = require("../database/config");

function salvarResultado(fkUsuario, fkPergunta, fkOpcao) {

    var instrucaoSql = `
        INSERT INTO Resposta
        (fkUsuario, fkPergunta, fkOpcao)
        VALUES
        (${fkUsuario}, ${fkPergunta}, ${fkOpcao});
    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    salvarResultado
}