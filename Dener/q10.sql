use federacao_tenis;

select tenistas.nome, avg(jogos.publico) from tenistas 
join jogos on tenistas.id = jogos.tenista_01_id or tenistas.id = jogos.tenista_02_id
group by tenistas.id
order by avg(jogos.publico) desc limit 1;