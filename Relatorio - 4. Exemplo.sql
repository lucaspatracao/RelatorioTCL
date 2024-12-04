-- Exemplo Prático

-- Iniciando uma nova transação para controlar todas as operações subsequentes
START TRANSACTION;

-- Inserindo um novo funcionário na tabela 'funcionario'
-- Adicionamos um funcionário com id 1 e nome 'Maria Silva'
INSERT INTO funcionario (id_funcionario, nome) VALUES (1, 'Maria Silva');

-- Criando um ponto de salvamento chamado 'funcionario_inserted'
-- Esse ponto nos permitirá desfazer alterações feitas após ele, se necessário
SAVEPOINT funcionario_inserted;

-- Tentando inserir informações de salário para o funcionário recém-adicionado
-- O salário terá id 1, estará associado ao funcionário 1, e terá um valor de 5000
INSERT INTO salario (id_salario, id_funcionario, valor) VALUES (1, 1, 5000);

-- Simulação de erro: caso o valor do salário seja inválido (por exemplo, negativo)
-- (Para teste, altere o valor ou insira um dado inválido para forçar a falha)

-- Se todas as operações acima forem bem-sucedidas, confirmamos as alterações permanentemente
COMMIT;

-- Caso ocorra algum erro na etapa de salário, podemos desfazer apenas esta parte
-- Voltamos ao ponto de salvamento 'funcionario_inserted', mantendo o registro do funcionário
ROLLBACK TO SAVEPOINT funcionario_inserted;

-- Caso seja necessário desfazer toda a transação, usamos o comando abaixo
ROLLBACK;

-- Tabelas

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE salario (
    id_salario INT PRIMARY KEY,
    id_funcionario INT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);