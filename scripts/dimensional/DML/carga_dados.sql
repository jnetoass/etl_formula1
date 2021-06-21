USE formula1;
/* CARGA DE DADOS DIM_CIRCUITOS */

INSERT INTO dw_f1.dim_circuitos (code_circuito, ref_circuito, nome_circuito, localizacao_circuito, pais_circuito, lat, lng)
SELECT id_circuito, ref_circuito, nome_circuito, location_circuito, pais_circuito, lat, lng
FROM formula1.circuitos;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_PILOTOS*/
INSERT INTO dw_f1.dim_pilotos (code_piloto, ref_piloto, abr_piloto, primeiro_nome, ultimo_nome, nacionalidade, data_nascimento)
SELECT id_piloto, ref_piloto, code_piloto, primeiro_nome, ultimo_nome, nacionalidade_piloto, nascimento
FROM formula1.pilotos;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CORRIDAS*/
INSERT INTO dw_f1.dim_corridas (code_corrida, nome_gp, ref_circuito, data_gp, horario_gp, temporada, rodada)
SELECT id_corrida, nome_corrida, cir.ref_circuito, data_corrida,
horario_corrida, ano_corrida, rodada FROM formula1.corridas cor
INNER JOIN formula1.circuitos cir ON cor.id_circuito = cir.id_circuito;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_CONSTRUTORES*/
INSERT INTO dw_f1.dim_construtores (code_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor)
SELECT id_construtor, nome_construtor, fabricante_motor, nacionalidade_construtor from formula1.construtores;

/*SCRIPT PARA POPULAR A TABELA_DIMENSÃO_TEMPO*/
INSERT INTO dw_f1.dim_tempo (data_corrida, dia_do_mes, mes_do_ano, ano, dia_do_ano, semana_do_ano, nome_dia, nome_mes)
SELECT data_corrida, day(data_corrida), month(data_corrida), year(data_corrida),
		dayofyear(data_corrida), weekofyear(data_corrida), dayname(data_corrida), monthname(data_corrida)
FROM formula1.corridas;

/* CARGA DA TABELA FATO */ 
INSERT INTO dw_f1.fato_resultados (id_dim_construtor, id_dim_piloto, id_dim_corrida, id_dim_circuito, id_dim_tempo,
							 temporada, pontos_ganhos, qtd_voltas, grid, ordem_posicao, ranking, volta_rapida,
                             tempo_de_volta, tempo_volta_rapida, status)
select con.id_dim_construtor, pil.id_dim_piloto, cor.id_dim_corrida, cir.id_dim_circuito, tmp.id_dim_tempo, cor.temporada, pontos, voltas, grid, ordem_posicao,
	   ranking, voltarapida, tempo_volta, tempo_voltarapida, s1.descricao_status
from formula1.resultados r1
inner join dw_f1.dim_construtores con on r1.id_construtor = con.code_construtor
inner join dw_f1.dim_pilotos pil on r1.id_piloto = pil.code_piloto
inner join dw_f1.dim_corridas cor on r1.id_corrida = cor.code_corrida
inner join dw_f1.dim_circuitos cir on cor.ref_circuito = cir.ref_circuito
inner join dw_f1.dim_tempo tmp on cor.data_gp = tmp.data_corrida
inner join formula1.status s1 on r1.id_status = s1.id_status;