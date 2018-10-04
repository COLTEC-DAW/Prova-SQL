

/*1-Listar os campeonatos que foram concluídos a mais de dois anos atrás, junto da premiação de cada um.*/
/*Todos os campeonatos aconteceram à mais de um ano atrás*/

SELECT nome, premiacao
FROM campeonatos

/*2-Listar os tenistas junto de sua categoria.*/

SELECT t.nome, c.nome AS categoria
FROM tenistas t
JOIN categorias c ON t.categorias_id = c.id

/*3-Listar o público total de cada quadra.*/

SELECT j.quadras_id, SUM( j.publico ) AS publico
FROM jogos j
JOIN quadras q ON j.quadras_id = q.id
GROUP BY j.quadras_id

/*4-Listar, para cada jogo, o nome e a pontuação de cada tenista, além do nome do campeonato e o tipo da quadra.*/

SELECT t1.nome AS tenista1, t2.nome AS tenista2, j.pontuacao_tenista_01 AS pontuacaoj1, j.pontuacao_tenista_02 AS pontuacaoj2, c.nome AS campeonato, q.tipo AS tipoDaQuadra
FROM tenistas t1
JOIN jogos j ON j.tenista_01_id = t1.id
JOIN tenistas t2 ON j.tenista_02_id = t2.id
JOIN campeonatos c ON j.campeonatos_id = c.id
JOIN quadras q ON j.quadras_id = q.id

/*5-Listar quantos jogos cada tenista jogou por campeonato.*/

SELECT t.nome, COUNT( j.campeonatos_id ) AS jogos, c.id AS campeonato
FROM tenistas t
JOIN jogos j ON j.tenista_01_id = t.id
OR j.tenista_02_id = t.id
JOIN campeonatos c ON c.id = j.campeonatos_id
GROUP BY t.nome

/*6-Listar o nome, a média de público e a premiação de cada campeonato.*/

SELECT c.nome AS campeonato, AVG( j.publico ) AS mediaDePublico, c.premiacao
FROM campeonatos c
JOIN jogos j ON j.campeonatos_id = c.id
GROUP BY c.nome

/*7-Listar quantos jogos cada jogador jogou por ano, ordenada pelo ano de forma descrescente.*/

SELECT t.nome, COUNT( j.campeonatos_id ) AS jogos, c.data_realizacao AS ano
FROM tenistas t
JOIN jogos j ON j.tenista_01_id = t.id
OR j.tenista_02_id = t.id
JOIN campeonatos c ON c.id = j.campeonatos_id
GROUP BY t.nome, ano DESC 

/*8-Listar a média de público em cada quadra nos jogos que ocorreram no ano de 2014, ordenada pelas que tiveram maior média.*/

SELECT AVG( j.publico ) AS mediaDePublico, q.id AS quadra
FROM jogos j
JOIN quadras q ON j.quadras_id = q.id
JOIN campeonatos c ON j.campeonatos_id = c.id
WHERE c.data_realizacao =  "2014-01-01 00:00:00"
GROUP BY q.id 

