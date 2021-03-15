-- Transação --
CREATE OR REPLACE FUNCTION TransacaoTG() RETURNS TRIGGER AS $TransacaoTG$
DECLARE
--verSaldo: USED BY CHECK BALANCE OF USER--
verSaldo NUMERIC(12,2);
--limitSaque: CHECK THE LIMIT OF WITHDRAW   OF ACCOUNT USED--
limitSaque NUMERIC(10,2);
--tipoclienteSaque: CHECK TYPE OF RELATED ACCOUNT--
tipoclienteSaque VARCHAR(100);
--idclienteSaque: CHECK THE ID OF CLIENT IN WITHDRAW--
idclienteSaque INTEGER;
--qtdSaque: INDICATE IF THIS COUNT REALIZED MORE OF SKAE IN A SAME DAY--
qtdSaque INTEGER;
--qtdDeposito: INDICATE IF THIS COUNT REALIZED MORE OF DEPOSIT IN A SAME DAY--
qtdDeposito INTEGER;
--limitDeposito: CHECK THE LIMIT OF DEPOSIT OF USED ACCOUNT--
limitDeposito NUMERIC(10,2);
vertipoPagamento VARCHAR(100);


BEGIN

SELECT saldoConta INTO verSaldo FROM Conta
WHERE Conta.idConta = new.idConta;

--IF THE TRANSACTION IS OF TYPE WITHDRAW--
IF (new.tipoTransacao = 'Saque') THEN

	SELECT count(*) INTO qtdSaque  FROM Transacao
	WHERE Transacao.idConta = new.idConta AND Transacao.dataTransacao = new.dataTransacao AND Transacao.tipoTransacao = 'Saque';
	
	IF (qtdSaque > 1) THEN
		--IF THE USER ALREADY WITHDRAW A ONCE TIME, HE CAT THE VALUE OF LIMIT REMAINING IN THE DAY--
		SELECT limiteSaque INTO limitSaque FROM Saque, Transacao 
		WHERE new.idConta = Transacao.idConta AND new.dataTransacao = Transacao.dataTransacao AND Transacao.idTransacao = Saque.idTransacao
		ORDER BY limiteSaque LIMIT 1;
		
		--CHECK IF THE ACCOUNT HAS BALACNCE  ENOUGHT--
		IF (new.valorTransacao > verSaldo) THEN
			RAISE EXCEPTION 'Saldo da conta insuficiente!';
		ELSE
			--CHECK IF THE ACCOUNT FOR TRANSITION IS NULL, BECAUSE THAT DO A WITHDRAW--
			IF (new.contaTransacao IS NOT NULL) THEN
				RAISE EXCEPTION 'Conta Transacao tem que ser null para realizar um saque!';
			ELSE 
				--IF ALL ABOVE APROVE AND ACCEPTED, THAT CHECK IF THE LIMIT OF WITHDRAW IS ENOUGHT--                  --
				IF (limitSaque >= new.valorTransacao) THEN
					limitSaque = limitSaque - new.valorTransacao;
					UPDATE Conta SET saldoConta = saldoConta - new.valorTransacao WHERE Conta.idConta = new.idConta;
					INSERT INTO Saque(idTransacao, limiteSaque) VALUES (new.idTransacao, limitSaque);
					INSERT INTO Extrato(idTransacao) VALUES (new.idTransacao);
					RETURN NEW;
				ELSE
					RAISE EXCEPTION 'Limite de Saque diario Insuficiente!';
				END IF;
			END IF;
		END IF;
	ELSE
		-- IF THE PEARSON NEVER WITHDRAW, REPEAT THE PROCESS OVER--
		IF (new.valorTransacao > verSaldo) THEN
			RAISE EXCEPTION 'Saldo da conta insuficiente!';
		ELSE
			IF (new.contaTransacao IS NOT NULL) THEN
				RAISE EXCEPTION 'Conta Transacao tem que ser null para realizar um saque!';
			ELSE 
				--IN THIS CASE, THE PEARSON NEVER WITHDRAW, AND YOUR LIMIT NOT EXISTS--
				--SO IN THIS PROCESS WE CAUGHT THE DATA OF CLIENT AND YOUR LIMIT FEATURED IN FISICA OU JURIDICA--
				--WHAT IS PLACED ON CREATION OF ACCOUNT--
				SELECT Cliente.idCliente INTO idclienteSaque FROM Conta, Cliente
				WHERE new.idConta = Conta.idConta AND Conta.idCliente = Cliente.idCliente;

				SELECT tipoCliente INTO tipoclienteSaque FROM Conta, Cliente
				WHERE new.idConta = Conta.idConta AND Conta.idCliente = Cliente.idCliente;

				IF (tipoclienteSaque = 'Fisica') THEN
					SELECT limiteFisica into limitSaque FROM Fisica
					WHERE idclienteSaque = Fisica.idCliente;

				ELSE
					SELECT limiteJuridica into limitSaque FROM Juridica
					WHERE idclienteSaque = Juridica.idCliente;

				END IF;								
				--AFTER THIS WE REALIZED THE NORMAL PROCESS OF WITHDRAW--
				IF (limitSaque >= new.valorTransacao) THEN
					limitSaque = limitSaque - new.valorTransacao;
					UPDATE Conta SET saldoConta = saldoConta - new.valorTransacao WHERE Conta.idConta = new.idConta;
					INSERT INTO Saque(idTransacao, limiteSaque) VALUES (new.idTransacao, limitSaque);
					INSERT INTO Extrato(idTransacao) VALUES (new.idTransacao);
					RETURN NEW;
				ELSE
					RAISE EXCEPTION 'Limite de Saque diario Insuficiente!';
				END IF;
			END IF;
		END IF;
	END IF;
