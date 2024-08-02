CREATE DATABASE ex6_prova;

USE ex6_prova;

CREATE TABLE Usuario (

	IDUsuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR(30), 
    Cargo INT,
    Criador INT, 
    foreign key (Criador) REFERENCES Usuario(IDUsuario), 
    foreign key (Cargo) REFERENCES Cargo(IDCargo)
);

CREATE TABLE Cargo (

	IDCargo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR(20)

);

CREATE TABLE Perfil (
	
    IDPerfil INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    IPerfil VARCHAR(20)

);

CREATE TABLE PerfisCargo (

	IDPerfilCargo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    IDCargo INT, 
    IDPerfil INT,
	foreign key (IDPerfil) REFERENCES Perfil(IDPerfil), 
    foreign key (IDCargo) REFERENCES Cargo(IDCargo)

);

CREATE TABLE PermissãoHereditaria(

	IDPermissaoHereditaria INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    IDUsuario INT, 
    Perfil_Permitido INT,
	foreign key (Perfil_Permitido) REFERENCES Perfil(IDPerfil), 
    foreign key (IDUsuario) REFERENCES Usuario(IDUsuario)

);

CREATE TABLE Requisicao(

	IDRequisicao INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Solicitante INT, 
    Criador INT,
    Perfil_Solicitado INT,
	foreign key (Perfil_Solicitado) REFERENCES Perfil(IDPerfil), 
    foreign key (Solicitante) REFERENCES Usuario(IDUsuario),
    foreign key (Criador) REFERENCES Usuario(IDUsuario)

);























