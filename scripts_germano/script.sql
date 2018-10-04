select * from campeonatos where data_realizacao < date_sub(now(), interval 2 year);

select t.nome, t.data_nascimento, 
	t.sexo, cat.nome 
    from tenistas t 
    inner join categorias cat 
		on t.categorias_id = cat.id; 

select sum(j.publico) AS `Publico Total`, 
	q.endereco, q.tipo 
    from jogos j 
    right join quadras q 
		on j.quadras_id = q.id group by q.id; 

select t_01.nome, j.pontuacao_tenista_01,
		t_02.nome, j.pontuacao_tenista_02,
        camp.nome, q.tipo        
	from jogos j 
	inner join tenistas t_01 
		on t_01.id = j.tenista_01_id 
	inner join tenistas t_02 
		on t_02.id = j.tenista_02_id 
	inner join campeonatos camp
		on camp.id = j.campeonatos_id
	inner join quadras q
		on q.id = j.quadras_id;
     
select count(t.id) AS `Quantidade de Jogos`, t.nome, camp.nome from jogos j 
	inner join campeonatos camp
		on camp.id = j.campeonatos_id
	inner join tenistas t 
		on t.id = j.tenista_01_id || t.id = j.tenista_02_id
	group by camp.id, t.id order by `Quantidade de Jogos` desc; 
                
select camp.nome, round(AVG(j.publico), 2) AS `Média de Público`, camp.premiacao 
	from jogos j 
    left join campeonatos camp 
		on camp.id = j.campeonatos_id 
    group by camp.id;
        
select year(camp.data_realizacao) AS `Data de Realização`, count(t.id) AS `Quantidade de Jogos`, t.nome 
	from jogos j 
    inner join campeonatos camp 
		on camp.id = j.campeonatos_id 
    inner join tenistas t 
		on t.id = j.tenista_01_id || t.id = j.tenista_02_id
    group by Year(camp.data_realizacao), t.id order by `Data de Realização` desc;
    
select q.endereco AS `Local`, AVG(j.publico) AS `Média de Público` 
	from jogos j
	inner join quadras q
		on q.id = j.quadras_id
	inner join campeonatos camp
		on camp.id = j.campeonatos_id
	where year(camp.data_realizacao) = 2014
	group by q.id ORDER BY `Média de Público` DESC;

select t.nome from jogos j 
	inner join tenistas t 
		on t.id = j.tenista_01_id OR t.id = j.tenista_02_id
	where t.sexo = 0 AND ((j.pontuacao_tenista_01 > j.pontuacao_tenista_02) AND t.id = j.tenista_01_id OR
    (j.pontuacao_tenista_02 > j.pontuacao_tenista_01) AND t.id = j.tenista_02_id) 
    group by t.id
    having count(t.id) >= 3;
        
select t.nome, AVG(j.publico) AS `Média de Público` from jogos j 
	inner join tenistas t
		on t.id = j.tenista_01_id || t.id = j.tenista_02_id
	group by t.id
    ORDER BY AVG(j.publico) DESC LIMIT 1;
    
select t.nome, COUNT(*) AS `Quantidade de Vitórias` from jogos j 
	inner join tenistas t 
		on t.id = j.tenista_01_id OR t.id = j.tenista_02_id
	where ((j.pontuacao_tenista_01 > j.pontuacao_tenista_02) AND t.id = j.tenista_01_id OR
    (j.pontuacao_tenista_02 > j.pontuacao_tenista_01) AND t.id = j.tenista_02_id) 
    group by t.id ORDER BY COUNT(*) DESC LIMIT 1; 
        
