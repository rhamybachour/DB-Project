CREATE TABLE Endereco(
idEndereco INTEGER,
tipoEndereco VARCHAR(100),
ruaEndereco VARCHAR(100) NOT NULL,
nroEndereco NUMERIC(5,0) NOT NULL,
bairroEndereco VARCHAR(100) NOT NULL,
cepEndereco NUMERIC(8,0) NOT NULL,
cidadeEndereco VARCHAR(100) NOT NULL,
estadoEndereco CHAR(2) DEFAULT 'SP',
telefoneEndereco NUMERIC(10,0) NOT NULL,
CONSTRAINT idEnderecoPK PRIMARY KEY(idEndereco),
CONSTRAINT tipoEnderecoCK CHECK(tipoEndereco IN('Agencia','Funcionario','Cliente')),
CONSTRAINT estadoEnderecoCK CHECK(estadoEndereco IN('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA',
													'PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'))
);

CREATE TABLE Agencia(
idAgencia INTEGER,
enderecoAgencia INTEGER,
CONSTRAINT idAgenciaPK PRIMARY KEY(idAgencia),
CONSTRAINT enderecoAgenciaCK FOREIGN KEY(enderecoAgencia) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Funcionario(
idFuncionario INTEGER,
tipoFuncionario VARCHAR(100),
nomeFuncionario VARCHAR(100) NOT NULL,
salarioFuncionario NUMERIC(7,2) NOT NULL,
enderecoFuncionario INTEGER,
idAgencia INTEGER,
CONSTRAINT idFuncionarioPK PRIMARY KEY(idFuncionario),
CONSTRAINT tipoFuncionarioCK CHECK(tipoFuncionario IN('Gerente','Caixa','Segurança','Limpeza')),
CONSTRAINT enderecoFuncionarioFK FOREIGN KEY(enderecoFuncionario) REFERENCES Endereco(idEndereco),
CONSTRAINT idAgenciaFK FOREIGN KEY(idAgencia) REFERENCES Agencia(idAgencia)
);

CREATE TABLE Cliente(
idCliente INTEGER,
nomeCliente VARCHAR(100) NOT NULL,
tipoCliente VARCHAR(100) DEFAULT 'Fisica',
enderecoCliente INTEGER,
CONSTRAINT idClientePK PRIMARY KEY(idCliente),
CONSTRAINT tipoClienteCK CHECK(tipoCliente IN('Fisica', 'Juridica')),
CONSTRAINT enderecoClienteFK FOREIGN KEY(enderecoCliente) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Conta(
idConta INTEGER,
dataaberturaConta DATE NOT NULL,
saldoConta NUMERIC(12,2) NOT NULL,
funcionarioConta INTEGER,
idAgencia INTEGER,
idCliente INTEGER,
CONSTRAINT idContaPK PRIMARY KEY(idConta),
CONSTRAINT funcionarioContaFK FOREIGN KEY(funcionarioConta) REFERENCES Funcionario(idFuncionario),
CONSTRAINT idAgenciaFK FOREIGN KEY(idAgencia) REFERENCES Agencia(idAgencia),
CONSTRAINT idClienteFK FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Consulta(
idConsulta INTEGER,
dataConsulta DATE NOT NULL,
assuntoConsulta VARCHAR(100) NOT NULL,
idConta INTEGER,
idFuncionario INTEGER,
CONSTRAINT idConsultaPK PRIMARY KEY(idConsulta),
CONSTRAINT idContaFK FOREIGN KEY(idConta) REFERENCES Conta(idConta),
CONSTRAINT idFuncionarioFK FOREIGN KEY(idFuncionario) REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Transacao(
idTransacao SERIAL,
tipoTransacao VARCHAR(100) NOT NULL,
dataTransacao DATE NOT NULL,
valorTransacao NUMERIC(10,2) NOT NULL,
contaTransacao INTEGER,
idConta INTEGER,
CONSTRAINT idTransacaoPK PRIMARY KEY(idTransacao),
CONSTRAINT tipoTransacaoCK CHECK(tipoTransacao IN('Saque','Deposito','Transferencia','Pagamento')),
CONSTRAINT idContaFK FOREIGN KEY(idConta) REFERENCES Conta(idConta)
);

CREATE TABLE Saque(
idSaque SERIAL,
idTransacao INTEGER,
limiteSaque NUMERIC(10,2),
CONSTRAINT idSaquePK PRIMARY KEY(idSaque),
CONSTRAINT idTrasacaoFK FOREIGN KEY(idTransacao) REFERENCES Transacao(idTransacao)
);

CREATE TABLE Deposito(
idDeposito SERIAL,
idTransacao INTEGER,
limiteDeposito NUMERIC(10,2),
CONSTRAINT idDepositoPK PRIMARY KEY(idDeposito),
CONSTRAINT idTrasacaoFK FOREIGN KEY(idTransacao) REFERENCES Transacao(idTransacao)
);

CREATE TABLE Transferencia(
idTransferencia SERIAL,
idTransacao INTEGER,
tipoTransferencia VARCHAR(100),
contaTransferencia INTEGER,
CONSTRAINT idTransferenciaPK PRIMARY KEY(idTransferencia),
CONSTRAINT tipoTransferenciaCK CHECK(tipoTransferencia IN('Saida', 'Entrada')),
CONSTRAINT idTrasacaoFK FOREIGN KEY(idTransacao) REFERENCES Transacao(idTransacao)
);

CREATE TABLE Produto(
idProduto INTEGER,
tipoProduto VARCHAR(100),
idCliente INTEGER,
CONSTRAINT idProdutoPK PRIMARY KEY(idProduto),
CONSTRAINT ProdutoCLienteUN UNIQUE(tipoProduto,idCliente),
CONSTRAINT tipoProdutoCK CHECK(tipoProduto IN('Emprestimo','Cheque','Cartao')),
CONSTRAINT idClienteFK FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Bandeira(
idBandeira INTEGER,
nomeBandeira VARCHAR(100) NOT NULL,
jurosBandeira NUMERIC(5,2) NOT NULL,
CONSTRAINT idBandeiraPK PRIMARY KEY(idBandeira)
);

CREATE TABLE Cartao(
idCartao INTEGER,
tipoCartao VARCHAR(100),
codsegurancaCartao NUMERIC(3,0) NOT NULL,
dataimpressaoCartao DATE NOT NULL,
datavalidadeCartao DATE NOT NULL,
idProduto INTEGER,
idBandeira INTEGER,
CONSTRAINT idCartaoPK PRIMARY KEY(idCartao),
CONSTRAINT tipoCartaoCK CHECK(tipoCartao IN('Credito', 'Debito')),
CONSTRAINT idProdutoFK FOREIGN KEY(idProduto) REFERENCES Produto(idProduto),
CONSTRAINT idBandeiraPK FOREIGN KEY(idBandeira) REFERENCES Bandeira(idBandeira)
);

CREATE TABLE Custo(
idCusto INTEGER,
tipoCusto VARCHAR(100),
dataCusto DATE NOT NULL,
valorCusto NUMERIC(10,2) NOT NULL,
idCartao INTEGER,
CONSTRAINT idCustoPK PRIMARY KEY(idCusto),
CONSTRAINT tipoCustoCK CHECK(tipoCusto IN('Fatura','Compra')),
CONSTRAINT idCartaoFK FOREIGN KEY(idCartao) REFERENCES Cartao(idCartao)
);

CREATE TABLE Pagamento(
idPagamento SERIAL,
tipoPagamento VARCHAR(100),
idCusto INTEGER,
idTransacao INTEGER,
CONSTRAINT idPagamentoPK PRIMARY KEY(idPagamento),
CONSTRAINT idCustoFK FOREIGN KEY(idCusto) REFERENCES Custo(idCusto),
CONSTRAINT idTrasacaoFK FOREIGN KEY(idTransacao) REFERENCES Transacao(idTransacao)
);

CREATE TABLE Extrato(
idExtrato SERIAL,
idTransacao INTEGER,
CONSTRAINT idExtratoPK PRIMARY KEY(idExtrato),
CONSTRAINT idTrasacaoFK FOREIGN KEY(idTransacao) REFERENCES Transacao(idTransacao)
);

CREATE TABLE Fisica(
idFisica SERIAL,
limiteFisica NUMERIC(10,2) NOT NULL,
idCliente INTEGER,
CONSTRAINT idFisicaPK PRIMARY KEY(idFisica),
CONSTRAINT idClienteFK FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE Juridica(
idJuridica SERIAL,
limiteJuridica NUMERIC(10,2) NOT NULL,
idCliente INTEGER,
CONSTRAINT idJuridicaPK PRIMARY KEY(idJuridica),
CONSTRAINT idClienteFK FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE Emprestimo(
idEmprestimo INTEGER,
valorEmprestimo NUMERIC(10,2) NOT NULL,
taxaEmprestimo NUMERIC(5,2) NOT NULL,
dataEmprestimo DATE NOT NULL,
idProduto INTEGER,
CONSTRAINT idEmprestimoPK PRIMARY KEY(idEmprestimo),
CONSTRAINT idProdutoFK FOREIGN KEY(idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);

CREATE TABLE Cheque(
idCheque INTEGER,
dataimpressaoCheque DATE NOT NULL,
datavalidadeCheque DATE NOT NULL,
idProduto INTEGER,
CONSTRAINT idChequePK PRIMARY KEY(idCheque),
CONSTRAINT idProduto FOREIGN KEY(idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);

CREATE TABLE Credito(
idCredito SERIAL,
limiteCredito NUMERIC(10,2) NOT NULL,
senhaCredito NUMERIC(4,0) NOT NULL,
idCartao INTEGER,
CONSTRAINT idCreditoPK PRIMARY KEY(idCredito),
CONSTRAINT idCartaoFK FOREIGN KEY(idCartao) REFERENCES Cartao(idCartao) ON DELETE CASCADE
);

CREATE TABLE Debito(
idDebito SERIAL,
senhaDebito NUMERIC(6,0) NOT NULL,
idCartao INTEGER,
CONSTRAINT idDebitoPK PRIMARY KEY(idDebito),
CONSTRAINT idCartaoFK FOREIGN KEY(idCartao) REFERENCES Cartao(idCartao) ON DELETE CASCADE
);

CREATE TABLE NotaFiscal(
idNotaFiscal INTEGER,
idCusto INTEGER,
CONSTRAINT idNotaFiscalPK PRIMARY KEY(idNotaFiscal),
CONSTRAINT idCustoFK FOREIGN KEY(idCusto) REFERENCES Custo(idCusto)
);

CREATE TABLE Compra(
idCompra SERIAL,
idCusto INTEGER,
CONSTRAINT idCompraPK PRIMARY KEY(idCompra),
CONSTRAINT idCustoFK FOREIGN KEY(idCusto) REFERENCES Custo(idCusto)
);

CREATE TABLE Fatura(
idFatura SERIAL,
datainicioFatura DATE NOT NULL,
datafimFatura DATE NOT NULL,
valorFatura NUMERIC(10,2) NOT NULL,
idCusto INTEGER,
CONSTRAINT idFaturaPK PRIMARY KEY(idFatura),
CONSTRAINT idCustoFK FOREIGN KEY(idCusto) REFERENCES Custo(idCusto)
);

/*
DROP TABLE Fatura;
DROP TABLE Compra;
DROP TABLE NotaFiscal;
DROP TABLE Debito;
DROP TABLE Credito;
DROP TABLE Cheque;
DROP TABLE Emprestimo;
DROP TABLE Juridica;
DROP TABLE Fisica;
DROP TABLE Extrato;
DROP TABLE Pagamento;
DROP TABLE Custo;
DROP TABLE Cartao;
DROP TABLE Bandeira;
DROP TABLE Produto;
DROP TABLE Transferencia;
DROP TABLE Deposito;
DROP TABLE Saque;
DROP TABLE Transacao;
DROP TABLE Consulta;
DROP TABLE Conta;
DROP TABLE Cliente;
DROP TABLE Funcionario;
DROP TABLE Agencia;
DROP TABLE Endereco;
*/