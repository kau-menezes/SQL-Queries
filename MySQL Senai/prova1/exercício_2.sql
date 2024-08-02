CREATE DATABASE ex1_prova;

USE ex1_prova;

CREATE TABLE Livro (
	
	IDLivro INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Titulo VARCHAR(30) NOT NULL, 
    Autor VARCHAR(30) NOT NULL, 
    ISBN VARCHAR(20) NOT NULL,
    Genero VARCHAR(15)
);

CREATE TABLE Cliente (
	
    IDCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR(30) NOT NULL, 
    CPF VARCHAR(15) NOT NULL, 
    Email VARCHAR(30) NOT NULL
);

CREATE TABLE Funcionario (

	IDFuncionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Email_Corporativo VARCHAR(30), 
    IDCliente INT NOT NULL, 
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)

);

CREATE TABLE Aluno (

	IDFuncionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Curso VARCHAR(20), 
    IDCliente INT NOT NULL, 
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)

);

CREATE TABLE Emprestimo (

	IDEmprestimo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    IDLivro INT NOT NULL, 
    IDFuncionario INT NOT NULL, 
    IDCliente INT NOT NULL, 
    Data_Emprestimo DATETIME NOT NULL, 
    Data_Devolucao_Prevista DATETIME NOT NULL,
	FOREIGN KEY (IDLivro) REFERENCES Livro(IDLivro), 
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario), 
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)

);

CREATE TABLE Devolucao (

	IDDevolucao INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    IDLivro INT NOT NULL, 
	IDEmprestimo INT NOT NULL,
    IDFuncionario INT NOT NULL,
    Data_Devolucao DATETIME NOT NULL, 
    FOREIGN KEY (IDLivro) REFERENCES Livro(IDLivro), 
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario), 
    FOREIGN KEY (IDEmprestimo) REFERENCES Emprestimo(IDEmprestimo)

);



