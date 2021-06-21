/* SCRIPT CRIAÇÃO DO BANCO DE DADOS */
CREATE DATABASE FORMULA1;
USE FORMULA1;

/* SCRIPT CRIAÇÃO DA TABELA CONSTRUTOR */

CREATE TABLE construtores (
    id_construtor INTEGER,
    nome_construtor VARCHAR (50) NOT NULL,
    nacionalidade_construtor VARCHAR (50),
    PRIMARY KEY (id_construtor)
);

/* SCRIPT CRIAÇÃO DA TABELA TEMPORADA */
CREATE TABLE temporadas (
    ano INTEGER PRIMARY KEY
);

/* SCRIPT CRIAÇÃO DA TABELA PILOTO */
CREATE TABLE pilotos (
    id_piloto INTEGER PRIMARY KEY,
    ref_piloto VARCHAR (50) NOT NULL,
    code_piloto VARCHAR (5),
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    nacionalidade_piloto VARCHAR (50)
);

/* SCRIPT CRIAÇÃO DA TABELA CIRCUITO */
CREATE TABLE circuitos (
    id_circuito INTEGER PRIMARY KEY,
    ref_circuito VARCHAR (100) NOT NULL,
    nome_circuito VARCHAR (100) NOT NULL,
    location_circuito VARCHAR (100) NOT NULL,
    pais_circuito VARCHAR (50),
    lat VARCHAR NOT NULL (50),
    lng VARCHAR NOT NULL (50)
);

/* INCLUSÃO DAS COLUNAS LATITUDE E LONOGETUDE */
ALTER TABLE circuitos ADD lat varchar(50);
ALTER TABLE circuitos ADD lng varchar(50); 

/* SCRIPT CRIAÇÃO DA TABELA CIRCUITO */
CREATE TABLE status (
    id_status INTEGER PRIMARY KEY,
    descricao_status VARCHAR(50) NOT NULL
);

/* SCRIPT CRIAÇÃO DA TABELA CORRIDAS */
CREATE TABLE corridas (
    id_corrida INTEGER,
    ano_corrida INTEGER NOT NULL,
    rodada INTEGER NOT NULL,
    id_circuito INTEGER NOT NULL,
    nome_corrida VARCHAR(100) NOT NULL,
    data_corrida DATE NOT NULL,
    horario_corrida TIME,
    PRIMARY KEY (id_corrida),
    FOREIGN KEY (ano_corrida) REFERENCES temporadas (ano),
    FOREIGN KEY (id_circuito) REFERENCES circuitos (id_circuito)
);

/* SCRIPT CRIAÇÃO DA TREINOS_CLASSIFICATORIOS */
CREATE TABLE classificacao (
    id_classificacao INTEGER,
    id_corrida INTEGER NOT NULL,
    id_piloto INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    posicao INTEGER,
    q1 VARCHAR(50),
    q2 VARCHAR(50),
    q3 VARCHAR(50),
    PRIMARY KEY (id_classificacao),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto),
    FOREIGN KEY (id_construtor) REFERENCES construtores (id_construtor)
);

/* SCRIPT CRIAÇÃO DA TABELA RESULTADOS */

CREATE TABLE resultados (
    id_resultado INTEGER,
    id_corrida INTEGER NOT NULL,
    id_piloto INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    grid INTEGER NOT NULL,
    posicao INTEGER,
    texto_posicao VARCHAR (10) NOT NULL,
    ordem_posicao INTEGER NOT NULL,
    pontos FLOAT NOT NULL,
    voltas INTEGER NOT NULL,
    tempo VARCHAR (50),
    milisegundos INTEGER,
    voltarapida INTEGER,
    ranking INTEGER,
    tempo_volta VARCHAR(50),
    tempo_voltarapida VARCHAR(50),
    id_status INTEGER NOT NULL,
    PRIMARY KEY (id_resultado),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto),
    FOREIGN KEY (id_construtor) REFERENCES construtores (id_construtor),
    FOREIGN KEY (id_status) REFERENCES status (id_status)
);

/* SCRIPT CRIAÇÃO DA TABELA PIT STOP */

CREATE TABLE pitstop (
    id_corrida INTEGER,
    id_piloto INTEGER,
    parada INTEGER,
    volta INTEGER NOT NULL,
    tempo TIME NOT NULL,
    duracao VARCHAR(50),
    milisegundos INTEGER,
    PRIMARY KEY (id_corrida, id_piloto, parada),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto)
);

/* SCRIPT CRIAÇÃO DA TABELA LAP TIME */

CREATE TABLE laptime (
    id_corrida INTEGER,
    id_piloto INTEGER NOT NULL,
    lap INTEGER NOT NULL,
    posicao INTEGER,
    tempo VARCHAR(50),
    milisegundos INTEGER,
    PRIMARY KEY (id_corrida, id_piloto, lap),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES pilotos (id_piloto)
);

/* SCRIPT CRIAÇÃO DA TABELA CAMPEONATO DE PILOTOS */
CREATE TABLE campeonato_pilotos (
    id_campeonato_pilotos INTEGER,
    id_corrida INTEGER NOT NULL,
    id_piloto INTEGER NOT NULL,
    pontos FLOAT NOT NULL,
    posicao INTEGER,
    texto_posicao VARCHAR(50),
    wins INTEGER NOT NULL,
    PRIMARY KEY (id_campeonato_pilotos),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN key (id_piloto) REFERENCES pilotos (id_piloto)
);

/* SCRIPT CRIAÇÃO DA TABELA CAMPEONATO DE CONSTRUTORES */
CREATE TABLE campeonato_construtores (
    id_campeonato_construtores INTEGER,
    id_corrida INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    pontos FLOAT NOT NULL,
    posicao INTEGER,
    texto_posicao VARCHAR(50),
    wins INTEGER NOT NULL,
    PRIMARY KEY (id_campeonato_construtores),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN key (id_construtor) REFERENCES construtores (id_construtor)
);

/* SCRIPT CRIAÇÃO DA TABELA RESULTADO DOS CONSTRUTORES */
CREATE TABLE resultado_construtores (
    id_resultado_construtor INTEGER,
    id_corrida INTEGER NOT NULL,
    id_construtor INTEGER NOT NULL,
    pontos FLOAT,
    status VARCHAR(50),
    PRIMARY KEY (id_resultado_construtor),
    FOREIGN KEY (id_corrida) REFERENCES corridas (id_corrida),
    FOREIGN KEY (id_construtor) REFERENCES construtores (id_construtor)
);