END IF;

--IF THE TRANSACTION IS OF TYPE DEPOSIT--
IF (new.tipoTransacao = 'Deposito') THEN
	
	SELECT count(*) INTO qtdDeposito  FROM Transacao
	WHERE Transacao.idConta = new.idConta AND Transacao.dataTransacao = new.dataTransacao AND Transacao.tipoTransacao = 'Deposito';
	
	IF (qtdDeposito > 1) THEN
		--IF THE USER ALREADY DEPOSIT A ONCE TIME, HE CAT THE VALUE OF LIMIT REMAINING IN THE DAY--
		SELECT limiteDeposito INTO limitDeposito FROM Deposito, Transacao 
		WHERE new.idConta = Transacao.idConta AND new.dataTransacao = Transacao.dataTransacao AND Transacao.idTransacao = Deposito.idTransacao
		ORDER BY limiteDeposito LIMIT 1;
		--CHECK IF THE ACCOUNT FOR TRANSITION IS NULL, BECAUSE THAT DO A DEPOSIT--
		IF (new.contaTransacao IS NOT NULL) THEN
			RAISE EXCEPTION 'Conta Transacao tem que ser null para realizar um Deposito!';
		ELSE 
			--IF ALL ABOVE APROVE AND ACCEPTED, THAT CHECK IF THE LIMIT OF DEPOSIT IS ENOUGHT--                   --
			IF (limitDeposito >= new.valorTransacao) THEN
				limitDeposito = limitDeposito - new.valorTransacao;
				UPDATE Conta SET saldoConta = saldoConta + new.valorTransacao WHERE Conta.idConta = new.idConta;
				INSERT INTO Deposito(idTransacao, limiteDeposito) VALUES (new.idTransacao, limitDeposito);
				INSERT INTO Extrato(idTransacao) VALUES (new.idTransacao);
				RETURN NEW;
			ELSE
				RAISE EXCEPTION 'Limite de Deposito diario Insuficiente!';
			END IF;
		END IF;
	ELSE
		IF (new.contaTransacao IS NOT NULL) THEN
			RAISE EXCEPTION 'Conta Transacao tem que ser null para realizar um Deposito!';
		ELSE 
			--IN THIS CASE, THE PEARSONNEVER WITHDRAW, AND YOUR LIMIT NOT EXISTS--
			limitDeposito = 2000.00;						
			--AFTER THIS WE REALIZED THE NORMAL PROCESS OF DEPOSIT--
			IF (limitDeposito >= new.valorTransacao) THEN
				limitDeposito = limitDeposito - new.valorTransacao;
				UPDATE Conta SET saldoConta = saldoConta + new.valorTransacao WHERE Conta.idConta = new.idConta;
				INSERT INTO Deposito(idTransacao, limiteDeposito) VALUES (new.idTransacao, limitDeposito);
				INSERT INTO Extrato(idTransacao) VALUES (new.idTransacao);
				RETURN NEW;
			ELSE
				RAISE EXCEPTION 'Limite de Deposito diario Insuficiente!';
			END IF;
		END IF;
	END IF;
