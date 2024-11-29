-- Inserir Perfis
INSERT INTO Perfis (NomePerfil, Permissoes)
VALUES 
('Administrador', 'Todos os acessos'),
('Caixa', 'Abertura e fechamento de caixa, vendas'),
('Estoquista', 'Cadastro de produtos, controle de estoque');

-- Inserir Funcionários
INSERT INTO Funcionarios (Nome, CPF, DataAdmissao, Status, NomeUsuario, Senha, DataCadastro)
VALUES 
('João Silva', '123.456.789-00', '2023-01-15', 'Ativo', 'joao.silva', HASHBYTES('SHA2_256', 'senha123'), GETDATE()),
('Maria Oliveira', '987.654.321-00', '2022-05-10', 'Ativo', 'maria.oliveira', HASHBYTES('SHA2_256', 'senha123'), GETDATE()),
('Pedro Santos', '321.654.987-00', '2021-08-20', 'Inativo', 'pedro.santos', HASHBYTES('SHA2_256', 'senha123'), GETDATE());

-- Relacionar Funcionários com Perfis
INSERT INTO UsuariosPerfis (UsuarioID, PerfilID)
VALUES 
(1, 1), -- João Silva é Administrador
(2, 2), -- Maria Oliveira é Caixa
(3, 3); -- Pedro Santos é Estoquista

-- Inserir Produtos
INSERT INTO Produtos (NomeProduto, Categoria, Preco, EstoqueAtual)
VALUES 
('Pão Francês', 'Padaria', 5.50, 100),
('Leite Integral', 'Mercearia', 4.99, 50),
('Martelo', 'Ferramentas', 25.00, 20);

-- Inserir Caixa
INSERT INTO Caixa (FuncionarioID, DataAbertura, SaldoInicial)
VALUES 
(1, GETDATE(), 1000.00);

-- Inserir Comandas
INSERT INTO Comandas (FuncionarioID, DataHoraAbertura, Status)
VALUES 
(2, GETDATE(), 'Aberta');

-- Inserir Itens na Comanda
INSERT INTO ItensComanda (ComandaID, ProdutoID, Quantidade, PrecoUnitario, Total, Status)
VALUES 
(1, 1, 10, 5.50, 55.00, 'Confirmado'),
(1, 2, 5, 4.99, 24.95, 'Confirmado');

-- Inserir Histórico de Operações
INSERT INTO HistoricoOperacoes (Operacao, DataHora, UsuarioID, Detalhes)
VALUES 
('Abertura de Caixa', GETDATE(), 1, 'Caixa aberto com saldo inicial de 1000.00'),
('Abertura de Comanda', GETDATE(), 2, 'Comanda #1 aberta pelo funcionário Maria Oliveira.');
