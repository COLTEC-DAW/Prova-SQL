-- 1 --
SELECT nome, premiacao 
FROM campeonatos 
WHERE data_realizacao < DATE_SUB(NOW(), INTERVAL 2 YEAR);


-- 2 --
SELECT t.nome Tenista, c.nome Categoria
FROM tenistas t
JOIN categorias c ON t.categorias_id = c.id;

-- 3 --
SELECT q.id, SUM( j.publico ) 
FROM quadras q
JOIN jogos j ON q.id = j.quadras_id
GROUP BY q.id;

-- 4 --
SELECT t1.nome Tenista_01, j.pontuacao_tenista_01 Pontuacao_01, t2.nome Tenista_02, j.pontuacao_tenista_02 Pontuacao_02, c.nome Categoria, q.tipo Quadra
FROM jogos j
JOIN tenistas t1 ON j.tenista_01_id = t1.id
JOIN tenistas t2 ON j.tenista_02_id = t2.id
JOIN campeonatos c ON j.campeonatos_id = c.id
JOIN quadras q ON j.quadras_id = q.id;


-- 5 --
SELECT t.nome, COUNT( j.tenista_01_id ) num_jogos
FROM tenistas t
JOIN jogos j ON j.tenista_01_id = t.id
OR j.tenista_02_id = t.id
GROUP BY t.nome;

-- 6 --
SELECT c.nome, c.data_realizacao, AVG( j.publico ) media, c.premiacao
FROM campeonatos c
JOIN jogos j ON c.id = j.campeonatos_id
GROUP BY c.nome, c.data_realizacao;

-- 7 --
SELECT t.nome, YEAR( c.data_realizacao ) ano, COUNT( j.tenista_01_id ) num_jogos
FROM tenistas t
JOIN jogos j ON j.tenista_01_id = t.id
OR j.tenista_02_id = t.id
JOIN campeonatos c ON j.campeonatos_id = c.id
GROUP BY t.nome, YEAR( c.data_realizacao ) DESC ;

-- 8 --
SELECT q.id, AVG( j.publico ) media
FROM quadras q
JOIN jogos j ON q.id = j.quadras_id
JOIN campeonatos c ON c.id = j.campeonatos_id
WHERE YEAR( c.data_realizacao ) =2014
GROUP BY q.id
ORDER BY media DESC;

-- 9 --
SELECT t.nome
FROM tenistas AS t
JOIN jogos AS j ON ( t.id = j.tenista_01_id
AND j.pontuacao_tenista_01 > j.pontuacao_tenista_02 ) 
OR (
t.id = j.tenista_02_id
AND j.pontuacao_tenista_02 > j.pontuacao_tenista_01
)
WHERE t.sexo =0
GROUP BY t.nome
HAVING COUNT( j.pontuacao_tenista_01 ) >2;

-- 10 --
SELECT nome, MAX( media ) 
FROM (

SELECT t.nome nome, AVG( j.publico ) media
FROM tenistas AS t
JOIN jogos AS j ON t.id = j.tenista_01_id
OR t.id = j.tenista_02_id
GROUP BY t.nome
ORDER BY media DESC
) AS max_avg;


-- 11 --
SELECT nome, MAX( jogos_ganhos ) 
FROM (

SELECT t.nome nome, COUNT( j.tenista_01_id ) jogos_ganhos
FROM tenistas AS t
JOIN jogos AS j ON ( t.id = j.tenista_01_id
AND j.pontuacao_tenista_01 > j.pontuacao_tenista_02 ) 
OR (
t.id = j.tenista_02_id
AND j.pontuacao_tenista_02 > j.pontuacao_tenista_01
)
GROUP BY t.nome
ORDER BY jogos_ganhos DESC
) AS max_avg;