use federacao_tenis;

select tenistas.nome, categorias.nome from tenistas join categorias on tenistas.categorias_id = categorias.id;