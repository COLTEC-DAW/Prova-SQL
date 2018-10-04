use federacao_tenis;

select nome, premiacao from campeonatos where data_realizacao < date_sub(now(), interval 2 year);