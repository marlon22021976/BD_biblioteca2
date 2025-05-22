CREATE TABLE Usuario(
	matricula integer not null,
	nome char(50) not null,
	email char(50) not null,
	endereco char(80) not null,
	telefone char(20) not null,
	primary key (matricula));

INSERT INTO Usuario (matricula, nome, email, endereco, telefone)
VALUES (0121, 'Marlon', 'marlon@gmail.com', 'Rua XV', '9865-6523'),
(0147, 'Viviane', 'viviane@gmail.com', 'Rua Goiaba', '87451236'),
(0258, 'Vinícius', 'vini@gmail.com', 'Rua Azul', '9988-5522');

CREATE TABLE Sessao(
	codigo char(50) not null,
	descricao char(50) not null,
	localizacao char(50) not null,
	primary key (codigo));

INSERT INTO Sessao(codigo, descricao, localizacao)
VALUES ('A123', 'fantasia', 'Bloco B'),
('A136', 'ciências', 'Bloco F'),
('A196', 'saúde', 'Bloco A1');


CREATE TABLE Emprestimo(
	codigo char(50) not null,
	data_hora char(50) not null,
	matricula_usuario char(50) not null,
	data_devolução char(80) not null,
	primary key (codigo));

INSERT INTO Emprestimo (codigo, data_hora, matricula_usuario, data_devolução)
VALUES ('NN12', '22/02/2025_15:30', 2369, '25/02/2025'),
('NN56', '10/03/2025_8:00', 4578, '15/03/2025'),
('NM77', '01/04/2025_16:45', 3557, '07/05/2025_10:00');

CREATE TABLE Livro(
	codigo char(50) not null,
	titulo char(50) not null,
	autor char(50) not null,
	codigo_sessao char(80) not null,
	primary key (codigo));

INSERT INTO Livro (codigo, titulo, autor, codigo_sessao)
VALUES ('789D', 'A zebra', 'Paulinho da Viola', '12A12'),
('658T', 'Palavra', 'José', '89A11'),
('254A', 'Sabadou!', 'Ricardão', '33S11');

CREATE TABLE Livro_emprestimo(
	codigo_livro char(50) not null,
	codigo_emprestimo char(50) not null,
	foreign key (codigo_livro) references Livro (codigo),
	foreign key (codigo_emprestimo) references Emprestimo (codigo));

INSERT INTO Livro_emprestimo (codigo_livro, codigo_emprestimo)
VALUES ('789D', 'NN12'),
('658T', 'NN56'),
('254A', 'NM77');

----------------------------------------------

select * from Emprestimo


SELECT nome
FROM usuario
INNER JOIN emprestimo ON usuario.matricula::text = emprestimo.codigo;



CREATE TABLE Usuario(
	matricula integer not null,
	nome char(50) not null,
	email char(50) not null,
	endereco char(80) not null,
	telefone char(20) not null,
	primary key (matricula));

INSERT INTO Usuario (matricula, nome, email, endereco, telefone)
VALUES (0121, 'Marlon', 'marlon@gmail.com', 'Rua XV', '9865-6523'),
(0147, 'Viviane', 'viviane@gmail.com', 'Rua Goiaba', '87451236'),
(0258, 'Vinícius', 'vini@gmail.com', 'Rua Azul', '9988-5522');

CREATE TABLE Sessao(
	codigo char(50) not null,
	descricao char(50) not null,
	localizacao char(50) not null,
	primary key (codigo));

INSERT INTO Sessao(codigo, descricao, localizacao)
VALUES ('A123', 'fantasia', 'Bloco B'),
('A136', 'ciências', 'Bloco F'),
('A196', 'saúde', 'Bloco A1');


CREATE TABLE Emprestimo(
	codigo char(50) not null,
	data_hora char(50) not null,
	matricula_usuario char(50) not null,
	data_devolução char(80) not null,
	primary key (codigo));

ALTER TABLE Emprestimo
ADD CONSTRAINT fk_usuario
FOREIGN KEY (matricula)
REFERENCES Usuario(matricula);

INSERT INTO Emprestimo (codigo, datahora, matricula, datadevolucao)
VALUES ('NN12', '22/02/2025_15:30', 0121, '25/02/2025'),
('NN56', '10/03/2025_8:00', 0147, '15/03/2025'),
('NM77', '01/04/2025_16:45', 0258, '07/05/2025_10:00');

