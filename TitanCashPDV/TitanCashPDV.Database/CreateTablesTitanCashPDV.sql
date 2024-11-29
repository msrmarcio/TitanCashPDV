-- Banco de Dados
CREATE DATABASE Comercio;
GO

USE Comercio;
GO

-- Tabela de Perfis
CREATE TABLE Perfis (
    PerfilID INT PRIMARY KEY IDENTITY(1,1),
    NomePerfil NVARCHAR(50) NOT NULL,
    Permissoes NVARCHAR(MAX)
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    CPF NVARCHAR(14) UNIQUE NOT NULL,
    DataAdmissao DATE NOT NULL,
    Status NVARCHAR(20) NOT NULL,
    NomeUsuario NVARCHAR(50) NOT NULL UNIQUE,
    Senha NVARCHAR(255) NOT NULL,
    DataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
    DataAlteracaoSenha DATETIME NULL
);

-- Tabela de Relacionamento entre Funcionários e Perfis
CREATE TABLE UsuariosPerfis (
    UsuarioPerfilID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL FOREIGN KEY REFERENCES Funcionarios(FuncionarioID),
    PerfilID INT NOT NULL FOREIGN KEY REFERENCES Perfis(PerfilID)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY IDENTITY(1,1),
    NomeProduto NVARCHAR(100) NOT NULL,
    Categoria NVARCHAR(50),
    Preco DECIMAL(10, 2) NOT NULL,
    EstoqueAtual INT NOT NULL DEFAULT 0
);

-- Tabela de Caixa
CREATE TABLE Caixa (
    CaixaID INT PRIMARY KEY IDENTITY(1,1),
    FuncionarioID INT NOT NULL FOREIGN KEY REFERENCES Funcionarios(FuncionarioID),
    DataAbertura DATETIME NOT NULL,
    DataFechamento DATETIME,
    SaldoInicial DECIMAL(10, 2) NOT NULL,
    SaldoFinal DECIMAL(10, 2)
);

-- Tabela de Histórico de Operações
CREATE TABLE HistoricoOperacoes (
    HistoricoID INT PRIMARY KEY IDENTITY(1,1),
    Operacao NVARCHAR(50) NOT NULL,
    DataHora DATETIME NOT NULL,
    UsuarioID INT NOT NULL FOREIGN KEY REFERENCES Funcionarios(FuncionarioID),
    Detalhes NVARCHAR(MAX)
);

-- Tabela de Comandas
CREATE TABLE Comandas (
    ComandaID INT PRIMARY KEY IDENTITY(1,1),
    FuncionarioID INT NOT NULL FOREIGN KEY REFERENCES Funcionarios(FuncionarioID),
    DataHoraAbertura DATETIME NOT NULL,
    DataHoraFechamento DATETIME,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Aberta', 'Fechada', 'Cancelada')),
    TotalConsumo DECIMAL(10, 2) DEFAULT 0.0,
    SaldoDevedor DECIMAL(10, 2) DEFAULT 0.0,
    LiberadaParaUso NVARCHAR(3) DEFAULT 'Nao',
    DataHoraPagamento DATETIME
);

-- Tabela de Itens da Comanda
CREATE TABLE ItensComanda (
    ItemComandaID INT PRIMARY KEY IDENTITY(1,1),
    ComandaID INT NOT NULL FOREIGN KEY REFERENCES Comandas(ComandaID),
    ProdutoID INT NOT NULL FOREIGN KEY REFERENCES Produtos(ProdutoID),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pendente', 'Confirmado', 'Cancelado'))
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY IDENTITY(1,1),
    ComandaID INT FOREIGN KEY REFERENCES Comandas(ComandaID),
    CaixaID INT NOT NULL FOREIGN KEY REFERENCES Caixa(CaixaID),
    DataVenda DATETIME NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL
);
