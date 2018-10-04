--EX1--
SELECT nome, premiacao
FROM campeonatos
WHERE data_realizacao < '2016-10-03';

--EX2--
SELECT tenistas.nome, categorias.nome
FROM tenistas
JOIN categorias ON tenistas.categorias_id = categorias.id

--EX3--
SELECT quadras.id, quadras.endereco, SUM( jogos.publico )
FROM quadras
JOIN jogos ON jogos.quadras_id = quadras.id
GROUP BY quadras.id

--EX4--
SELECT T1.nome, T2.nome, jogos.pontuacao_tenista_01, jogos.pontuacao_tenista_02, campeonatos.nome, quadras.tipo
FROM jogos
JOIN tenistas AS T1 ON T1.id = jogos.tenista_01_id
JOIN tenistas AS T2 ON T2.id = jogos.tenista_02_id
JOIN quadras ON jogos.quadras_id = quadras.id
JOIN campeonatos ON jogos.campeonatos_id = campeonatos.id

--EX5--
SELECT T1.nome, campeonatos.nome, COUNT( T1.id )
FROM jogos
JOIN tenistas AS T1 ON T1.id = jogos.tenista_01_id
OR T1.id = jogos.tenista_02_id
JOIN campeonatos ON jogos.campeonatos_id = campeonatos.id
GROUP BY jogos.campeonatos_id, T1.nome;

--EX6--
SELECT nome, AVG( publico ) , premiacao
FROM campeonatos
JOIN jogos ON campeonatos.id = jogos.campeonatos_id
GROUP BY campeonatos.id

--EX7--
SELECT T1.nome, campeonatos.data_realizacao, COUNT( T1.id )
FROM jogos
JOIN tenistas AS T1 ON T1.id = jogos.tenista_01_id
OR T1.id = jogos.tenista_02_id
JOIN campeonatos ON jogos.campeonatos_id = campeonatos.id
GROUP BY campeonatos.data_realizacao, T1.nome
ORDER BY `campeonatos`.`data_realizacao` DESC

--EX8--
SELECT quadras.endereco, AVG( jogos.publico )
FROM quadras
JOIN jogos ON quadras.id = jogos.quadras_id
JOIN campeonatos ON jogos.campeonatos_id = campeonatos.id
WHERE campeonatos.data_realizacao
BETWEEN "2014-01-01"
AND "2014-12-31"
GROUP BY quadras.id
ORDER BY AVG( jogos.publico ) DESC

--EX9--
SELECT T1.nome, COUNT(T1.id)
FROM jogos
JOIN tenistas AS T1
ON T1.id = jogos.tenista_01_id AND jogos.pontuacao_tenista_01>jogos.pontuacao_tenista_02
OR T1.id = jogos.tenista_02_id AND jogos.pontuacao_tenista_02>jogos.pontuacao_tenista_01
WHERE T1.sexo = 0
GROUP BY T1.nome
HAVING COUNT(T1.id) >= 3

--EX10--
SELECT T1.nome, AVG( publico )
FROM jogos
JOIN tenistas AS T1 ON T1.id = jogos.tenista_01_id
OR T1.id = jogos.tenista_02_id
GROUP BY T1.id
ORDER BY AVG( publico ) DESC