END IF;
--IF THE TRANSACTION IS OF TYPE TRANSFER--
IF (new.tipoTransacao = 'Transferencia') THEN
	--CHECK IF THE ACCOUNT OF TRANSFER EXISTS--
	IF (NOT EXISTS (SELECT NULL FROM Conta WHERE idConta = new.contaTransacao) ) THEN
	RAISE EXCEPTION 'Conta para a Transferencia Inexistente';
	ELSE 
		--IF EXISTS CHECK BALANCE OF ACCOUNT FOR TRANSFER, IF IS TOP MAKE THE PROCESS--
		IF (new.valorTransacao > versaldo) THEN
			RAISE EXCEPTION 'Saldo Insuficiente para realizar a Transferencia';
		ELSE 
			INSERT INTO Transferencia(idTransacao, tipoTransferencia, contaTransferencia) VALUES (new.idTransacao, 'Entrada', new.contaTransacao);
			INSERT INTO Transferencia(idTransacao, tipoTransferencia, contaTransferencia) VALUES (new.idTransacao, 'Saida', new.idConta);
			INSERT INTO Extrato(idTransacao) VALUES (new.idTransacao);
			UPDATE Conta SET saldoConta = saldoConta - new.valorTransacao WHERE Conta.idConta = new.idConta;
			UPDATE Conta SET saldoConta = saldoConta + new.valorTransacao WHERE Conta.idConta = new.contaTransacao;
		RETURN NEW;
		END IF;
	END IF;
END IF;

--IF THE TRANSACTION IS OF TYPE PAY--
IF (new.tipoTransacao = 'Pagamento') THEN

	IF (new.valorTransacao > verSaldo) THEN
		RAISE EXCEPTION 'Saldo Insuficiente para realizar o Pagamento';
	ELSE 
		SELECT tipoCusto INTO vertipoPagamento FROM Custo
		WHERE Custo.idCusto = new.contaTransacao;
		IF (vertipoPagamento = 'Fatura') THEN
			INSERT INTO Pagamento(idTransacao, idCusto, tipoPagamento) VALUES (new.idTransacao, new.contaTransacao, 'Fatura');	
		ELSE
			INSERT INTO Pagamento(idTransacao, idCusto, tipoPagamento) VALUES (new.idTransacao, new.contaTransacao, 'Compra');
		END IF;
		INSERT INTO Extrato (idTransacao) VALUES (new.idTransacao);
		UPDATE Conta SET saldoConta = saldoConta - new.valorTransacao WHERE Conta.idConta = new.idConta;
		RETURN NEW;
	END IF;
END IF;
RETURN NEW;
END;

$TransacaoTG$ LANGUAGE plpgsql;

--WE SHOOTING THIS TRIGGER AFTER THE INSERT IN THABLE TRANSACTION, BECAUSE WHEN WE DE INSERT IN THE OTHER TABLES--
--IF REQUIRED THAT AREADY EXIST THE IDTRANSACAO, BECAUSE THAT IS A FOREING KEY-- 
CREATE TRIGGER Transacao_TG
AFTER INSERT ON Transacao
FOR EACH ROW EXECUTE PROCEDURE TransacaoTG();

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Custo --
CREATE OR REPLACE FUNCTION CustoTG() RETURNS TRIGGER AS $CustoTG$
DECLARE
--verftipoCartao: THIS VARIABLE IS USED TO IDENTIFY THE TYPE OF CARD USED--
verftipoCartao VARCHAR(100);
--verfsaldoConta: THIS VARIABLE IS USED TO SAVE THE USED ACCOUNT BALANCE--
verfsaldoConta NUMERIC (10,2);
--verfsaldoConta: THIS VARIABLE SERVES TO SAVE THE ID OF THE ACCOUNT USED--
verfConta INTEGER;
--verfIDTransacao: THIS VARIABLE SERVES TO SAVE THE ID OF THE ACCOUNT USED--
verfIDTransacao INTEGER;
--verlimiteCredito: THIS VARIABLE IS USED TO GET THE CREDIT LIMIT--
verlimiteCredito NUMERIC(10,2);
--cont: THIS VARIABLE IS USED TO TELL IF THERE IS ANY EXISTING INVOICE--
cont INTEGER;
--vervalorFatura: THIS VARIABLE IS USED TO GET THE INVOICE AMOUNT--
vervalorFatura NUMERIC(10,2);
--verdatainifatura e verdatafimFatura: THIS VARIABLE IS USED TO SAVE HE START AND END OF THE INVOCIE IF THERE--
verdatainiFatura DATE;
verdatafimFatura DATE;

