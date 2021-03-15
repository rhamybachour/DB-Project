--Endereços--
INSERT INTO Endereco VALUES (1, 'Agencia', 'Avenida Champs Elysées', 11111, 'Paris', 11111111, 'São Paulo', 'SP', 1111111111 );
INSERT INTO Endereco VALUES (2, 'Agencia', '5th Avenue', 11112, 'Nova York', 11111112, 'Rio Branco', 'AC', 1111111112 );
INSERT INTO Endereco VALUES (3, 'Agencia', 'Rua Via Ápia', 11113, 'Roma', 11111113, 'Uberaba', 'MG', 1111111113 );
INSERT INTO Endereco VALUES (4, 'Agencia', 'Magnificent Mile', 11114, 'Chicago', 11111114, 'Recife', 'PR', 1111111114 );
INSERT INTO Endereco VALUES (5, 'Agencia', 'Gran Via', 11115, 'Madri', 11111115, 'Florianopolis', 'SC', 1111111115 );
INSERT INTO Endereco VALUES (6, 'Funcionario', 'Wall Street', 21111, 'Nova York', 21111111, 'Goiania', 'GO', 2111111111 );
INSERT INTO Endereco VALUES (7, 'Funcionario', 'Ocean Drive', 21112, 'Mimami', 21111112, 'Fortaleza', 'CE', 2111111112 );
INSERT INTO Endereco VALUES (8, 'Funcionario', 'Avenida Nueve de Julio', 21113, 'Buenos Aires', 21111113, 'Manaus', 'AM', 2111111113 );
INSERT INTO Endereco VALUES (9, 'Funcionario', 'Abbey Road', 21114, 'Londres', 21111114, 'Rio de Janeiro', 'RJ', 2111111114 );
INSERT INTO Endereco VALUES (10, 'Funcionario', 'Las Vegas Strip', 21115, 'Las Vegas', 21111115, 'Campo Grande', 'MS', 2111111115 );
INSERT INTO Endereco VALUES (11, 'Cliente', 'Las Vegas Boulevard South ', 31111, 'Nevada', 31111111, 'Teresina', 'PI', 3111111111 );
INSERT INTO Endereco VALUES (12, 'Cliente', 'HollyWood Boulevard ', 31112, 'Los Angeles', 31111112, 'São Carlos', 'SP', 3111111112 );
INSERT INTO Endereco VALUES (13, 'Cliente', 'Lombard Street ', 31113, 'São Francisco', 31111113, 'Brasilia', 'DF', 3111111113 );
INSERT INTO Endereco VALUES (14, 'Cliente', 'Las Vegas Boulevard South ', 31114, 'Nevada', 31111114, 'Sergipe', 'PE', 3111111114 );
INSERT INTO Endereco VALUES (15, 'Cliente', 'Bournon Street ', 31115, 'Nova Orleans', 31111115, 'Natal', 'RN', 3111111115 );

--Agencia--
INSERT INTO Agencia VALUES (1, 1);
INSERT INTO Agencia VALUES (2, 2);
INSERT INTO Agencia VALUES (3, 3);
INSERT INTO Agencia VALUES (4, 4);
INSERT INTO Agencia VALUES (5, 5);

