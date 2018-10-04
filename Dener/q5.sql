use federacao_tenis;

select campeonatos.id, campeonatos.nome, tenistas.nome, count(*) from campeonatos
join jogos on campeonatos.id = jogos.campeonatos_id
join tenistas on tenistas.id = jogos.tenista_01_id or tenistas.id = jogos.tenista_02_id
group by campeonatos.id, tenistas.id;