function clientDictionary(str, obj) {
	
	var i = 0;
	var dict = {
		'endereco' : [
			{key: 'idendereco', value: 'INTEGER'},
			{key: 'tipoendereco', value: 'CHARACTER VARYING'},
			{key: 'ruaendereco', value: 'CHARACTER VARYING'},
			{key: 'nroendereco', value: 'NUMERIC'},
			{key: 'bairroendereco', value: 'CHARACTER VARYING'},
			{key: 'cependereco', value: 'NUMERIC'},
			{key: 'cidadeendereco', value: 'CHARACTER VARYING'},
			{key: 'estadoendereco', value: 'CHARACTER'},
			{key: 'telefoneendereco', value: 'NUMERIC'}
		],
		'agencia' : [
			{key: 'idagencia', value: 'INTEGER'},
			{key: 'enderecoagencia', value: 'INTEGER'}
		],
		'funcionario' : [
			{key: 'idfuncionario', value: 'INTEGER'},
			{key: 'tipofuncionario', value: 'CHARACTER VARYING'},
			{key: 'nomefuncionario', value: 'CHARACTER VARYING'},
			{key: 'salariofuncionario', value: 'NUMERIC'},
			{key: 'enderecofuncionario', value: 'INTEGER'},
			{key: 'idagencia', value: 'INTEGER'}
		],
		'consulta' : [
			{key: 'idconsulta', value: 'INTEGER'},
			{key: 'dataconsulta', value: 'DATE'},
			{key: 'assuntoconsulta', value: 'CHARACTER VARYING'},
			{key: 'idconta', value: 'INTEGER'},
			{key: 'idfuncionario', value: 'INTEGER'}
		],
		'transacao' : [
			{key: 'idtransacao', value: 'INTEGER'},
			{key: 'tipotransacao', value: 'CHARACTER VARYING'},
			{key: 'datatransacao', value: 'DATE'},
			{key: 'valortransacao', value: 'NUMERIC'},
			{key: 'contatransacao', value: 'INTEGER'},
			{key: 'idconta', value: 'INTEGER'}
		],
		'saque' : [
			{key: 'idsaque', value: 'INTEGER'},
			{key: 'idtransacao', value: 'INTEGER'},
			{key: 'limitesaque', value: 'NUMERIC'}
		],
		'conta' : [
			{key: 'idconta', value: 'INTEGER'},
			{key: 'dataaberturaconta', value: 'DATE'},
			{key: 'saldoconta', value: 'NUMERIC'},
			{key: 'funcionarioconta', value: 'INTEGER'},
			{key: 'idagencia', value: 'INTEGER'},
			{key: 'idcliente', value: 'INTEGER'}
		],
		'cliente' : [
			{key: 'idcliente', value: 'INTEGER'},
			{key: 'nomecliente', value: 'CHARACTER VARYING'},
			{key: 'tipocliente', value: 'CHARACTER VARYING'},
			{key: 'enderecocliente', value: 'INTEGER'}
		],
		'deposito' : [
			{key: 'iddeposito', value: 'INTEGER'},
			{key: 'idtransacao', value: 'INTEGER'},
			{key: 'limitedeposito', value: 'NUMERIC'}
		],
		'transferencia' : [
			{key: 'idtransferencia', value: 'INTEGER'},
			{key: 'idtransacao', value: 'INTEGER'},
			{key: 'tipotransferencia', value: 'CHARACTER VARYING'},
			{key: 'contatransferencia', value: 'INTEGER'}
		],
		'fisica' : [
			{key: 'idfisica', value: 'INTEGER'},
			{key: 'limitefisica', value: 'NUMERIC'},
			{key: 'idcliente', value: 'INTEGER'}
		],
		'debito' : [
			{key: 'iddebito', value: 'INTEGER'},
			{key: 'senhadebito', value: 'NUMERIC'},
			{key: 'idcartao', value: 'INTEGER'}
		],
		'juridica' : [
			{key: 'idjuridica', value: 'INTEGER'},
			{key: 'limitejuridica', value: 'NUMERIC'},
			{key: 'idcliente', value: 'INTEGER'}
		],
		'bandeira' : [
			{key: 'idbandeira', value: 'INTEGER'},
			{key: 'nomebandeira', value: 'CHARACTER VARYING'},
			{key: 'jurosbandeira', value: 'NUMERIC'}
		],
		'custo' : [
			{key: 'idcusto', value: 'INTEGER'},
			{key: 'tipocusto', value: 'CHARACTER VARYING'},
			{key: 'datacusto', value: 'DATE'},
			{key: 'valorcusto', value: 'NUMERIC'},
			{key: 'idcartao', value: 'INTEGER'}
		],
		'notafiscal' : [
			{key: 'idnotafiscal', value: 'INTEGER'},
			{key: 'idcusto', value: 'INTEGER'}
		],
		'cheque' : [
			{key: 'idcheque', value: 'INTEGER'},
			{key: 'dataimpressaocheque', value: 'DATE'},
			{key: 'datavalidadecheque', value: 'DATE'},
			{key: 'idproduto', value: 'INTEGER'}
		],
		'compra' : [
			{key: 'idcompra', value: 'INTEGER'},
			{key: 'idcusto', value: 'INTEGER'}
		],
		'emprestimo' : [
			{key: 'idemprestimo', value: 'INTEGER'},
			{key: 'valoremprestimo', value: 'NUMERIC'},
			{key: 'taxaemprestimo', value: 'NUMERIC'},
			{key: 'dataemprestimo', value: 'DATE'},
			{key: 'idproduto', value: 'INTEGER'}
		],
		'produto' : [
			{key: 'idproduto', value: 'INTEGER'},
			{key: 'tipoproduto', value: 'CHARACTER VARYING'},
			{key: 'idcliente', value: 'INTEGER'}
		],
		'pagamento' : [
			{key: 'idpagamento', value: 'INTEGER'},
			{key: 'tipopagamento', value: 'CHARACTER VARYING'},
			{key: 'idcusto', value: 'INTEGER'},
			{key: 'idtransacao', value: 'INTEGER'}
		],
		'extrato' : [
			{key: 'idextrato', value: 'INTEGER'},
			{key: 'idtransacao', value: 'INTEGER'}
		],
		'credito' : [
			{key: 'idcredito', value: 'INTEGER'},
			{key: 'limitecredito', value: 'NUMERIC'},
			{key: 'senhacredito', value: 'NUMERIC'},
			{key: 'idcartao', value: 'INTEGER'}
		],
		'cartao' : [
			{key: 'idcartao', value: 'INTEGER'},
			{key: 'tipocartao', value: 'CHARACTER VARYING'},
			{key: 'codsegurancacartao', value: 'NUMERIC'},
			{key: 'dataimpressaocartao', value: 'DATE'},
			{key: 'datavalidadecartao', value: 'DATE'},
			{key: 'idproduto', value: 'INTEGER'},
			{key: 'idbandeira', value: 'INTEGER'}
		],
		'fatura' : [
			{key: 'idfatura', value: 'INTEGER'},
			{key: 'datainiciofatura', value: 'DATE'},
			{key: 'datafimfatura', value: 'DATE'},
			{key: 'valorfatura', value: 'NUMERIC'},
			{key: 'idcusto', value: 'INTEGER'}
		]
	};

	if(obj == 'all'){
		return dict[str];
	}else{
		for (i = 0; i < dict[str].length; i++) {
			if (dict[str][i].key == obj) {
				return dict[str][i].value;
			}
		}
	}
}