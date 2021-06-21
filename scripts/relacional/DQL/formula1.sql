-- CONSULTA COMBINANDO TABELAS
select * from resultados inner join corridas on resultados.id_corrida = corridas.id_corrida;



select id_resultado, nome_corrida, ultimo_nome, id_construtor, numero, grid, ordem_posicao, pontos, ranking, data_corrida, ano_corrida, rodada
from resultados
inner join corridas on resultados.id_corrida = corridas.id_corrida
inner join pilotos on resultados.id_piloto = pilotos.id_piloto;

select id_resultado, nome_corrida, ultimo_nome, nome_construtor, nacionalidade_construtor, numero, grid, ordem_posicao,
pontos, ranking, rodada, data_corrida, ano_corrida as temporada
from resultados
inner join corridas on resultados.id_corrida = corridas.id_corrida
inner join pilotos on resultados.id_piloto = pilotos.id_piloto
inner join construtores on resultados.id_construtor = construtores.id_construtor;