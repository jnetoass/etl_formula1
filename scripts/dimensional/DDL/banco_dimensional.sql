/* CRIAÇÃO DO BANCO DIMENSIONAL */
CREATE DATABASE DW_F1;
USE DW_F1;

/* CRIAÇÃO DAS DIMENSÕES DO
   DATA WAREHOUSE
   FORMULA ANALITICYS ONE
 */

/* CRIAÇÃO DIMENSÃO CIRCUITOS */
CREATE TABLE dim_circuitos (
    id_dim_circuito INTEGER PRIMARY KEY AUTO_INCREMENT,
    code_circuito INTEGER NOT NULL,
    ref_circuito VARCHAR(100) NOT NULL,
    nome_circuito VARCHAR(100) NOT NULL,
    localizacao_circuito VARCHAR(100) NOT NULL,
    pais_circuito varchar (50) NOT NULL,
    lat VARCHAR (50),
    lng VARCHAR (50)
);

/* CRIAÇÃO DIMENSÃO CORRIDAS */
CREATE TABLE dim_corridas (
    id_dim_corrida INTEGER PRIMARY KEY AUTO_INCREMENT,
    code_corrida INTEGER NOT NULL,
    ref_circuito VARCHAR(100),
    location_circuito VARCHAR(50),
    nome_gp VARCHAR(50) NOT NULL,
    data_gp DATE NOT NULL,
    horario_gp TIME NOT NULL,
    temporada VARCHAR(10) NOT NULL,
    rodada INTEGER NOT NULL
);

/* CRIAÇÃO DIMENSÃO CONSTRUTORES */
CREATE TABLE dim_construtores (
    id_dim_construtor INTEGER PRIMARY KEY AUTO_INCREMENT,
    code_construtor INTEGER NOT NULL,
    nome_construtor VARCHAR(50) NOT NULL,
    fabricante_motor VARCHAR(50) NOT NULL, 
    nacionalidade_construtor VARCHAR(50) NOT NULL
);

/* CRIAÇÃO DIMENSÃO PILOTOS */
CREATE TABLE dim_pilotos (
    id_dim_piloto INTEGER PRIMARY KEY AUTO_INCREMENT,
    code_piloto INTEGER NOT NULL,
    ref_piloto VARCHAR(50) NOT NULL,
    abr_piloto VARCHAR(5) NOT NULL,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

/* CRIAÇÃO DIMENSÃO TEMPO */

CREATE TABLE dim_tempo (
	id_dim_tempo INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_corrida DATE not NULL,
	dia_do_mes INTEGER NOT NULL,
	mes_do_ano INTEGER NOT NULL,	
	ano INTEGER NOT NULL,
	dia_do_ano INTEGER NOT NULL,
    semana_do_ano INTEGER NOT NULL,
    nome_dia VARCHAR(10),
    nome_mes VARCHAR(10)
);

/* CRIAÇÃO FATO RESULTADOS */
CREATE TABLE fato_resultados (
    id_dim_construtor INTEGER NOT NULL,
    id_dim_piloto INTEGER NOT NULL,
    id_dim_corrida INTEGER NOT NULL,
    id_dim_circuito INTEGER NOT NULL,
    id_dim_tempo INTEGER NOT NULL,
    temporada VARCHAR(10) NOT NULL,
    pontos_ganhos INTEGER NOT NULL,
    qtd_voltas INTEGER NOT NULL,
    grid INTEGER NOT NULL,
    ordem_posicao INTEGER NOT NULL,
    ranking INTEGER,
    volta_rapida INTEGER,
    tempo_de_volta VARCHAR(50),
    tempo_volta_rapida VARCHAR(50),
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_dim_construtor) REFERENCES dim_construtores (id_dim_construtor),
    FOREIGN KEY (id_dim_piloto) REFERENCES dim_pilotos (id_dim_piloto),
    FOREIGN KEY (id_dim_circuito) REFERENCES dim_circuitos (id_dim_circuito),
    FOREIGN KEY (id_dim_corrida) REFERENCES dim_corridas (id_dim_corrida),
    FOREIGN KEY (id_dim_tempo) REFERENCES dim_tempo (id_dim_tempo)
);