--Funcionario--
INSERT INTO Funcionario VALUES (1, 'Gerente', 'João', 7000, 6, 1);
INSERT INTO Funcionario VALUES (2, 'Gerente', 'Savio', 7000, 7, 2);
INSERT INTO Funcionario VALUES (3, 'Gerente', 'Paulo', 8000, 9, 3);
INSERT INTO Funcionario VALUES (4, 'Gerente', 'Matheus', 6500, 10, 4);
INSERT INTO Funcionario VALUES (5, 'Gerente', 'Rogerio', 7000, 6, 5);
INSERT INTO Funcionario VALUES (6, 'Caixa', 'José', 4000, 7, 1);
INSERT INTO Funcionario VALUES (7, 'Caixa', 'Tais', 4000, 8, 2);
INSERT INTO Funcionario VALUES (8, 'Caixa', 'Olavio', 4000, 6, 3);
INSERT INTO Funcionario VALUES (9, 'Caixa', 'Camila', 4000, 10, 4);
INSERT INTO Funcionario VALUES (10, 'Caixa', 'Rosevelt', 4000, 7, 5);
INSERT INTO Funcionario VALUES (11, 'Segurança', 'Cristovão', 4000, 8, 1);
INSERT INTO Funcionario VALUES (12, 'Segurança', 'Denilson', 4000, 10, 2);
INSERT INTO Funcionario VALUES (13, 'Segurança', 'Laura', 5000, 7, 3);
INSERT INTO Funcionario VALUES (14, 'Segurança', 'Geovana', 4500, 6, 4);
INSERT INTO Funcionario VALUES (15, 'Segurança', 'Luiz', 6000, 9, 5);
INSERT INTO Funcionario VALUES (16, 'Limpeza', 'Joana', 2500, 9, 1);
INSERT INTO Funcionario VALUES (17, 'Limpeza', 'Claudio', 3000, 10, 2);
INSERT INTO Funcionario VALUES (18, 'Limpeza', 'Paula', 2500, 9, 3);
INSERT INTO Funcionario VALUES (19, 'Limpeza', 'Claudia', 2500, 8, 4);
INSERT INTO Funcionario VALUES (20, 'Limpeza', 'Silvio', 2500, 7, 5);
INSERT INTO Funcionario VALUES (21, 'Caixa', 'Ricardo', 4000, 6, 1);
INSERT INTO Funcionario VALUES (22, 'Caixa', 'Ana', 5400, 6, 2);
INSERT INTO Funcionario VALUES (23, 'Caixa', 'Pedro', 4000, 7, 3);
INSERT INTO Funcionario VALUES (24, 'Caixa', 'Tainá', 4000, 9, 4);
INSERT INTO Funcionario VALUES (25, 'Caixa', 'Felipe', 4000, 10, 5);

--Cliente--
INSERT INTO Cliente VALUES (1, 'Pedro', 'Fisica', 11);
INSERT INTO Cliente VALUES (2, 'Kairo', 'Fisica', 15);
INSERT INTO Cliente VALUES (3, 'Rhamy', 'Fisica', 13);
INSERT INTO Cliente VALUES (4, 'Savio', DEFAULT, 7);
INSERT INTO Cliente VALUES (5, 'Camila', 'Fisica', 10);
INSERT INTO Cliente VALUES (6, 'Confeitaria Ltda.', 'Juridica', 14);
INSERT INTO Cliente VALUES (7, 'Automoveis S.A.', 'Juridica', 15);
INSERT INTO Cliente VALUES (8, 'Carlos', 'Fisica', 12);
INSERT INTO Cliente VALUES (9, 'Roberto', 'Fisica', 11);
INSERT INTO Cliente VALUES (10, 'Felipe', DEFAULT, 10);

UPDATE Fisica SET limiteFisica = 800.00 WHERE Fisica.idCliente = 1;
UPDATE Fisica SET limiteFisica = 1200.00 WHERE Fisica.idCliente = 2;
UPDATE Fisica SET limiteFisica = 700.00 WHERE Fisica.idCliente = 4;
UPDATE Fisica SET limiteFisica = 750.00 WHERE Fisica.idCliente = 6;
UPDATE Fisica SET limiteFisica = 900.00 WHERE Fisica.idCliente = 8;
UPDATE Fisica SET limiteFisica = 450.00 WHERE Fisica.idCliente = 9;
UPDATE Juridica SET limiteJuridica = 20000.00 WHERE Juridica.idCliente = 6;
--Conta--
INSERT INTO Conta VALUES (1, current_date, 10000.00, 1, 1, 1);
INSERT INTO Conta VALUES (2, current_date, 12000.00, 1, 1, 2);
INSERT INTO Conta VALUES (3, '2015-10-26', 24000.00, 2, 2, 3);
INSERT INTO Conta VALUES (4, '2014-07-15', 30000.00, 2, 2, 4);
INSERT INTO Conta VALUES (5, '2014-09-20', 30000.00, 3, 3, 5);
INSERT INTO Conta VALUES (6, current_date, 40000.00, 3, 3, 6);
INSERT INTO Conta VALUES (7, '2013-11-23', 50000.00, 4, 4, 7);
INSERT INTO Conta VALUES (8, '2015-02-24', 30000.00, 4, 4, 8);
INSERT INTO Conta VALUES (9, current_date, 40000.00, 5, 5, 9);
INSERT INTO Conta VALUES (10, '2015-05-12', 40000.00, 5, 5, 10);

