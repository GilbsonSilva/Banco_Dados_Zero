-- criação do banco de dados para o cenário de um Curso
create database if not exists banco_dados_zero;
use banco_dados_zero;

-- criar tabela Alunos
  CREATE TABLE IF NOT EXISTS Alunos(
  idAluno INT NOT NULL AUTO_INCREMENT COMMENT 'id do aluno é do tipo único e auto incrementável.',
  Nome varchar(200) NOT NULL,
  Data_Nascimento date NOT NULL,
  Sexo varchar(1) NULL, -- M para Masculino ou F para Feminino
  Data_Cadastro datetime NOT NULL,
  Login_Cadastro varchar(15) NOT NULL, 
  Endereco VARCHAR(100) NOT NULL COMMENT 'Endereço do aluno, campo deve ser obrigatório.',
  Telefone VARCHAR(15) NOT NULL COMMENT 'Telefone do aluno, o campo deve ser do tipo caractare e obrigatório.',
  CPF char(11),
   constraint unique_CPF_Aluno unique (CPF),
  PRIMARY KEY (idAluno)
);

-- criar tabela Situação
CREATE TABLE IF NOT EXISTS Situacao (
  idSituacao INT NOT NULL AUTO_INCREMENT COMMENT 'id de Situação é do tipo único e auto incrementável.',
  OrderStatus enum('Presença Confirmada','Ausencia Confirmada','Ausencia Sem Confirmação'),
  Data_Cadastro datetime,
  Login_Cadastro varchar(15),
  PRIMARY KEY (idSituacao)
);

-- criar tabela Turmas
CREATE TABLE IF NOT EXISTS Turmas (
    idTurma INT NOT NULL AUTO_INCREMENT COMMENT 'id de Turma - auto incremento e chave primaria.',
    id_Aluno int NOT NULL,
    id_Curso int NOT NULL,
    Data_Inicio date not null,
    Data_Termino date,
    Data_Cadastro datetime not null,
    Login_Cadastro varchar(15),
    PRIMARY kEY(idTurma)
);

-- criar tabela Cursos
CREATE TABLE IF NOT EXISTS Cursos (
     idCurso INT NOT NULL AUTO_INCREMENT COMMENT 'id do Curso é do tipo único e auto incrementável.',
     Nome_Curso varchar(200) not null,
     Data_Cadastro datetime not null,
     Login_Cadastro varchar(15) not null,
     Valor_Curso numeric(15,2) not null,
     desconto numeric(3,2) not null,
     PRIMARY KEY(idCurso)
);

-- criar tabela Formas_Pagamentos
CREATE TABLE IF NOT EXISTS Formas_Pagamentos (
  idFormas_Pagamentos INT NOT NULL AUTO_INCREMENT COMMENT 'Id da Formas de pagamentos, chave primária auto incremento.',
  Tipo_Pagamento VARCHAR(45) NOT NULL DEFAULT 'Pix' COMMENT 'Tipo de Pagamento. Padrão Pix.\nex: Cartão, Boleto, Débito.',
  PRIMARY KEY (idFormas_Pagamentos)
);
  
-- criar tabela cartão de crédito
CREATE TABLE IF NOT EXISTS Cartao_Credito (
  idCartao_Credito INT NOT NULL AUTO_INCREMENT COMMENT 'id do cartão chave primária tipo auto incremento.',
  Nome VARCHAR(45) NOT NULL COMMENT 'Nome do Titular do cartão.\n',
  Numero VARCHAR(15) NOT NULL COMMENT 'Número do cartão - deve ser do tipo único.',
  Bandeira VARCHAR(45) NOT NULL COMMENT 'Bandeira - visa, master etc...',
  Data_Validade DATE NOT NULL COMMENT 'Data de validade',
  fk_idAluno INT NOT NULL COMMENT 'Chave estrangeira do id do aluno.',
  PRIMARY KEY (idCartao_Credito)
);

CREATE TABLE IF NOT EXISTS Registro_Presenca(
    idTurma INT NOT NULL,
    idAluno INT NOT NULL,
    idSituacao INT NOT NULL,
    Data_Presenca DATE NOT NULL,
    Data_Cadastro DATE NOT NULL,
    Login_Cadastro VARCHAR(15) NOT NULL
);

-- Turmas x Alunos
ALTER TABLE Turmas
     ADD CONSTRAINT fk_TurmasAlunos FOREIGN KEY (idAluno) REFERENCES Alunos (idAluno);
 
 -- Turmas x Cursos
