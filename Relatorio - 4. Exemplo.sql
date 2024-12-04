-- Iniciando uma transação para garantir que todas as operações sejam tratadas como uma unidade
START TRANSACTION;

-- Inserindo dados na tabela 'cliente'. Aqui, estamos cadastrando um novo cliente com id 1 e nome 'João Silva'.
INSERT INTO cliente (id_cliente, nome) VALUES (1, 'João Silva');

-- Criando um ponto de salvamento chamado 'cliente_inserted'. 
-- Este ponto permite que possamos desfazer as operações até aqui, caso algo dê errado posteriormente.
SAVEPOINT cliente_inserted;

-- Inserindo dados na tabela 'pedido'. Aqui, estamos criando um pedido com id 101, associado ao cliente de id 1.
-- A data do pedido é gerada automaticamente com a função NOW().
INSERT INTO pedido (id_pedido, id_cliente, data_pedido) VALUES (101, 1, NOW());

-- Confirmando todas as alterações realizadas na transação. 
-- Isso torna as mudanças permanentes no banco de dados.
COMMIT;

-- Caso ocorra algum erro após o ponto de salvamento, podemos desfazer as operações realizadas após o SAVEPOINT.
-- Este comando reverte as alterações feitas após 'cliente_inserted', mas mantém o que foi feito antes dele.
ROLLBACK TO SAVEPOINT cliente_inserted;

-- Caso queiramos desfazer todas as alterações feitas desde o início da transação, usamos o comando abaixo.
-- Ele anula tudo que foi executado desde o START TRANSACTION.
ROLLBACK;
