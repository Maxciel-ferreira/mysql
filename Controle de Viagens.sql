CREATE DATABASE `controle-viagens`;

USE `controle-viagens`;

CREATE TABLE `viajantes`(
`Nºsolicitacao` varchar(06) primary key not null,
`passageiros` 	 varchar(250),
`ida`	 varchar(150),
`dataEmbarque`	 varchar(10),
`volta`	 varchar(150),
`dataDesembarque`varchar(10)

);

CREATE TABLE `tarifa`(
`ID_Tarifa` integer PRIMARY KEY auto_increment,
`valorBilhete` 	 decimal(7,2),
`valorTaxaAdm`	 decimal(7,2),
`categoriaBilhete` varchar(150),
`Nºsolicitacao` varchar(06),
CONSTRAINT fk_SolTarifa FOREIGN KEY (Nºsolicitacao) REFERENCES viajantes (Nºsolicitacao)
);

CREATE TABLE `responsavel_Pagamento`(
`ID_ResPagamanento` integer PRIMARY KEY auto_increment,
`centroDeCusto`  varchar(08),
`ContaContabil`  varchar(10),
`GestorResponsavel` varchar(150),
`ConfereGestor`varchar(03),
`Nºsolicitacao` varchar(06),
CONSTRAINT fk_SolResPagamento FOREIGN KEY (Nºsolicitacao) REFERENCES viajantes (Nºsolicitacao)
);

/*POPULAR BANCO*/

/*VIAJANTES*/
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255234,"MAXCIEL DA LUZ FERREIRA DA COSTA","NAVEGANTES","2021-02-10","RIO DE JANEIRO","2021-03-17");
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255235,"JOSE ALVES","CURITIBA","2020-02-10","FRANKFURT","2020-03-10");
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255236,"CARLA GONÇALVES","GUARULHOS","2021-01-02","RIO DE JANEIRO","2021-01-13");
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255237,"DEBORA TIRONI","PORTO ALEGRE","2021-03-10","RIO DE JANEIRO","2021-03-14");
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255238,"KATIA ELEN","MANAUS","2021-02-09","GUARULHOS","2021-02-12");
INSERT INTO `viajantes` (`Nºsolicitacao`,`passageiros`,`ida`,`dataEmbarque`,`volta`,`dataDesembarque`) VALUES (255239,"VINICIUS COSTA","JOINVILLE","2021-03-10","CONGONHAS","2021-03-14");

/*TARIFA*/
SELECT * FROM `tarifa`;

INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(585,45,"ECONOMICA",255234);
INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(1534,45,"ECONOMICA",255235);
INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(28234,45,"EXECUTIVA",255236);
INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(753,45,"ECONOMICA",255237);
INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(841,45,"ECONOMICA",255238);
INSERT INTO `tarifa` (`valorBilhete`,`valorTaxaAdm`,`categoriaBilhete`,`Nºsolicitacao`) VALUES(33214,45,"EXECUTIVA",255239);

/*responsavel_Pagamento*/

INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100214,411075001,"ELCIO MADRUGA",255234);
INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100215,411075002,"ELCIO MADRUGA",255235);
INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100216,411075001,"CARLOS MIGUEL",255236);
INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100214,411075001,"IVETE NUNES",255237);
INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100217,411075003,"CATIA MEDEIROS",255238);
INSERT INTO `responsavel_Pagamento` (`centroDeCusto`,`ContaContabil`,`GestorResponsavel`,`Nºsolicitacao`) VALUES(90100217,411075003,"EDUARDO BARROS",255239);


/*CONSULTAS*/

/*RETORNO PASSAGEIROS E SUAS CATEGORIAS*/
SELECT passageiros, categoriaBilhete
FROM viajantes
INNER JOIN tarifa
ON viajantes.Nºsolicitacao = tarifa.Nºsolicitacao;


/*GASTO POR GESTOR*/

SELECT GestorResponsavel, SUM(valorBilhete), SUM(valorTaxaAdm)
FROM responsavel_Pagamento
INNER JOIN tarifa
ON responsavel_Pagamento.Nºsolicitacao = tarifa.Nºsolicitacao
group by GestorResponsavel;

/*RETORNO POR PASSAGEIROS QUE GASTARAM MAIS QUE R$ 800,00*/

SELECT passageiros,valorBilhete, valorTaxaAdm
FROM viajantes
INNER JOIN tarifa
ON viajantes.Nºsolicitacao = tarifa.Nºsolicitacao
WHERE valorBilhete > 800
ORDER BY valorBilhete desc;

/*GASTO DOS BILHETES COM VOLTA DO RIO DE JANEIRO*/

SELECT categoriaBilhete, valorBilhete, valorTaxaAdm,volta
FROM tarifa
INNER JOIN viajantes
ON tarifa.Nºsolicitacao = viajantes.Nºsolicitacao
WHERE volta = 'RIO DE JANEIRO'
ORDER BY valorBilhete desc;

/*GASTO POR CONTA CONTABIL*/

SELECT ContaContabil, SUM(valorBilhete), SUM(valorTaxaAdm)
FROM responsavel_Pagamento
INNER JOIN tarifa
ON responsavel_Pagamento.Nºsolicitacao = tarifa.Nºsolicitacao
WHERE valorBilhete>20000
GROUP BY ContaContabil;

SELECT viajantes.passageiros, viajantes.ida, viajantes.volta, tarifa.valorBilhete, tarifa.valorTaxaAdm, responsavel_Pagamento.GestorResponsavel
FROM viajantes, tarifa, responsavel_Pagamento
WHERE viajantes.Nºsolicitacao = tarifa.Nºsolicitacao AND viajantes.Nºsolicitacao = responsavel_Pagamento.Nºsolicitacao
order by valorBilhete desc;




/*CRIAÇÃO DE TRIGGER PARA VALIDAR A CONFERENCIA DE VALOR GASTO*/

CREATE TABLE conferencia (
idConferencia INT NOT NULL primary KEY auto_increment,
Gestor VARCHAR(45) NULL,
`Nºsolicitacao` varchar(06),
CONSTRAINT fk_Conferencia FOREIGN KEY (Nºsolicitacao) REFERENCES viajantes (Nºsolicitacao)
);



/*DESPESAS JÁ CONFERIDAS PELO GESTOR*/

SELECT viajantes.Nºsolicitacao,viajantes.passageiros, viajantes.ida, viajantes.volta, tarifa.valorBilhete, tarifa.valorTaxaAdm, responsavel_Pagamento.GestorResponsavel,responsavel_Pagamento.ConfereGestor
FROM viajantes, tarifa, responsavel_Pagamento
WHERE viajantes.Nºsolicitacao = tarifa.Nºsolicitacao AND viajantes.Nºsolicitacao = responsavel_Pagamento.Nºsolicitacao AND responsavel_Pagamento.ConfereGestor = "SIM"
order by valorBilhete desc;