BEGIN

SELECT tipoCartao INTO verftipoCartao FROM Cartao
WHERE new.idCartao = Cartao.idCartao;

SELECT Conta.idConta, saldoConta INTO verfConta,verfsaldoConta FROM Cartao, Produto, Cliente, Conta 
WHERE Cartao.idCartao = new.idCartao AND Produto.idProduto = Cartao.idProduto AND Produto.idCliente = Cliente.idCliente
AND Cliente.idCliente = Conta.idCliente;

SELECT idTransacao INTO verfIDTransacao FROM Transacao
ORDER BY idTransacao DESC LIMIT 1;

-- IF THE TYPE BUYS THE CARD HAS TO BE DEBITO--
IF (new.tipoCusto = 'Compra') THEN
	IF (verftipoCartao = 'Debito') THEN
		--IF THE BALANCE IS SUFFICIENT IT MAKES THE PAYMENT OF THE INCOICE--
		IF (verfsaldoConta >= new.valorCusto) THEN
			INSERT INTO Compra(idCusto) VALUES (new.idCusto);
			INSERT INTO Transacao VALUES (verfIDTransacao + 1, 'Pagamento', new.dataCusto, new.valorCusto, new.idCusto, verfConta);
		ELSE
			RAISE EXCEPTION 'Sua Conta não possui saldo suficiente';
		END IF;
	ELSE
	RAISE EXCEPTION 'Seu Cartao tem que ser de debito para realizar uma compra';
	END IF;
ELSE 
	--IF THE TYPE INCOICE CARD HAS TO BE CREDIT--
	IF (verftipoCartao = 'Credito') THEN

		SELECT limiteCredito INTO verlimiteCredito FROM Cartao, Credito
		WHERE Credito.idCartao = new.idCartao;

		SELECT COUNT(*) INTO cont FROM Custo, Fatura, Cartao
		WHERE Cartao.idCartao = new.idCartao AND Custo.idCartao = Cartao.idCartao AND Fatura.idCusto = Custo.idCusto;


		--IF THE TYPE INVOICE CARD HAS TO BE CREDIT--
		IF (verlimiteCredito >= new.valorCusto) THEN
			--IF YOU HAVE EXISTS AN INVOICE THAT IS COUNT > 0, IS COMPLETES THE PREVIUS BILL--
			IF (cont > 0) THEN
				SELECT datainicioFatura, datafimFatura INTO verdatainiFatura, verdatafimFatura FROM Custo, Fatura, Cartao
				WHERE Cartao.idCartao = new.idCartao AND Custo.idCartao = Cartao.idCartao AND Fatura.idCusto = Custo.idCusto
				LIMIT 1;
				
				SELECT valorFatura INTO vervalorFatura FROM Custo, Fatura, Cartao
				WHERE Cartao.idCartao = new.idCartao AND Custo.idCartao = Cartao.idCartao AND Fatura.idCusto = Custo.idCusto
				ORDER BY valorFatura DESC LIMIT 1;

				--HAS PASSED FROM THE DATE OF INVOICE DUE THE TRIGGER, PAID THE PREVIUS BILL AND STARTS A NEW--
				IF (new.dataCusto > verdatafimFatura) THEN
					
					IF (verfsaldoConta >= vervalorFatura) THEN
					RAISE NOTICE 'Pagando Fatura Anterior';
					DELETE FROM Fatura USING Custo, Cartao WHERE Cartao.idCartao = new.idCartao AND Cartao.idCartao = Custo.idCartao AND Custo.idCusto = Fatura.idCusto;
					UPDATE Credito SET limiteCredito = limiteCredito + vervalorFatura WHERE Credito.idCartao = new.idCartao;
					UPDATE Credito SET limiteCredito = limiteCredito - new.valorCusto WHERE Credito.idCartao = new.idCartao;
					INSERT INTO Fatura(datainicioFatura, datafimFatura, valorFatura, idCusto) VALUES (new.dataCusto, new.dataCusto + INTEGER '30', new.valorCusto, new.idCusto);
					INSERT INTO Transacao VALUES (verfIDTransacao + 1, 'Pagamento',new.dataCusto, vervalorFatura, new.idCusto, verfConta);
					ELSE
					--IF THE BALANCE IS NOT ENOUGH TO PAY THE INVOICE HE CLOSES THE TRIGGER--
					RAISE EXCEPTION 'Saldo insuficiente para pagar a fatura anterior';
					END IF;

				ELSE
					UPDATE Credito SET limiteCredito = limiteCredito - new.valorCusto WHERE Credito.idCartao = new.idCartao;
					INSERT INTO  Fatura(datainicioFatura, datafimFatura, valorFatura, idCusto) VALUES (verdatainiFatura, verdatafimFatura, vervalorFatura+new.valorCusto, new.idCusto);
				END IF;

			ELSE
				UPDATE Credito SET limiteCredito = limiteCredito - new.valorCusto WHERE Credito.idCartao = new.idCartao;
				INSERT INTO Fatura(datainicioFatura, datafimFatura, valorFatura, idCusto) VALUES (new.dataCusto, new.dataCusto + INTEGER '30', new.valorCusto, new.idCusto);
			END IF;

		ELSE

		RAISE EXCEPTION 'limite insuficiente';
		
		END IF;

	ELSE
		RAISE EXCEPTION 'Seu Cartao tem que ser de credito para comprar com uma fatura';
	END IF;
