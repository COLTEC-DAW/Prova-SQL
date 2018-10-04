use federacao_tenis;

select tenistas.nome, year(campeonatos.data_realizacao), count(*) from tenistas
join jogos on tenistas.id = jogos.tenista_01_id or tenistas.id = jogos.tenista_02_id
join campeonatos on campeonatos.id = jogos.campeonatos_id
group by tenistas.id, year(campeonatos.data_realizacao)
order by year(campeonatos.data_realizacao) desc;