use federacao_tenis;

select campeonatos.id, campeonatos.nome, campeonatos.premiacao, avg(jogos.publico) from campeonatos
join jogos on jogos.campeonatos_id = campeonatos.id
group by campeonatos.id;