ALTER TABLE Emprestimo
ALTER COLUMN datahora SET DATA TYPE varchar USING datahora::varchar;

ALTER TABLE Emprestimo
ALTER COLUMN datadevolucao SET DATA TYPE varchar USING datadevolucao::varchar;


CREATE TABLE Livro(
	codigo char(50) not null,
	titulo char(50) not null,
	autor char(50) not null,
	codigo_sessao char(80) not null,
	primary key (codigo));

ALTER TABLE Livro
ADD CONSTRAINT fk_sessao
FOREIGN KEY (codigo)
REFERENCES sessao(codigo);

INSERT INTO Livro (codigo, titulo, autor, codigosessao)
VALUES ('789D', 'A zebra', 'Paulinho da Viola', '12A12'),
('658T', 'Palavra', 'José', '89A11'),
('254A', 'Sabadou!', 'Ricardão', '33S11');

CREATE TABLE Livro_emprestimo(
	codigo_livro char(50) not null,
	codigo_emprestimo char(50) not null,
	foreign key (codigo_livro) references Livro (codigo),
	foreign key (codigo_emprestimo) references Emprestimo (codigo));

INSERT INTO Livro_emprestimo (codigo_livro, codigo_emprestimo)
VALUES ('789D', 'NN12'),
('658T', 'NN56'),
('254A', 'NM77');

--------------------------------------------------

-- Tabela Usuario
CREATE TABLE Usuario (
    matricula INTEGER NOT NULL,
    nome CHAR(50) NOT NULL,
    email CHAR(50) NOT NULL,
    endereco CHAR(80) NOT NULL,
    telefone CHAR(20) NOT NULL,
    PRIMARY KEY (matricula)
);

INSERT INTO Usuario (matricula, nome, email, endereco, telefone)
VALUES 
(2369, 'Marlon', 'marlon@gmail.com', 'Rua XV', '9865-6523'),
(4578, 'Viviane', 'viviane@gmail.com', 'Rua Goiaba', '87451236'),
(3557, 'Vinícius', 'vini@gmail.com', 'Rua Azul', '9988-5522');

-- Tabela Sessao
CREATE TABLE Sessao (
    codigo CHAR(50) NOT NULL,
    descricao CHAR(50) NOT NULL,
    localizacao CHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

INSERT INTO Sessao (codigo, descricao, localizacao)
VALUES 
('12A12', 'fantasia', 'Bloco B'),
('89A11', 'ciências', 'Bloco F'),
('33S11', 'saúde', 'Bloco A1');

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
    codigo CHAR(50) NOT NULL,
    data_hora CHAR(50) NOT NULL,
    matricula_usuario INTEGER NOT NULL,
    data_devolução CHAR(80) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (matricula_usuario) REFERENCES Usuario(matricula)
);

INSERT INTO Emprestimo (codigo, data_hora, matricula_usuario, data_devolução)
VALUES 
('NN12', '22/02/2025_15:30', 2369, '25/02/2025'),
('NN56', '10/03/2025_8:00', 4578, '15/03/2025'),
('NM77', '01/04/2025_16:45', 3557, '07/05/2025_10:00');

-- Tabela Livro
CREATE TABLE Livro (
    codigo CHAR(50) NOT NULL,
    titulo CHAR(50) NOT NULL,
    autor CHAR(50) NOT NULL,
    codigo_sessao CHAR(80) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_sessao) REFERENCES Sessao(codigo)
);

INSERT INTO Livro (codigo, titulo, autor, codigo_sessao)
VALUES 
('789D', 'A zebra', 'Paulinho da Viola', '12A12'),
('658T', 'Palavra', 'José', '89A11'),
('254A', 'Sabadou!', 'Ricardão', '33S11');

-- Tabela Livro_emprestimo (relacionamento N:N entre Livro e Emprestimo)
CREATE TABLE Livro_emprestimo (
    codigo_livro CHAR(50) NOT NULL,
    codigo_emprestimo CHAR(50) NOT NULL,
    FOREIGN KEY (codigo_livro) REFERENCES Livro (codigo),
    FOREIGN KEY (codigo_emprestimo) REFERENCES Emprestimo (codigo)
);

INSERT INTO Livro_emprestimo (codigo_livro, codigo_emprestimo)
VALUES 
('789D', 'NN12'),
('658T', 'NN56'),
('254A', 'NM77');

	


	