--Consulta--
INSERT INTO Consulta VALUES (1, '2015-07-26', 'Aumento no limite do Saque', 1, 1);
INSERT INTO Consulta VALUES (2, '2015-06-25', 'Requerimento de um novo cartão', 2, 2);
INSERT INTO Consulta VALUES (3, '2015-02-12', 'Valor Incoerente em conta', 4, 5);
INSERT INTO Consulta VALUES (4, '2015-01-24', 'Aumento no limite do Emprestimo', 5, 10);
INSERT INTO Consulta VALUES (5, '2015-03-13', 'Fechamento de Conta', 3, 5);

--Transação--
INSERT INTO Transacao VALUES (1, 'Saque', current_date, 200, NULL, 1);
INSERT INTO Transacao VALUES (2, 'Saque', current_date, 200, NULL, 1);
INSERT INTO Transacao VALUES (3, 'Deposito', '2015-03-20', 400, NULL, 1);
INSERT INTO Transacao VALUES (4, 'Deposito', '2015-03-29', 800, NULL, 1);
INSERT INTO Transacao VALUES (5, 'Transferencia', '2015-03-20', 400, 3, 1);
INSERT INTO Transacao VALUES (6, 'Transferencia', '2015-06-28', 400, 5, 1);
INSERT INTO Transacao VALUES (7, 'Saque', '2015-03-20', 400, NULL, 2);
INSERT INTO Transacao VALUES (8, 'Saque', '2015-03-20', 400, NULL, 2);
INSERT INTO Transacao VALUES (9, 'Deposito', '2015-03-20', 920, NULL, 2);
INSERT INTO Transacao VALUES (10, 'Deposito', '2015-03-20', 690, NULL, 2);
INSERT INTO Transacao VALUES (11, 'Transferencia', '2014-02-20', 400, 1, 2);
INSERT INTO Transacao VALUES (12, 'Transferencia', '2015-07-21', 400, 10, 2);
INSERT INTO Transacao VALUES (13, 'Saque', '2014-07-20', 100, NULL, 3);
INSERT INTO Transacao VALUES (14, 'Saque', '2014-07-20', 150, NULL, 3);
INSERT INTO Transacao VALUES (15, 'Deposito', '2015-03-20', 1600, NULL, 3);
INSERT INTO Transacao VALUES (16, 'Deposito', '2014-08-07', 400, NULL, 3);
INSERT INTO Transacao VALUES (17, 'Transferencia', '2015-03-20', 400, 10, 3);
INSERT INTO Transacao VALUES (18, 'Transferencia', '2015-03-20', 400, 4, 3);
INSERT INTO Transacao VALUES (19, 'Saque', '2015-04-23', 165.45, NULL, 4);
INSERT INTO Transacao VALUES (20, 'Saque', '2015-08-12', 142.24, NULL, 4);
INSERT INTO Transacao VALUES (21, 'Deposito', '2015-04-26', 360, NULL, 4);
INSERT INTO Transacao VALUES (22, 'Deposito', '2015-04-18', 123, NULL, 4);
INSERT INTO Transacao VALUES (23, 'Transferencia', '2015-02-12', 400, 6, 4);
INSERT INTO Transacao VALUES (24, 'Transferencia', '2015-03-13', 400, 7, 4);
INSERT INTO Transacao VALUES (25, 'Saque', '2015-03-20', 200, NULL, 5);
INSERT INTO Transacao VALUES (26, 'Saque', '2015-03-20', 200, NULL, 5);
INSERT INTO Transacao VALUES (27, 'Deposito', '2015-03-20', 350, NULL, 5);
INSERT INTO Transacao VALUES (28, 'Deposito', '2015-03-20', 120, NULL, 5);
INSERT INTO Transacao VALUES (29, 'Transferencia', current_date, 400, 3, 5);
INSERT INTO Transacao VALUES (30, 'Transferencia', current_date, 400, 9, 5);
INSERT INTO Transacao VALUES (31, 'Saque', '2014-08-12', 400, NULL, 6);
INSERT INTO Transacao VALUES (32, 'Saque', '2015-03-23', 400, NULL, 6);
INSERT INTO Transacao VALUES (33, 'Deposito', '2015-07-03', 360, NULL, 6);
INSERT INTO Transacao VALUES (34, 'Deposito', '2015-11-04', 120, NULL, 6);
INSERT INTO Transacao VALUES (35, 'Transferencia', '2015-08-23', 500, 8, 6);
INSERT INTO Transacao VALUES (36, 'Transferencia', '2015-03-24', 1600, 1, 6);
INSERT INTO Transacao VALUES (37, 'Saque', '2015-03-20', 300, NULL, 7);
INSERT INTO Transacao VALUES (38, 'Saque', '2015-03-20', 200, NULL, 7);
INSERT INTO Transacao VALUES (39, 'Deposito', current_date, 1200, NULL, 7);
INSERT INTO Transacao VALUES (40, 'Deposito', '2014-07-28', 900, NULL, 7);
INSERT INTO Transacao VALUES (41, 'Transferencia', current_date, 120, 10, 7);
INSERT INTO Transacao VALUES (42, 'Transferencia', '2014-07-23', 230, 4, 7);
INSERT INTO Transacao VALUES (43, 'Saque', current_date, 400, NULL, 8);
INSERT INTO Transacao VALUES (44, 'Saque', '2014-07-01', 400, NULL, 8);
INSERT INTO Transacao VALUES (45, 'Deposito', '2015-01-20', 400, NULL, 8);
INSERT INTO Transacao VALUES (46, 'Deposito', '2015-03-17', 400, NULL, 8);
INSERT INTO Transacao VALUES (47, 'Transferencia', '2015-02-12', 400, 1, 8);
INSERT INTO Transacao VALUES (48, 'Transferencia', '2015-04-16', 400, 3, 8);
INSERT INTO Transacao VALUES (49, 'Saque', '2015-12-21', 400, NULL, 9);
INSERT INTO Transacao VALUES (50, 'Saque', '2015-07-20', 400, NULL, 9);
INSERT INTO Transacao VALUES (51, 'Deposito', '2015-08-30', 400, NULL, 9);
INSERT INTO Transacao VALUES (52, 'Deposito', '2015-08-30', 400, NULL, 9);
INSERT INTO Transacao VALUES (53, 'Transferencia', '2015-02-24', 400, 3, 9);
INSERT INTO Transacao VALUES (54, 'Transferencia', '2015-05-21', 400, 1, 9);
INSERT INTO Transacao VALUES (55, 'Saque', '2014-03-12', 400, NULL, 10);
INSERT INTO Transacao VALUES (56, 'Saque', '2015-03-14', 400, NULL, 10);
INSERT INTO Transacao VALUES (57, 'Deposito', '2015-03-12', 400, NULL, 10);
INSERT INTO Transacao VALUES (58, 'Deposito', '2015-07-07', 400, NULL, 10);
INSERT INTO Transacao VALUES (59, 'Transferencia', '2015-03-20', 400, 4, 10);
INSERT INTO Transacao VALUES (60, 'Transferencia', current_date, 400, 5, 10);

