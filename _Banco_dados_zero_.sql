-- criação do banco de dados para o cenário de um Curso
create database banco_dados_zero;
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
  PRIMARY KEY (idFormas_Pagamentos),
  UNIQUE INDEX Tipo_Pagamento_UNIQUE (Tipo_Pagamento ASC) VISIBLE,
  UNIQUE INDEX id_UNIQUE (id ASC) VISIBLE);
  
-- criar tabela cartão de crédito
CREATE TABLE IF NOT EXISTS Cartao_Credito (
  idCartao_Credito INT NOT NULL AUTO_INCREMENT COMMENT 'id do cartão chave primária tipo auto incremento.',
  Nome VARCHAR(45) NOT NULL COMMENT 'Nome do Titular do cartão.\n',
  Numero VARCHAR(15) NOT NULL COMMENT 'Número do cartão - deve ser do tipo único.',
  Bandeira VARCHAR(45) NOT NULL COMMENT 'Bandeira - visa, master etc...',
  Data_Validade DATE NOT NULL COMMENT 'Data de validade',
  fk_idAluno INT NOT NULL COMMENT 'Chave estrangeira do id do aluno.',
  PRIMARY KEY (idCartao_Credito),
  UNIQUE INDEX Numero_UNIQUE (Numero ASC) VISIBLE,
  UNIQUE INDEX id_UNIQUE (id ASC) VISIBLE,
  INDEX fk_Pagamentos_Aluno1_idx (fk_idAluno ASC) VISIBLE,
  CONSTRAINT fk_Pagamentos_Aluno1
  FOREIGN KEY (fk_idAluno)
  REFERENCES banco_dados_zero.Alunos (idAluno)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Registro_Presenca(
    idTurma int not null,
    idAluno int not null,
    idSituacao int not null,
    Data_Presenca date not null,
    Data_Cadastro date not null,
    Login_Cadastro varchar(15) not null
);
-- Turmas x Alunos
ALTER TABLE Turmas
     ADD CONSTRAINT fk_TurmasAlunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_Aluno);
 
 -- Turmas x Cursos
ALTER TABLE Turmas
     ADD CONSTRAINT fk_TurmasCursos FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);
     
-- Reg.Pres. x Turmas
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPTurmas FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);
     
-- Reg.Pres. x Alunos
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPAlunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);
     
-- Reg.Pres. x Situação
ALTER TABLE Registro_Presença 
     ADD CONSTRAINT fk_RPSituacao FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);
