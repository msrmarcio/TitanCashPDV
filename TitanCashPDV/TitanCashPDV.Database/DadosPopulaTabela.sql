INSERT INTO Perfis (NomePerfil, Permissoes)
VALUES 
('Administrador', 'Gerenciar Usuários, Gerenciar Caixas, Relatórios'),
('Operador de Caixa', 'Abrir e Fechar Caixa, Processar Vendas'),
('Estoquista', 'Gerenciar Estoque, Adicionar Produtos'),
('Gerente', 'Acessar Relatórios, Gerenciar Funcionários'),
('Supervisor', 'Supervisão de Operações, Fechamento de Caixa'),
('Atendente', 'Gerenciar Comandas, Processar Pedidos');

INSERT INTO Funcionarios (Nome, CPF, DataAdmissao, Status, NomeUsuario, Senha)
VALUES 
('João Silva', '123.456.789-01', '2023-01-01', 'Ativo', 'joao.silva', 'senha123'),
('Maria Oliveira', '234.567.890-12', '2023-03-15', 'Ativo', 'maria.oliveira', 'senha123'),
('Carlos Andrade', '345.678.901-23', '2023-05-10', 'Ativo', 'carlos.andrade', 'senha123'),
('Ana Lima', '456.789.012-34', '2023-06-01', 'Ativo', 'ana.lima', 'senha123'),
('Pedro Santos', '567.890.123-45', '2023-07-20', 'Ativo', 'pedro.santos', 'senha123'),
('Fernanda Costa', '678.901.234-56', '2023-08-30', 'Ativo', 'fernanda.costa', 'senha123');

INSERT INTO UsuariosPerfis (UsuarioID, PerfilID)
VALUES 
(1, 1), -- João é Administrador
(2, 2), -- Maria é Operadora de Caixa
(3, 3), -- Carlos é Estoquista
(4, 4), -- Ana é Gerente
(5, 5), -- Pedro é Supervisor
(6, 6); -- Fernanda é Atendente

INSERT INTO Produtos (NomeProduto, Categoria, Preco, EstoqueAtual)
VALUES 
('Pão Francês', 'Padaria', 0.50, 500),
('Leite Integral', 'Mercearia', 4.50, 300),
('Cimento CP II', 'Materiais de Construção', 25.00, 200),
('Tijolo 6 Furos', 'Materiais de Construção', 1.00, 1000),
('Refrigerante 2L', 'Bebidas', 8.00, 100),
('Sabão em Pó', 'Limpeza', 10.00, 50);

INSERT INTO Caixa (FuncionarioID, DataAbertura, SaldoInicial)
VALUES 
(2, GETDATE() - 10, 100.00), 
(2, GETDATE() - 8, 200.00), 
(2, GETDATE() - 6, 150.00), 
(5, GETDATE() - 4, 300.00), 
(5, GETDATE() - 2, 250.00), 
(4, GETDATE(), 400.00);

INSERT INTO HistoricoOperacoes (Operacao, DataHora, UsuarioID, Detalhes)
VALUES 
('Abertura de Caixa', GETDATE() - 10, 2, 'Caixa aberto com R$100,00.'),
('Fechamento de Caixa', GETDATE() - 9, 2, 'Saldo final de R$200,00.'),
('Venda Registrada', GETDATE() - 8, 2, 'Venda de R$50,00.'),
('Ajuste de Estoque', GETDATE() - 7, 3, 'Ajuste para produto Cimento.'),
('Fechamento de Caixa', GETDATE() - 6, 5, 'Saldo final de R$300,00.'),
('Relatório Gerado', GETDATE(), 4, 'Relatório diário gerado.');

INSERT INTO Comandas (FuncionarioID, DataHoraAbertura, Status, TotalConsumo, SaldoDevedor, LiberadaParaUso)
VALUES 
(6, GETDATE() - 5, 'Aberta', 0.00, 0.00, 'Sim'),
(6, GETDATE() - 4, 'Fechada', 50.00, 0.00, 'Nao'),
(6, GETDATE() - 3, 'Cancelada', 0.00, 0.00, 'Nao'),
(6, GETDATE() - 2, 'Aberta', 0.00, 0.00, 'Sim'),
(6, GETDATE() - 1, 'Aberta', 0.00, 0.00, 'Sim'),
(6, GETDATE(), 'Aberta', 0.00, 0.00, 'Sim');

INSERT INTO ItensComanda (ComandaID, ProdutoID, Quantidade, PrecoUnitario, Total, Status)
VALUES 
(1, 1, 10, 0.50, 5.00, 'Pendente'),
(2, 2, 2, 4.50, 9.00, 'Confirmado'),
(3, 3, 5, 25.00, 125.00, 'Cancelado'),
(4, 4, 50, 1.00, 50.00, 'Pendente'),
(5, 5, 3, 8.00, 24.00, 'Pendente'),
(6, 6, 1, 10.00, 10.00, 'Pendente');

INSERT INTO Vendas (ComandaID, CaixaID, DataVenda, ValorTotal)
VALUES 
(2, 1, GETDATE() - 4, 50.00),
(4, 2, GETDATE() - 2, 50.00),
(5, 3, GETDATE() - 1, 24.00),
(6, 4, GETDATE(), 10.00);