--Produto--
INSERT INTO Produto VALUES (1, 'Cartao', 1);
INSERT INTO Produto VALUES (2, 'Cheque', 1);
INSERT INTO Produto VALUES (3, 'Cartao', 2);
INSERT INTO Produto VALUES (4, 'Cheque', 2);
INSERT INTO Produto VALUES (5, 'Cartao', 3);
INSERT INTO Produto VALUES (6, 'Cartao', 4);
INSERT INTO Produto VALUES (7, 'Cheque', 4);
INSERT INTO Produto VALUES (8, 'Cartao', 5);
INSERT INTO Produto VALUES (9, 'Cheque', 5);
INSERT INTO Produto VALUES (10, 'Cartao', 6);
INSERT INTO Produto VALUES (11, 'Emprestimo', 6);
INSERT INTO Produto VALUES (12, 'Cartao', 7);
INSERT INTO Produto VALUES (13, 'Emprestimo', 7);
INSERT INTO Produto VALUES (14, 'Cartao', 8);
INSERT INTO Produto VALUES (15, 'Cartao', 9);
INSERT INTO Produto VALUES (16, 'Cheque', 9);
INSERT INTO Produto VALUES (17, 'Emprestimo', 9);
INSERT INTO Produto VALUES (18, 'Cartao', 10);
INSERT INTO Produto VALUES (19, 'Cheque', 10);
INSERT INTO Produto VALUES (20, 'Emprestimo', 10);

