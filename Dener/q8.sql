use federacao_tenis;

select quadras.id , avg(jogos.publico) from quadras
join jogos on quadras.id = jogos.quadras_id
join campeonatos on jogos.campeonatos_id = campeonatos.id
where year(campeonatos.data_realizacao) = 2014
group by quadras.id
order by avg(jogos.publico) desc;