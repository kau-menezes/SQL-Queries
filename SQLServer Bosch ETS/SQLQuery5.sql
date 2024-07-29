--USE Aula

-- ------------------------------------		UMA COISA		------------------------------------

-- ATUALIZAR VALOR DE UMA LINHA:

--UPDATE Evento 
--	SET DtHrInicio = '16/07/2024 08:00', 
--		DtHrFim = '16/07/2024 10:00'
--	WHERE IDEvento = '414BDC9NB11N'

--SELECT 
--	E.IDEvento,
--	E.Descricao as 'Nome do Evento', 
--	CONVERT(varchar(10), E.DtHrInicio, 103) as 'Data início', 
--	CONVERT(varchar(5), E.DtHrInicio, 108) as 'Hora início', 
--	CONVERT(varchar(10), E.DtHrInicio, 103) as 'Data fim', 
--	CONVERT(varchar(5), E.DtHrFim, 108) as 'Hora Fim', 
--	S.Nome as 'Nome da Sala'

--FROM Evento as E
--LEFT JOIN Sala as S
--on E.IDSala = S.IDSala

--WHERE GETDATE() BETWEEN DtHrInicio AND DtHrFim

-- BETWEEN NA MÃO:

--WHERE CONVERT(varchar(5), E.DtHrInicio, 108) < CONVERT(varchar(5), GETDATE(), 108) AND
--CONVERT(varchar(5), E.DtHrFim, 108) > CONVERT(varchar(5), GETDATE(), 108) AND
--CONVERT(varchar(10), E.DtHrInicio, 103) <= CONVERT(varchar(10), GETDATE(), 103) AND
--CONVERT(varchar(10), E.DtHrFim, 103) >= CONVERT(varchar(10), GETDATE(), 103)

--WHERE MONTH(CONVERT(varchar(10), E.DtHrInicio, 103)) > MONTH(GETDATE()) -- DEU CERTO POR CAUSA DO MÊS QUE ERA MAIOR

-- ------------------------------------		OTA COISA	------------------------------------

--SELECT TOP 3
--	S.Nome, 
--	S.Capacidade

--FROM Sala as S
--ORDER BY Capacidade DESC

-- ------------------------------------		OTA COISA	------------------------------------
--SELECT 
--	P.Nome as 'Nome do Responsável',
--	E.Descricao as 'Nome do Evento',
--	CONVERT(varchar(10), E.DtHrInicio, 103) as 'Data', 
--	S.Nome as 'Sala'
--FROM Evento as E
--	LEFT JOIN Sala as S ON E.IDSala = S.IDSala 
--	LEFT JOIN EventoPessoa as EP ON E.IDEvento = EP.IDEvento
--	LEFT JOIN Pessoa as P ON EP.IDPessoa = P.IDPessoa 
--WHERE EP.PapelEvento = 'Responsavel'

-- ------------------------------------		OTA COISA	------------------------------------

--SELECT 
--	S.Nome as 'Sala',
--	E.Descricao as 'Reunião', 
--	CONVERT(varchar(10), E.DtHrInicio, 103) as 'Data', 
--	CONVERT(varchar(12), DATEADD(MINUTE, DATEDIFF(MINUTE, E.DtHrInicio, E.DtHrFim), 0),  114)  as 'Duração da Reunião'

--FROM Evento as E
--	RIGHT JOIN Sala as S ON E.IDSala = S.IDSala 
	
-- ------------------------------------		OTA COISA	------------------------------------

--SELECT
--	P.Nome,
--	COUNT(EP.IDPessoa) as 'Qtd. Eventos'
	
--FROM EventoPessoa as EP 
--	RIGHT JOIN Pessoa as P ON EP.IDPessoa = P.IDPessoa

--GROUP BY P.Nome

--ORDER BY 'Qtd. Eventos' DESC
	
-- ------------------------------------		JOIN!	------------------------------------

--SELECT 
--	E.IDEvento,
--	E.Descricao,
--	S.Nome, 
--	S.Capacidade,
--	COUNT(EP.IDEvento) as 'Participantes na Reunião',

--	CASE WHEN
--		COUNT('Participantes na Reunião') > S.Capacidade THEN 'Ultrapassou o limite'
--		ELSE 'Limite OK'
--	END AS 'Avaliação da Capacidade'
	
--FROM Sala as S
--	RIGHT JOIN Evento as E ON S.IDSala = E.IDSala
--	LEFT JOIN EventoPessoa as EP on E.IDEvento = EP.IDEvento

--GROUP BY E.IDEvento, E.Descricao, S.Nome, S.Capacidade

-- ------------------------------------		WHERE	------------------------------------

--SELECT 
--	E.Descricao,
--	EQ.Nome

--FROM Evento as E
--	LEFT JOIN EventoEquipamento as EE ON E.IDEvento= EE.IDEvento
--	LEFT JOIN Equipamento as EQ ON EE.IDEquipamento = EQ.IDEquipamento

--	WHERE EE.IDEquipamento IN

--	(SELECT
--		EQ.IDEquipamento

--	FROM Equipamento as EQ

--	WHERE EQ.Tipo IN ('Informatica', 'Multimidia'))

-- ------------------------------------		SUB SELECT	------------------------------------

--SELECT
--E.Descricao,
--S.Capacidade,
--COUNT(EP.IDPessoa) AS 'Presentes'
--FROM Evento E
--INNER JOIN EventoPessoa EP
--ON E.IDEvento = EP.IDEvento
--INNER JOIN Sala S
--ON S.IDSala = E.IDSala
--GROUP BY E.IDEvento, S.Capacidade, EP.Presenca, E.Descricao

--HAVING
--COUNT(EP.IDPessoa) <= S.Capacidade AND
--EP.Presenca = 1 AND
--E.IDEvento IN
--(
--SELECT
--E.IDEvento
--FROM Evento E
--INNER JOIN EventoPessoa EP
--ON E.IDEvento = EP.IDEvento
--INNER JOIN Sala S
--ON S.IDSala = E.IDSala
--GROUP BY E.IDEvento, S.Capacidade
--HAVING COUNT(EP.IDPessoa) > S.Capacidade
--)

-- ------------------------------------		FUNÇÕES		------------------------------------


--CREATE FUNCTION fEventoAntigo (@Valor Varchar(20))
--RETURNS TABLE AS
--RETURN
--(
--	SELECT TOP 1
--		E.Descricao AS 'Evento',
--		S.Nome AS 'Sala',
--		COUNT(EP.IDPessoa) AS 'Qtd Pessoas',
--		Convert(Varchar(10), E.DtHrInicio, 103) AS 'Data de Início',
--		Convert(Varchar(10), E.DtHrInicio, 108) AS 'Hora Início'
--	FROM Evento E
--	INNER JOIN Sala S
--	ON S.IDSala = E.IDSala
--	INNER JOIN EventoPessoa EP
--	ON EP.IDEvento = E.IDEvento
--	WHERE E.Descricao LIKE @Valor+'%'
--	GROUP BY E.Descricao, S.Nome, E.DtHrInicio
--	ORDER BY E.DtHrInicio
--)

---- Verificando os dados
--SELECT * FROM fEventoAntigo('Aula')

-- ------------------------------------		FUNÇÕES		------------------------------------