ALTER TABLE Turmas
     ADD CONSTRAINT fk_TurmasCursos FOREIGN KEY (idCurso) REFERENCES Cursos (idCurso);
     
-- Reg.Pres. x Turmas
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPTurmas FOREIGN KEY (idTurma) REFERENCES Turmas (idTurma);
     
-- Reg.Pres. x Alunos
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPAlunos FOREIGN KEY (idAluno) REFERENCES Alunos (idAluno);
     
-- Reg.Pres. x Situação
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPSituacao FOREIGN KEY (idSituacao) REFERENCES Situacao (idSituacao);


QUERYS E CONSULTAS SQL
-- show database;
use banco_dados_zero;
show tables;

-- 1 inserindo registros na tabela Alunos --
INSERT INTO Alunos(Nome,Data_Nascimento,Sexo,Data_Cadastro,Login_Cadastro,Endereco,Telefone,CPF) VALUES
	 (1,'Francisco José Abreu','1989/04/09','M','2020/02/14 16:00:00','Chico','Rua AAA','(88)1111-1111','11111111111'),
     (2,'Janaina ALves Silva','1990/09/04','F','2021/05/23 10:00:00','Jana','Rua BBB','(86)2222-2222','22222222222'),
     (3,'Alex Silva Sousa','1991/08/03','M','2022/10/30 09:00:00','Alex','Rua CCC','(86)2121-2121','22222211111'),
     (4,'Bruna Raquel Silva','1992/04/29','F','2021/09/28 09:30:00','Bruna','Rua CCC','(86)2121-2222','11111133333'),
     (5,'Lia Raquel Sampaio','1995/06/23','F','2022/05/18 10:00:00','Lia','(86)2222-1717','33333332222'),
     (6,'Pedro Sampaio Abreu','1991/09/12','M','2020/05/28 08:30:00','Pedro','(86)2323-2222','33333344444'),
     (7,'Carol Silva Santos','1989/02/29','F','2022/03/28 15:00:00','Carol','(86)2327-2425','33333323421'),
     (8,'Jéssica Santos Silva','1992/02/29','F', '2018/04/28 09:40:00','Jéssica','(86)2726-2526','67656722222'),
     (9,'Gustavo Antônio Silva','1994/09/26','M','2022/09/18 10:50:00','Gustavo','(78)2329-2926','32345785999'),
     (10,'Joana Lima Santos','1985/07/19','F','2022/06/13 11:00:00','Joana','(78)2342-2347','76543298765');

INSERT INTO Situacao(Orderstatus,Data_Cadastro,Login_Cadastro) VALUES
	 ('Presença Confirmada','2020/02/14 16:00:00','Chico'),
     ('Presença Confirmada','2021/05/23 10:00:00','Jana'),
     ('Presença Confirmada','2022/10/30 09:00:00','Alex'),
     ('Ausencia Confirmada','2021/09/28 09:30:00','Bruna'),
     ('Presença Confirmada','2022/05/18 10:00:00','Lia'),
     ('Presença Confirmada','2020/05/28 08:30:00','Pedro'),
     ('Presença Confirmada','2022/03/28 15:00:00','Carol'),
     ('Presença Confirmada','2018/04/28 09:40:00','Jéssica'),
     ('Presença Confirmada','2022/09/18 10:50:00','Gustavo'),
     ('Ausencia sem Confirmação','2022/06/13 11:00:00','Joana');
     
INSERT INTO Turmas (id_Aluno,id_Curso,Data_Inicio,Data_Termino,Data_Cadastro,Login_Cadastro) VALUES
     (1,1,'2023/07/23','2023/08/14','2020/02/14 16:00:00','Chico'),
     (2,2,'2023/05/21','2023/07/12','2021/05/23 10:00:00','Jana'),
     (3,3,'2023/09/23','2023/11/21','2022/10/30 09:00:00','Alex'),
     (4,4,'2023/05/23','2023/09/28','2023/09/28 09:30:00','Bruna'),
     (5,5,'2023/02/12','2023/04/13','2022/05/18 10:00:00','Lia'),
     (6,4,'2023/03/24','2023/05/28','2020/05/28 08:30:00','Pedro'),
     (7,2,'2023/05/29','2023/07/21','2022/03/28 15:00:00','Carol'),
     (8,3,'2023/09/22','2023/11/22','2018/04/28 09:40:00','Jéssica'),
     (9,5,'2023/03/09','2023/05/23','2022/09/18 10:50:00','Gustavo'),
     (10,1,'2023/01/13','2023/03/23','2022/06/13 11:00:00','Joana');
     