END IF;
RETURN NEW;
END;

$CustoTG$ LANGUAGE plpgsql;

CREATE TRIGGER Custo_TG
AFTER INSERT ON Custo
FOR EACH ROW EXECUTE PROCEDURE CustoTG();
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cliente--
CREATE OR REPLACE FUNCTION ClienteTG() RETURNS TRIGGER AS $ClienteTG$

BEGIN
	IF (new.tipoCliente = 'Fisica') THEN
		INSERT INTO Fisica(limiteFisica, idCliente) VALUES (400, new.idCliente);
	ELSE
		INSERT INTO Juridica(limiteJuridica, idCliente) VALUES (1000, new.idCliente);
	END IF;

RETURN NEW;
END;

$ClienteTG$ LANGUAGE plpgsql;

CREATE TRIGGER Cliente_TG
AFTER INSERT ON Cliente
FOR EACH ROW EXECUTE PROCEDURE ClienteTG();

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Emprestimo--
CREATE OR REPLACE FUNCTION EmprestimoTG() RETURNS TRIGGER AS $EmprestimoTG$
DECLARE

verfConta INTEGER;

BEGIN

SELECT idConta INTO verfConta FROM Produto, Cliente, Conta
WHERE Produto.idProduto = new.idProduto AND Cliente.idCliente = Produto.idCliente AND Conta.idCliente = Cliente.idCliente;

UPDATE Conta SET saldoConta = saldoConta + new.valorEmprestimo WHERE Conta.idConta = verfConta;

RETURN NEW;
END;

$EmprestimoTG$ LANGUAGE plpgsql;

CREATE TRIGGER Emprestimo_TG
AFTER INSERT ON Emprestimo
FOR EACH ROW EXECUTE PROCEDURE EmprestimoTG();

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Endereços --

--THIS TRIGGER CHECKS FOR ANY EMPLOYEE OR CUSTOMER WHO LIVES IN AN AGENCY--
CREATE OR REPLACE FUNCTION EnderecoFuncionarioTG() RETURNS TRIGGER AS $EnderecoFuncionarioTG$
DECLARE verfEndereco VARCHAR(100);

BEGIN
SELECT tipoEndereco INTO verfEndereco FROM Endereco
WHERE idEndereco = new.enderecoFuncionario;	

IF (verfEndereco = 'Agencia') THEN
	RAISE EXCEPTION 'Este Endereco Pertence a uma Agencia!';
END IF;
RETURN NEW;
END;
$EnderecoFuncionarioTG$ LANGUAGE plpgsql;


CREATE TRIGGER EnderecoFuncionario_TG
BEFORE INSERT ON Funcionario
FOR EACH ROW EXECUTE PROCEDURE EnderecoFuncionarioTG();



CREATE OR REPLACE FUNCTION EnderecoClienteTG() RETURNS TRIGGER AS $EnderecoClienteTG$
DECLARE verfEndereco VARCHAR(100);

BEGIN
SELECT tipoEndereco INTO verfEndereco FROM Endereco
WHERE idEndereco = new.enderecoCliente;

IF (verfEndereco = 'Agencia') THEN
	RAISE EXCEPTION 'Este Endereco nao Pertence a uma Agencia!';
END IF;
RETURN NEW;
END;
$EnderecoClienteTG$ LANGUAGE plpgsql;