--Bandeira--
INSERT INTO Bandeira VALUES (1, 'Visa', 7.12);
INSERT INTO Bandeira VALUES (2, 'MasterCard', 8.14);

--Cheque--
INSERT INTO Cheque VALUES (1, current_date, current_date+30,2);
INSERT INTO Cheque VALUES (2, '2015-02-21', '2015-06-12',4);
INSERT INTO Cheque VALUES (3, '2015-04-21', '2015-04-21',7);
INSERT INTO Cheque VALUES (4, '2015-03-21', '2015-05-21',9);
INSERT INTO Cheque VALUES (5, '2015-02-21', '2015-03-21',16);
INSERT INTO Cheque VALUES (6, '2014-02-21', '2015-07-21',19);

--Emprestimo--
INSERT INTO Emprestimo VALUES (1, 50000, 2.15, '2015-02-12', 11);
INSERT INTO Emprestimo VALUES (2, 10000, 2.15, '2014-08-23', 13);
INSERT INTO Emprestimo VALUES (3, 12000, 2.15, '2015-08-01', 17);
INSERT INTO Emprestimo VALUES (4, 12000, 2.15, '2015-08-01', 20);

--Cartão--
INSERT INTO Cartao VALUES (1,'Credito', 111, current_date, current_date+366, 1, 1);
INSERT INTO Cartao VALUES (2,'Debito', 211, '2014-08-23', '2015-08-23', 1, 1);
INSERT INTO Cartao VALUES (3,'Credito', 112, '2015-09-12', '2016-09-12', 3, 1);
INSERT INTO Cartao VALUES (4,'Credito', 113, '2015-07-19', '2016-07-19', 5, 1);
INSERT INTO Cartao VALUES (5,'Debito', 212, '2015-02-17', '2016-02-17', 5, 1);
INSERT INTO Cartao VALUES (6,'Debito', 213, '2015-05-22', '2016-05-22', 6, 1);
INSERT INTO Cartao VALUES (7,'Credito', 115, '2014-04-23', '2015-04-23', 8, 1);
INSERT INTO Cartao VALUES (8,'Credito', 116, '2014-09-27', '2015-09-27', 10, 2);
INSERT INTO Cartao VALUES (9,'Debito', 214, '2014-01-11', '2015-01-11', 10, 2);
INSERT INTO Cartao VALUES (10,'Credito', 117, '2014-12-11', '2015-12-11', 12, 2);
INSERT INTO Cartao VALUES (11,'Credito', 118, '2015-04-15', '2016-04-15', 14, 2);
INSERT INTO Cartao VALUES (12,'Debito', 215, '2015-03-25', '2016-03-25', 14, 2);
INSERT INTO Cartao VALUES (13,'Credito', 119, '2015-09-17', '2016-09-17', 15, 2);
INSERT INTO Cartao VALUES (14,'Debito', 110, '2015-10-10', '2016-10-10', 18, 2);

