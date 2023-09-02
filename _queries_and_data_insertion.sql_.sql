
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
     