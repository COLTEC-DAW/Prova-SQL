use federacao_tenis;

select quadras.id, sum(jogos.publico) from jogos join quadras on jogos.quadras_id = quadras.id group by quadras.id;