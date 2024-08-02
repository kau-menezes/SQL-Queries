CREATE DATABASE db_da_kau;

USE db_da_kau;

CREATE TABLE tb_Aprendizes (

	IDAprendiz INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(30), 
    Data_Nascimento DATETIME
    

) DEFAULT CHARSET UTF8;

SELECT * FROM tb_Aprendizes;

INSERT INTO tb_Aprendizes VALUES 
	(DEFAULT, "Cristian Cardoso", "2006-04-29"),
    (DEFAULT, "Matias Zuniga", "2004-11-28"), 
    (DEFAULT, "Eduardo Ribeiro", "2004-11-13"),
    (DEFAULT, "Mumu Saladino", "2002-11-08");
    
SELECT 
	A.Nome AS Aprendizes_de_Novembro, 
    A.Data_Nascimento
    
FROM tb_Aprendizes AS A 

WHERE MONTH(A.Data_Nascimento) = "11";

CREATE TABLE tb_Turma (
	IDTurma INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(30)

) DEFAULT CHARSET UTF8;

ALTER TABLE tb_Aprendizes 
ADD COLUMN Turma INT,
ADD FOREIGN KEY (Turma) REFERENCES tb_Turma(IDTurma);

INSERT INTO tb_Turma VALUES (DEFAULT, "Soluções Digitais 2");

UPDATE tb_Aprendizes SET Turma = 1 WHERE tb_Aprendizes.IDAprendiz >= 0;