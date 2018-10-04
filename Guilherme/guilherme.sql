-- ex 1
SELECT * FROM campeonatos WHERE DATE(data_realizacao) < DATE_SUB(NOW(),INTERVAL 2 YEAR);

--ex 2
SELECT tenistas.nome AS nome, categorias.Nome AS categoria FROM tenistas
INNER JOIN categorias ON tenistas.categorias_id = categorias.id;

--ex 3
SELECT quadras.Tipo, quadras.Endereco, SUM(publico) AS publicoTotal FROM jogos
INNER JOIN quadras ON jogos.quadras_id = quadras.id
GROUP BY quadras.id;

--ex 4
SELECT t1.nome AS nomeTenista1, t2.nome AS nomeTenista2, jogos.pontuacao_tenista_01 AS pontuacaoTenista1, jogos.pontuacao_tenista_02 AS pontuacaoTenista2, campeonatos.Nome AS nomeCampeonato, quadras.tipo AS tipoDaQuadra FROM jogos
INNER JOIN tenistas AS t1 ON t1.id = jogos.tenista_01_id
INNER JOIN tenistas AS t2 ON t2.id = jogos.tenista_02_id
INNER JOIN campeonatos ON  jogos.campeonatos_id = campeonatos.id
INNER JOIN quadras ON jogos.quadras_id = quadras.id;

--ex 5
SELECT tenistas.nome, COUNT(jog.campeonatos_id) AS numJogos , camp.nome AS campeonato, camp.edicao AS edicaoDoCampeonato FROM tenistas
INNER JOIN jogos AS jog ON jog.tenista_01_id = tenistas.id OR jog.tenista_02_id = tenistas.id
INNER JOIN campeonatos AS camp ON camp.id = jog.campeonatos_id
GROUP BY tenistas.id, camp.id;

--ex 6
SELECT nome, AVG(jogos.publico) AS media, premiacao FROM campeonatos
INNER JOIN jogos ON jogos.campeonatos_id = campeonatos.id
GROUP BY campeonatos.id;

--ex 7 (refazer)
SELECT tenistas.nome, COUNT(tenistas.id) AS numJogos, YEAR(camp.data_realizacao) AS ano FROM tenistas
INNER JOIN jogos AS jog ON jog.tenista_01_id = tenistas.id OR   jog.tenista_02_id = tenistas.id
INNER JOIN campeonatos AS camp ON camp.id = jog.campeonatos_id
GROUP BY tenistas.id ORDER BY YEAR(camp.data_realizacao) DESC;

--ex 8
SELECT quadras.endereco, quadras.tipo, IFNULL(AVG(publico),0) AS mediaPublico, camp.data_realizacao FROM jogos
INNER JOIN campeonatos AS camp ON jogos.campeonatos_id = camp.id
RIGHT JOIN quadras ON jogos.quadras_id = quadras.id
GROUP BY quadras.id
HAVING YEAR(camp.data_realizacao ) = '2014'
ORDER BY AVG(publico) DESC;

--ex 9
SELECT tenistas.nome, COUNT(tenistas.id) AS numJogos, tenistas.sexo FROM tenistas
INNER JOIN jogos AS jog ON jog.tenista_01_id = tenistas.id OR   jog.tenista_02_id = tenistas.id
INNER JOIN campeonatos AS camp ON camp.id = jog.campeonatos_id
GROUP BY tenistas.id
HAVING tenistas.sexo = 0 AND numJogos >= 3;