CREATE TRIGGER EnderecoCliente_TG
BEFORE INSERT ON Cliente
FOR EACH ROW EXECUTE PROCEDURE EnderecoClienteTG();

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Produtos--

--THE TRIGGERS OF THE PRODUCT IS JUST TO CHECK IF THE TYPE OF THE REGISTRED PRODUCT WAS USED ONLY IN WHAT HAS BEEN DESIGNED--

--Cartao--
CREATE OR REPLACE FUNCTION produtoCartaoTG() RETURNS TRIGGER AS $produtoCartaoTG$
DECLARE
verftipoProduto VARCHAR(100);

BEGIN

SELECT tipoProduto INTO verftipoProduto FROM Produto
WHERE new.idProduto = Produto.idProduto;

IF (verftipoProduto <> 'Cartao') THEN
	RAISE EXCEPTION 'Tipo de Produto registrado icompativel!';
END IF;

RETURN NEW;

END;
$produtoCartaoTG$ LANGUAGE plpgsql;

CREATE TRIGGER produtoCartao_TG
BEFORE INSERT ON Cartao
FOR EACH ROW EXECUTE PROCEDURE produtoCartaoTG();

--Cheque--
CREATE OR REPLACE FUNCTION produtoChequeTG() RETURNS TRIGGER AS $produtoChequeTG$
DECLARE
verftipoProduto VARCHAR(100);

BEGIN

SELECT tipoProduto INTO verftipoProduto FROM Produto
WHERE new.idProduto = Produto.idProduto;

IF (verftipoProduto <> 'Cheque') THEN
	RAISE EXCEPTION 'Tipo de Produto registrado icompativel!';
END IF;

RETURN NEW;

END;
$produtoChequeTG$ LANGUAGE plpgsql;

CREATE TRIGGER produtoCheque_TG
BEFORE INSERT ON Cheque
FOR EACH ROW EXECUTE PROCEDURE produtoChequeTG();

--Emprestimo--
CREATE OR REPLACE FUNCTION produtoEmprestimoTG() RETURNS TRIGGER AS $produtoEmprestimoTG$
DECLARE
verftipoProduto VARCHAR(100);

BEGIN

SELECT tipoProduto INTO verftipoProduto FROM Produto
WHERE new.idProduto = Produto.idProduto;

IF (verftipoProduto <> 'Emprestimo') THEN
	RAISE EXCEPTION 'Tipo de Produto registrado icompativel!';
END IF;

RETURN NEW;

END;
$produtoEmprestimoTG$ LANGUAGE plpgsql;

CREATE TRIGGER produtoEmprestimo_TG
BEFORE INSERT ON Emprestimo
FOR EACH ROW EXECUTE PROCEDURE produtoEmprestimoTG();

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cartao--

--THE TRIGGERS OF THE PRODUCT IS JUST TO CHECK IF THE TYPE OF THE REGISTRED PRODUCT WAS USED ONLY IN WHAT HAS BEEN DESIGNED--

CREATE OR REPLACE FUNCTION cartaoCreditoTG() RETURNS TRIGGER AS $cartaoCreditoTG$
DECLARE
verftipoProduto VARCHAR(100);
BEGIN
SELECT tipoCartao INTO verftipoProduto FROM Cartao
WHERE Cartao.idCartao = new.idCartao;

IF (verftipoProduto <> 'Credito') THEN
	RAISE EXCEPTION 'Tipo de Produto registrado icompativel!';
END IF;

RETURN NEW;

END;
$cartaoCreditoTG$ LANGUAGE plpgsql;

CREATE TRIGGER cartaoCredito_TG
BEFORE INSERT ON Credito
FOR EACH ROW EXECUTE PROCEDURE cartaoCreditoTG();


CREATE OR REPLACE FUNCTION cartaoDebitoTG() RETURNS TRIGGER AS $cartaoDebitoTG$
DECLARE
verftipoProduto VARCHAR(100);

BEGIN

SELECT tipoCartao INTO verftipoProduto FROM Cartao
WHERE Cartao.idCartao = new.idCartao;

IF (verftipoProduto <> 'Debito') THEN
	RAISE EXCEPTION 'Tipo de Produto registrado icompativel!';
END IF;

RETURN NEW;

END;
$cartaoDebitoTG$ LANGUAGE plpgsql;

CREATE TRIGGER cartaoDebito_TG
BEFORE INSERT ON Debito
FOR EACH ROW EXECUTE PROCEDURE cartaoDebitoTG();