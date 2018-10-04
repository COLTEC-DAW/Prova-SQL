
-- Questão 01
-- Listar os campeonatos que foram concluídos a mais de dois anos atrás, junto da premiação de cada um.
SELECT nome, data_realizacao, premiacao FROM campeonatos
WHERE data_realizacao < DATE('2016-10-04');

-- Questão 02
-- Listar os tenistas junto de sua categoria.
SELECT t.nome, c.nome FROM tenistas t
JOIN categorias c ON t.categorias_id = c.id;

-- Questão 03
-- Listar o público total de cada quadra.
-- OBS: 4,7,8 não foram populadas
SELECT quadras.id as quadra, SUM(jogos.publico) as publico_total
FROM jogos
JOIN quadras ON jogos.quadras_id = quadras.id
GROUP BY quadras.id;

-- Questão 04
-- Listar, para cada jogo, o nome e a pontuação de cada tenista, além do nome do campeonato e o tipo da quadra
SELECT campeonatos.nome as campeonato,
       quadras.tipo as tipo_quadra,
       tenista1.nome as tenista_01,
       pontuacao_tenista_01 as pontuacao,
       tenista2.nome as tenista_02,
       pontuacao_tenista_02 as pontuacao
FROM jogos
JOIN campeonatos ON jogos.campeonatos_id = campeonatos.id
JOIN quadras ON jogos.quadras_id = quadras.id
JOIN tenistas as tenista1 ON jogos.tenista_01_id = tenista1.id
JOIN tenistas as tenista2 ON jogos.tenista_02_id = tenista2.id;


-- Questão 05
-- Listar quantos jogos cada tenista jogou por campeonato.
SELECT tenista.nome, campeonatos.nome as campeonato, COUNT(campeonatos.id) as qtd_jogos
FROM jogos
JOIN campeonatos ON campeonatos_id = campeonatos.id
JOIN tenistas as tenista ON tenista_01_id = tenista.id OR tenista_02_id = tenista.id
GROUP BY campeonatos.nome, tenista.id;


-- Questão 06
-- Listar o nome, a média de público e a premiação de cada campeonato
SELECT camp.nome, AVG(publico) as media_publico, camp.premiacao
FROM jogos
JOIN campeonatos as camp ON campeonatos_id = camp.id
GROUP BY camp.id;

-- Questão 07
-- Listar quantos jogos cada jogador jogou por ano, ordenada pelo ano de forma descrescente.
SELECT tenista.nome, YEAR(camp.data_realizacao) AS ano, COUNT(camp.id) as jogos
FROM jogos
JOIN campeonatos as camp ON campeonatos_id = camp.id
JOIN tenistas as tenista ON tenista_01_id = tenista.id OR tenista_02_id = tenista.id
GROUP BY tenista.id, ano DESC;

-- Questão 08
-- Listar a média de público em cada quadra nos jogos que ocorreram no ano de 2014, ordenada pelas que tiveram maior média.
SELECT q.id, AVG(publico) as media_publico FROM jogos
JOIN quadras as q ON quadras_id = q.id
JOIN campeonatos as camp ON campeonatos_id = camp.id
WHERE YEAR(camp.data_realizacao) = 2014
GROUP BY q.id
ORDER BY media_publico DESC;


-- Questão 09
-- Listar as tenistas mulheres que ganharam pelo menos 3 jogos.
SELECT tenista.nome, COUNT(tenista.id) as vitorias FROM jogos
JOIN tenistas as tenista ON (tenista_01_id = tenista.id AND pontuacao_tenista_01 > pontuacao_tenista_02)
OR tenista_02_id = tenista.id AND pontuacao_tenista_02 > pontuacao_tenista_01
WHERE tenista.sexo = 0
GROUP BY tenista.id
ORDER BY vitorias DESC LIMIT 1;


-- Questão 10
-- Listar o tenista mais assediado pela torcida (aquele que possui a melhor média de público em seus jogos)
SELECT t.nome, AVG(publico) as media_publico FROM jogos
JOIN tenistas as t ON tenista_01_id = t.id OR tenista_02_id = t.id
GROUP BY t.id
ORDER BY media_publico DESC LIMIT 1;


-- Questão EXTRA
-- Listar o nome e a quantidade de vitórias do tenista mais vitorioso na história de todos os campeonatos (1,0).
-- Não consegui terminar :/
SELECT campeonatos.nome, tenista.nome as maior_campeão, COUNT(tenista.id) as vitorias FROM jogos
JOIN campeonatos ON campeonatos_id = campeonatos.id
JOIN tenistas as tenista ON (tenista_01_id = tenista.id AND pontuacao_tenista_01 > pontuacao_tenista_02)
OR tenista_02_id = tenista.id AND pontuacao_tenista_02 > pontuacao_tenista_01
GROUP BY campeonatos.id
ORDER BY vitorias DESC;