--Credito--
INSERT INTO Credito VALUES (1, 10000, 1111, 1);
INSERT INTO Credito VALUES (2, 12000, 1112, 3);
INSERT INTO Credito VALUES (3, 20000, 1113, 4);
INSERT INTO Credito VALUES (4, 15000, 1114, 7);
INSERT INTO Credito VALUES (5, 25000, 1115, 8);
INSERT INTO Credito VALUES (6, 13000, 1116, 10);
INSERT INTO Credito VALUES (7, 14000, 1117, 11);
INSERT INTO Credito VALUES (8, 18000, 1118, 13);

--Debito--
INSERT INTO Debito VALUES (1, 211111, 2);
INSERT INTO Debito VALUES (2, 211112, 5);
INSERT INTO Debito VALUES (3, 211112, 6);
INSERT INTO Debito VALUES (4, 211112, 9);
INSERT INTO Debito VALUES (5, 211112, 12);
INSERT INTO Debito VALUES (6, 211112, 14);

--Custo--
INSERT INTO Custo VALUES (1, 'Fatura', current_date, 1800, 1);
INSERT INTO Custo VALUES (2, 'Fatura', '2015-10-27', 2800, 3);
INSERT INTO Custo VALUES (3, 'Fatura', '2014-12-10', 800, 4);
INSERT INTO Custo VALUES (4, 'Fatura', '2015-01-07', 1200, 7);
INSERT INTO Custo VALUES (5, 'Fatura', '2014-09-17', 1300, 8);
INSERT INTO Custo VALUES (6, 'Fatura', '2015-10-21', 200, 10);
INSERT INTO Custo VALUES (7, 'Fatura', '2015-04-24', 3000, 11);
INSERT INTO Custo VALUES (8, 'Fatura', '2015-03-17', 2000, 13);
INSERT INTO Custo VALUES (9, 'Fatura', '2015-01-17', 600, 4);
INSERT INTO Custo VALUES (10, 'Fatura', '2014-12-28', 600, 8);
INSERT INTO Custo VALUES (11, 'Compra', '2015-10-01', 700, 2);
INSERT INTO Custo VALUES (12, 'Compra', '2014-12-24', 1000, 5);
INSERT INTO Custo VALUES (13, 'Compra', '2015-07-22', 900, 6);
INSERT INTO Custo VALUES (14, 'Compra', '2015-06-22', 300, 9);
INSERT INTO Custo VALUES (15, 'Compra', '2015-05-21', 1500, 12);
INSERT INTO Custo VALUES (16, 'Compra', '2015-02-22', 300, 14);
INSERT INTO Custo VALUES (17, 'Compra', '2015-01-11', 800, 6);
INSERT INTO Custo VALUES (18, 'Compra', '2015-03-17', 700, 5);
INSERT INTO Custo VALUES (19, 'Compra', '2015-08-20', 1400, 2);
INSERT INTO Custo VALUES (20, 'Compra', '2015-10-13', 300, 12);

--Nota Fiscal--
INSERT INTO NotaFiscal VALUES (1,1);
INSERT INTO NotaFiscal VALUES (2,3);
INSERT INTO NotaFiscal VALUES (3,6);
INSERT INTO NotaFiscal VALUES (4,7);
INSERT INTO NotaFiscal VALUES (5,8);
INSERT INTO NotaFiscal VALUES (6,10);
INSERT INTO NotaFiscal VALUES (7,12);
INSERT INTO NotaFiscal VALUES (8,13);
INSERT INTO NotaFiscal VALUES (9,16);
INSERT INTO NotaFiscal VALUES (10,19);

