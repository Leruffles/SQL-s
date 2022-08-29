CREATE DATA nome_database

Create table Cliente
(
	Codigo int IDENTITY(1,1) NOT NULL, --PRIMARYKEY
	Nome VARCHAR(50) not NULL,
	CPF CHAR(11) NULL,
	Telefone_Resiidencial CHAR(10) NULL,
	Celular char(11) null,
	Email varchar(50) NULL,
	Logradouro varchar(50) NULL,
	Confirmacao_Pagamento BIT,
	CEP CHAR(8) NULL,
	Cidade VARCHAR(20) NULL,
	Estado CHAR(2) NULL,
	CONSTRAINT PK_ClienteCodigo PRIMARY KEY (Codigo),
	
)

-- COMMIT
-- ROLLBACK

-- 	EM TABELA 1:1 NÃO USAR IDENTITY SE NÃO HAVERÁ DUPLICIDADE;



Create table Fidelidade
(
	Codigo_Cliente int not null, --PRIMARYKEY
	Data_Adesao DATETIME null,
	Pontos int null,
	CONSTRAINT PK_Codigo_Cliente_Fidelidade PRIMARY KEY(Codigo_Cliente),
	CONSTRAINT FK_Cliente_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo) --Sempre conecte as chaves quando houver foreign
)

-- COMMIT
-- ROLLBACK




Create table Forma_Pagamento
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	Nome VARCHAR(25) null,
	Tipo VARCHAR(25) null,
	[Data] DATETIME 
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY(Codigo),
	
)

-- COMMIT
-- ROLLBACK



Create table Marca
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	Nome VARCHAR(25) null,
	Empresa VARCHAR(25) null,
	CONSTRAINT PK_CodigoMarca PRIMARY KEY(Codigo),
	
)

-- COMMIT
-- ROLLBACK




Create table Produto
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	Nome VARCHAR(25) null,
	Descricao VARCHAR(MAX) null,
	Codigo_Marca INT not null,
	CONSTRAINT PK_CodigoProduto PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoMarca FOREIGN KEY(Codigo_Marca) REFERENCES Marca(codigo)
	
)

-- COMMIT
-- ROLLBACK


Create table Pedido_Venda
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	Valor DECIMAL(6,2) Null,
	Valor_Imposto DECIMAL(6,2) null,
	[Data] DATETIME not null,
	Codigo_Forma_Pagamento INT not null,
	Codigo_Cliente int not null,
	CONSTRAINT PK_CodigoVenda PRIMARY KEY(Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento(Codigo),
	CONSTRAINT FK_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
	
)

-- COMMIT
-- ROLLBACK


Create table Item_Pedido_Venda
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	Valor_Unitaio DECIMAL(6,2) Null,
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY(Codigo),
	CONSTRAINT FK_CodigoProdutoVenda FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda(Codigo)
	
)

--COMMIT
-- ROLLBACK



Create table Distribuidor
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	CNPJ VARCHAR(14) Not Null,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP VARCHAR(8),
	Logradouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY(Codigo),
	
)

-- COMMIT
-- ROLLBACK




Create table Pedido_Compra
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	[Data] datetime Not Null,
	Valor decimal(6,2) NOT NULL,
	Entregue bit,
	Logradouro VARCHAR(40),
	Codigo_Distribuidor int not null,
	CONSTRAINT PK_CodigoCompra PRIMARY KEY(Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor(Codigo)
	
)

-- COMMIT
-- ROLLBACK



Create table Item_Pedido_Compra
(
	Codigo int IDENTITY(1,1) not null, --PRIMARYKEY
	ValorTotal DECIMAL(6,2),
	ValorUnitario decimal(6,2) NOT NULL,
	Quantidade INT,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Compra int not null,
	CONSTRAINT PK_CodigoItemPedidoCompra PRIMARY KEY(Codigo),
	CONSTRAINT FK_CodigoProdutoCompra FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoPedidoCompraItem FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra(Codigo)
	
)

 --COMMIT
-- ROLLBACK

BEGIN TRANSACTION



 



