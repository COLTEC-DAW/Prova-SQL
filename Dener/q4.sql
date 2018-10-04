use federacao_tenis;

select campeonatos.nome, quadras.tipo, t1.nome, jogos.pontuacao_tenista_01, t2.nome, pontuacao_tenista_02 from jogos 
join tenistas t1 on jogos.tenista_01_id = t1.id 
join tenistas t2 on jogos.tenista_02_id = t2.id
join campeonatos on jogos.campeonatos_id = campeonatos.id
join quadras on jogos.quadras_id = quadras.id;