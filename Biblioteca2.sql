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
    FOREIGN KEY (matricula) REFERENCES Usuario(matricula)
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
    FOREIGN KEY (codigo) REFERENCES Sessao(codigo)
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

1. Inserir 5 registros em cada tabela

-- Inserir usuários
INSERT INTO Usuario (matricula, nome, email, endereco, telefone) VALUES
(1234, 'Pedro Bacelar', 'pedro@exemplo.com', 'Rua A', '1234-5678'),
(5678, 'Ana Souza', 'ana@exemplo.com', 'Rua B', '2345-6789'),
(9101, 'Carlos Silva', 'carlos@exemplo.com', 'Rua C', '3456-7890'),
(1121, 'Maria Oliveira', 'maria@exemplo.com', 'Rua D', '4567-8901'),
(3141, 'João Pereira', 'joao@exemplo.com', 'Rua E', '5678-9012');

-- Inserir sessões
INSERT INTO Sessao (codigo, descricao, localizacao) VALUES
('S001', 'Ficção', 'Bloco A'),
('S002', 'Tecnologia', 'Bloco B'),
('S003', 'História', 'Bloco C'),
('S004', 'Ciência', 'Bloco D'),
('S005', 'Arte', 'Bloco E');

-- Inserir livros
INSERT INTO Livro (codigo, titulo, autor, codigo_sessao) VALUES
('L001', 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'S001'),
('L002', 'Java para Iniciantes', 'Herbert Schildt', 'S002'),
('L003', 'História do Brasil', 'Boris Fausto', 'S003'),
('L004', 'Física Moderna', 'David Halliday', 'S004'),
('L005', 'Pintura no Renascimento', 'Erwin Panofsky', 'S005');

-- Inserir empréstimos
INSERT INTO Emprestimo (codigo, data_hora, matricula_usuario, data_devolucao) VALUES
('E001', '2025-05-01 10:00', 1234, '2025-05-15'),
('E002', '2025-05-02 11:00', 5678, '2025-05-16'),
('E003', '2025-05-03 12:00', 9101, '2025-05-17'),
('E004', '2025-05-04 13:00', 1121, '2025-05-18'),
('E005', '2025-05-05 14:00', 3141, '2025-05-19');

-- Inserir registros de empréstimos de livros
INSERT INTO Livro_emprestimo (codigo_livro, codigo_emprestimo) VALUES
('L001', 'E001'),
('L002', 'E002'),
('L003', 'E003'),
('L004', 'E004'),
('L005', 'E005');

2. Informar o nome de todos os usuários do Sistema Biblioteca

SELECT nome FROM Usuario;

3. Informar a(s) data e horário(s) que o usuário 'Pedro Bacelar' emprestou livros

SELECT E.data_hora
FROM Emprestimo E
JOIN Usuario U ON E.matricula_usuario = U.matricula
WHERE U.nome = 'Pedro Bacelar';

4. Informar o nome de todos os livros que estão emprestados

SELECT L.titulo
FROM Livro L
JOIN Livro_emprestimo LE ON L.codigo = LE.codigo_livro
JOIN Emprestimo E ON LE.codigo_emprestimo = E.codigo
WHERE E.data_devolucao > CURRENT_DATE;

5. Informar o número de livros de cada sessão

SELECT S.descricao, COUNT(L.codigo) AS num_livros
FROM Sessao S
LEFT JOIN Livro L ON S.codigo = L.codigo_sessao
GROUP BY S.descricao;

6. Excluir os empréstimos do aluno chamado 'Pedro Bacelar'

DELETE FROM Emprestimo
WHERE matricula_usuario = (SELECT matricula FROM Usuario WHERE nome = 'Pedro Bacelar');

7. Excluir todos os livros emprestados na data de 22/05/2025

DELETE FROM Livro_emprestimo
WHERE codigo_emprestimo IN (
    SELECT E.codigo
    FROM Emprestimo E
    WHERE E.data_hora = '2025-05-22'
);

8. Atualizar a data de devolução do livro emprestado no dia 10/05/2025 para o dia 25/05/2025

UPDATE Emprestimo
SET data_devolucao = '2025-05-25'
WHERE data_hora = '2025-05-10';

9. Informar todos os dados dos livros de 'Banco de Dados', 'Algoritmos' e 'Estrutura de Dados'
Usando IN:
SELECT *
FROM Livro
WHERE titulo IN ('Banco de Dados', 'Algoritmos', 'Estrutura de Dados');
Usando WHERE com LIKE:
SELECT *
FROM Livro
WHERE titulo LIKE '%Banco de Dados%'
   OR titulo LIKE '%Algoritmos%'
   OR titulo LIKE '%Estrutura de Dados%';

10. Mostrar o nome dos usuários que retiraram livros emprestados entre as datas de 01/04/2025 a 31/04/2025

SELECT U.nome
FROM Usuario U
JOIN Emprestimo E ON U.matricula = E.matricula_usuario
WHERE E.data_hora BETWEEN '2025-04-01' AND '2025-04-30';

11. Informar o nome dos autores dos livros que tenham no título a palavra 'Python', não importando se é no início ou final do título

SELECT DISTINCT L.autor
FROM Livro L
WHERE L.titulo LIKE '%Python%';




	
