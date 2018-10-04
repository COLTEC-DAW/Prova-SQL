use federacao_tenis;

select tenistas.nome, count(tenistas.id) from tenistas
join jogos on (tenistas.id = jogos.tenista_01_id and jogos.pontuacao_tenista_01 > jogos.pontuacao_tenista_02) or (tenistas.id = jogos.tenista_02_id and jogos.pontuacao_tenista_02 > jogos.pontuacao_tenista_01)
group by tenistas.id
order by count(tenistas.id) desc limit 1;