INSERT INTO Cursos (Nome_Curso,Data_Cadastro,Login_Cadastro,Valor_Curso,Desconto) VALUES
	 ('Biologia','2020/02/14 16:00:00','Chico', 500.00, 50.00),
     ('Física','2021/05/23 10:00:00','Jana', 450.00,30.00),
     ('Matemática','2022/10/30 09:00:00','Alex', 600.00, 60.00),
     ('Química','2021/09/28 09:30:00','Bruna', 470.00, 20.00),
     ('História','2022/05/18 10:00:00','Lia', 400.00, 10.00),
     ('Biologia','2020/05/28 08:30:00','Pedro', 500.00, 50.00),
     ('História','2022/03/28 15:00:00','Carol', 400.00, 10.00),
     ('Química','2018/04/28 09:40:00','Jéssica', 470.00, 20.00),
     ('Matemática','2022/09/18 10:50:00','Gustavo', 600.00, 60.00),
     ('Física','2022/06/13 11:00:00','Joana', 450.00,30.00);

INSERT INTO Formas_Pagamentos(Tipo_Pagamento) VALUES
     ('Crédito'),
     ('Débito'),
     ('Dinheiro'),
     ('Pix');
     
INSERT INTO Cartao_Credito(Nome,Numero,Bandeira,Data_Validade,fk_idAluno) VALUES
	 ('Francisco José Abreu','111111123','Visa','2025/02/12','1'),
     ('Janaina ALves Silva','862223422','Mastercard','2027/09/12','2'),
     ('Alex Silva Sousa','8621212121','Credicard','2025/04/24','3'),
     ('Bruna Raquel Silva','8521212222','Credishop','2026/03/29','4'),
     ('Lia Raquel Sampaio','892222171','Hipercard','2024/12/21','5'),
     ('Pedro Sampaio Abreu','8223232222','Visa','2028/10/28','6'),
     ('Carol Silva Santos','1989022312','Mastercard', '2025/12/19','7'),
     ('Jéssica Santos Silva','1993022911','Credishop','2028/12/13','8'),
     ('Gustavo Antônio Silva','19940926','Hipercard','2026/10/22','9'),
     ('Joana Lima Santos','1985071911','Visa','2026/11/28','10');
     
INSERT INTO Registro_Presenca(idTurma,idAluno,IdSituacao,Data_Presenca,Data_Cadastro,Login_cadastro) VALUES
     (1,1,'Presença Confirmada','2023/07/24','2020/02/14 16:00:00','Chico'),
     (2,2,'Presença Confirmada','2023/07/12','2021/05/23 10:00:00','Jana'),
     (3,3,'Presença Confirmada','2023/09/23','2022/10/30 09:00:00','Alex'),
     (4,4,'Ausencia Confirmada','2023/09/28','2021/09/28 09:30:00','Bruna'),
     (5,5,'Presença Confirmada','2023/04/13','2022/05/18 10:00:00','Lia'),
     (6,6,'Presença Confirmada','2023/05/29','2020/05/28 08:30:00','Pedro'),
     (7,7,'Presença Confirmada','2023/07/23','2022/03/28 15:00:00','Carol'),
     (8,8,'Presença Confirmada','2023/11/23','2018/04/28 09:40:00','Jéssica'),
     (9,9,'Presença Confirmada','2023/05/06','2022/09/18 10:50:00','Gustavo'),
     (10,10,'Ausencia sem Confirmação','2023/06/14','2022/06/13 11:00:00','Joana');



BANCO DE DADOS REFINADO

Use banco_dados_zero;
SELECT count(*) from alunos;
select distinct concat(Nome' ',Data_Nascimento,' ',Sexo) as Aluno from alunos;

-- Nome do Aluno, Endereco,CPF de todos os alunos do sexo Feminino.
SELECT Nome, Endereco, CPF
FROM Alunos
WHERE sexo = 'F';

-- Informe todos os alunos que realizaram alguma ordem com cartão de crédito.
SELECT
    CONCAT(cl.Nome) AS aluno,
    c.Numero AS cartao,
    c.Bandeira AS Bandeira,
    p.Data AS Data_Pedido,
    p.Status,
    p.Descricao AS descrição,
    p.Numero_Pagamento
FROM
    pedidos p
         JOIN
	Cartao_Credito c ON p.fk_idAluno = c.fk_idAluno
        AND p.fk_idCartao_Credito = c.id
        JOIN
	Alunos cl ON cl.idAlunos = c.fk_idAluno;