/*
--Transação--
--Erro caso a contaTransação não seja NULL, para saque ou deposito--
INSERT INTO Transacao VALUES (80, 'Saque', '2014-07-20', 100, 2, 3);
INSERT INTO Transacao VALUES (80, 'Deposito', '2014-07-20', 100, 2, 3);
--Caso a conta não possui saldo no saque--
INSERT INTO Transacao VALUES (80, 'Saque', '2014-07-20', 100000, NULL, 3);
--Caso o limite diario seja insuficiente--
INSERT INTO Transacao VALUES (80, 'Saque', '2014-07-20', 10000,NULL, 3);
--Teste do limite de saque diário--
INSERT INTO Transacao VALUES (83, 'Saque', '2014-07-21', 400,NULL, 1);
INSERT INTO Transacao VALUES (80, 'Saque', '2014-07-20', 500,NULL, 3);
INSERT INTO Transacao VALUES (84, 'Saque', '2014-07-21', 400,NULL, 1);
SELECT Conta.idConta ,Transacao.idTransacao, tipoTransacao, valorTransacao, saldoConta, limiteSaque  FROM Saque, Transacao, Conta
WHERE Saque.idTransacao = Transacao.idTransacao AND Transacao.idConta = Conta.idConta
AND Conta.idConta = 1;
--Transferencia para uma conta inexistente--
INSERT INTO Transacao VALUES (89, 'Transferencia', '2014-07-27', 100000,8, 5);

--Custo--
--Caso tente fazer uma compra com o cartão de debito em uma fatura--
INSERT INTO Custo VALUES (25, 'Fatura', '2014-12-10', 800, 12);
--Caso tente realizar uma compra com o cartão de credito--
INSERT INTO Custo VALUES (27, 'Compra', '2014-12-10', 800, 1);
--Caso o usuario não tenha saldo suficiente para realizar uma compra--
INSERT INTO Custo VALUES (28, 'Compra', '2014-12-10', 1000000, 12);
--Caso estoure o limite de credito--
INSERT INTO Custo VALUES (25, 'Fatura', '2014-12-10', 100000, 1);

--Caso vença a fatura--
INSERT INTO Custo VALUES (28, 'Fatura', '2014-12-10', 1000, 4);
INSERT INTO Custo VALUES (30, 'Fatura', '2015-03-10', 2540, 4);


SELECT Custo.idCusto, tipoCusto, datainicioFatura, datafimFatura, valorFatura  FROM Custo, Fatura, Cartao
WHERE Custo.idCartao = Cartao.idCartao AND Fatura.idCusto = Custo.idCusto AND Cartao.idCartao = 4;

SELECT  idCartao,saldoConta  FROM  Cartao, Cliente, Produto, Conta
WHERE Cartao.idProduto = Produto.idProduto AND Produto.idCliente = Cliente.idCliente
AND Cliente.idCliente = Conta.idCliente AND Cartao.idCartao = 4;
*/

/*SELECT * FROM Fatura;
SELECT * FROM Compra;
SELECT * FROM NotaFiscal;
SELECT * FROM Debito;
SELECT * FROM Credito;
SELECT * FROM Cheque;
SELECT * FROM Emprestimo;
SELECT * FROM Juridica;
SELECT * FROM Fisica;
SELECT * FROM Extrato;
SELECT * FROM Pagamento;
SELECT * FROM Custo;
SELECT * FROM Cartao;
SELECT * FROM Bandeira;
SELECT * FROM Produto;
SELECT * FROM Transferencia;
SELECT * FROM Deposito;
SELECT * FROM Saque;
SELECT * FROM Transacao;
SELECT * FROM Consulta;
SELECT * FROM Conta;
SELECT * FROM Cliente;
SELECT * FROM Funcionario;
SELECT * FROM Agencia;
SELECT * FROM Endereco;*/