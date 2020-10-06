
-- Selecione o nome, o estado e o número de habitantes das cidades que pertencem ao estado
-- de São Paulo, Minas Gerais e Goiás.;
select c.nome, c.estado, c.total_habitantes
from cidade c, estado e
where c.estado = e.sigla 
and e.nome in ('São Paulo', 'Minas Gerais', 'Goiás');

-- Selecione os dados das cidades que não ficam em São Paulo, Minas Gerais e Paraíba.;
select c.*
from cidade c, estado e
where c.estado = e.sigla 
and e.nome not in ('São Paulo', 'Minas Gerais', 'Paraíba');

-- Selecione os dados das cidades cujos nomes dos estados à que elas pertencem começam
-- com a letra M.;
select c.*
from cidade c
where c.nome like 'M%';

-- Conte quantas cidades que ficam na região Centro-Oeste tem mais do que 400 mil habitantes.
select count(*)
from cidade c, estado e
where c.estado = e.sigla
and região = 'Centro-Oeste'
and c.total_habitantes > 400000;

-- Obtenha o total da população da região Sudeste.;
select sum(C.total_habitantes)
from cidade c, estado e
where c.estado = e.sigla 
and região = 'Sudeste';

-- Obtenha a renda per capita média da região Nordeste.;
select round(avg(C.renda_per_capita),2)
from cidade c, estado e
where c.estado = e.sigla 
and região = 'Nordeste';

-- Obtenha a maior população entre as cidades da região Centro-Oeste.;
select max(total_habitantes)
from cidade c, estado e
where c.estado = e.sigla 
and região = 'Centro-Oeste';

-- Obtenha a média da renda per capita das capitais.;
select round(avg(C.renda_per_capita),2)
from cidade c
where capital = 1;

-- Obtenha a qual a cidade mais antiga entre as cidades da região Sudeste que não sejam
-- capitais e que tenham a população maior do que 100 mil habitantes.
select min(c.data_fundação)
from cidade c, estado e
where c.estado = e.sigla 
and e.região = 'Sudeste'
and c.capital = 0
and c.total_habitantes > 100000;

-- Obtenha a média da renda per capita das cidades que não se encontram na região Sudeste e
-- Nordeste que tenham sido fundadas depois de 01 de Abril de 1500 e que tenham o nome
-- começado pela letra S.
select round(avg(C.renda_per_capita),2)
from cidade c, estado e
where c.estado = e.sigla 
and e.região not in('Centro-Oeste')
and c.data_fundação > 1500-04-01
and c.nome like 's%';