--O gasto que cada agencia tem com os funcionarios--
SELECT Agencia.idAgencia, Endereco.estadoEndereco, Endereco.cidadeEndereco, Endereco.nroEndereco, SUM (Funcionario.salarioFuncionario) as gastosTotais 
FROM Agencia, Endereco, funcionario
WHERE Agencia.enderecoAgencia = Endereco.idEndereco 
  AND Agencia.idAgencia = Funcionario.idAgencia
GROUP BY Agencia.idAgencia, Endereco.estadoEndereco, Endereco.cidadeEndereco, Endereco.nroEndereco
ORDER BY gastosTotais;

--Quais contas Depositou mais dinheiro--
SELECT Cliente.nomeCliente, SUM(Transacao.valorTransacao) as depositoTotal 
FROM Conta 
LEFT JOIN Transacao ON Conta.idConta = Transacao.idConta
JOIN Cliente ON Conta.idCliente = Cliente.idCliente
WHERE Transacao.tipoTransacao = 'Deposito'
GROUP BY Cliente.nomeCliente
ORDER BY depositoTotal;

--Quais contas Sacou mais dinheiro--
SELECT Cliente.nomeCliente, SUM(Transacao.valorTransacao) as saqueTotal 
FROM Conta 
LEFT JOIN Transacao ON Conta.idConta = Transacao.idConta
JOIN Cliente ON Conta.idCliente = Cliente.idCliente
WHERE Transacao.tipoTransacao = 'Saque'
GROUP BY Cliente.nomeCliente
ORDER BY saqueTotal;

--Quais contas possuem cartoes de credito--
SELECT Cliente.idCliente, Cliente.nomeCliente 
FROM Cliente, Produto, Cartao
WHERE Cliente.idCliente = Produto.idCliente 
  AND Produto.tipoProduto = 'Cartao'
  AND Produto.idProduto = Cartao.idProduto 
  AND Cartao.tipoCartao = 'Credito';

--Caso a pessoa queira consultar seu extrato--
SELECT Cliente.nomeCliente, Transacao.valorTransacao, Transacao.tipoTransacao, Transferencia.tipoTransferencia 
FROM Cliente, Conta, Extrato,  Transacao 
LEFT JOIN Transferencia ON Transferencia.idTransacao = Transacao.idTransacao
WHERE Cliente.idCliente = Conta.idCliente 
  AND Conta.idConta = Transacao.idConta 
  AND Transacao.idTransacao = Extrato.idExtrato
  AND Conta.idConta = 2;

--Caso a pessoa queira consultar sua fatura--
SELECT Fatura.datainicioFatura, Fatura.datafimFatura, Fatura.valorFatura 
FROM Cliente, Produto, Cartao, Custo, Fatura
WHERE Cliente.idCliente = Produto.idCliente 
  AND Produto.idProduto = Cartao.idProduto 
  AND Cartao.tipoCartao = 'Credito'
  AND Cartao.idCartao = Custo.idCartao 
  AND Custo.idCusto = Fatura.idCusto 
  AND Cliente.idCliente = 3;

--Caso a pessoa queira ver os pagamentos das faturas anteriores--
SELECT Transacao.dataTransacao, Transacao.valorTransacao, Transacao.tipoTransacao 
FROM Cliente, Produto, Cartao, Custo, Fatura, Pagamento, Transacao
WHERE Cliente.idCliente = Produto.idCliente 
  AND Produto.idProduto = Cartao.idProduto 
  AND Cartao.tipoCartao = 'Credito'
  AND Cartao.idCartao = Custo.idCartao 
  AND Custo.idCusto = Fatura.idCusto 
  AND Custo.idCusto = Pagamento.idCusto 
  AND Pagamento.idTransacao = Transacao.idTransacao 
  AND Cliente.idCliente = 3;

--Pessoas que mais Compram com o cartão de debito--
SELECT Cliente.idCliente, Cliente.nomeCliente, SUM(Transacao.valorTransacao) as Compras 
FROM  Cliente, Conta, Transacao, Produto, Cartao, Custo, Pagamento
WHERE Cliente.idCliente = Conta.idCliente 
  AND Conta.idConta = Transacao.idConta 
  AND Transacao.idTransacao = Pagamento.idTransacao 
  AND Cliente.idCliente = Produto.idCliente
  AND Cartao.idProduto = Produto.idProduto 
  AND Cartao.tipoCartao = 'Debito' 
  AND Cartao.idCartao = Custo.idCartao
  AND Custo.idCusto = Pagamento.idCusto
GROUP BY Cliente.idCliente, Cliente.nomeCliente
ORDER BY Compras DESC;

--Agencia que tem maior quantidade de Conta--
SELECT Agencia.idAgencia, Endereco.cidadeEndereco, Endereco.estadoEndereco, COUNT (*) as NroAgencia 
FROM Agencia, Conta, Endereco
WHERE Agencia.enderecoAgencia =  Endereco.idEndereco 
  AND Conta.idAgencia = Agencia.idAgencia
GROUP BY Agencia.idAgencia, Endereco.cidadeEndereco, Endereco.estadoEndereco
ORDER BY NroAgencia DESC;

--Consultas com os funcionarios--
SELECT Funcionario.nomeFuncionario, Funcionario.tipoFuncionario, Cliente.nomeCliente, Consulta.assuntoConsulta, Consulta.dataConsulta 
FROM Funcionario, Cliente, Consulta, Conta
WHERE Funcionario.idFuncionario = Consulta.idFuncionario 
  AND Conta.idConta = Consulta.idConta 
  AND Conta.idCliente = Cliente.idCliente;

--Cartoes com mais limite de credito--
SELECT Cliente.nomeCliente, Credito.limiteCredito 
FROM Cliente, Produto, Cartao, Credito
WHERE Cliente.idCliente = Produto.idCliente 
  AND Produto.idProduto = Cartao.idProduto
  AND Cartao.idCartao = Credito.idCartao
ORDER BY Credito.limiteCredito;

--Funcionarios que são responsaveis por cada conta--
SELECT Funcionario.nomeFuncionario,Funcionario.tipoFuncionario, Cliente.nomeCliente 
FROM Funcionario, Conta, Cliente, Agencia
WHERE Funcionario.idFuncionario = Conta.funcionarioConta 
  AND Conta.idCliente = Cliente.idCliente
  AND Agencia.idAgencia = Conta.idAgencia 
  AND Agencia.idAgencia = Funcionario.idAgencia;

--Limite restante de saque--
SELECT nomeCliente, limiteSaque 
FROM Cliente, Conta, Transacao, Saque
WHERE Cliente.idCliente = Conta.idCliente 
  AND Conta.idConta = Transacao.idConta
  AND Transacao.idTransacao = Saque.idTransacao;