/* ATRIBUTOS TEMPORAIS PARA DIMENSÃO TEMPO */
SELECT 	data_corrida, day(data_corrida), month(data_corrida), year(data_corrida),
		dayofyear(data_corrida), week(data_corrida), weekday(data_corrida), weekofyear(data_corrida), dayname(data_corrida),
        monthname(data_corrida),  quarter(data_corrida) as trimestre
FROM formula1.corridas;