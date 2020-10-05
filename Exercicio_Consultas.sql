-- Selecione o nome e a renda per capita das cidades com mais de 5000 habitantes.;
select c.nome, c.renda_per_capita
from cidade c
where c.total_habitantes > 5000;

-- Selecione todos os dados das cidades que foram fundadas depois de 12 março de 1432.;
select c.*
from cidade c
where c.data_fundação > 1432-03-12;

-- Selecione a cidade cujo cep é 38180000.;
select c.*
from cidade c
where c.cep = 13000-000;

-- Selecione o nome das cidades do estado de São Paulo.;
select c.nome
from cidade c
where c.estado = 'SP';

-- Selecione todos os dados das cidades que ficam no estado de São Paulo 
-- e que possuam mais do que 100 mil habitantes.;
select c.*
from cidade c
where c.estado = 'SP'
and c.total_habitantes > 100000;

-- Selecione o nome das cidades que são capitais e tem mais do que 30000 de renda per capita.;
select c.nome
from cidade c
where c.capital = 1
and c.renda_per_capita > 1200.00;

-- Selecione o nome da cidade e o nome do estado cuja sigla é sp.;
select c.nome, c.estado
from cidade c, estado e
where c.estado = e.sigla
and e.sigla = 'SP';

-- Selecione a região, o nome do estado, o nome da cidade e a quantidade de habitantes das
-- cidades com renda per capita maior do que 20000 e que não são capitais.;
select e.região, e.nome, c.nome, c.total_habitantes
from cidade c, estado e
where c.estado = e.sigla
and c.renda_per_capita > 1000
and c.capital = 0;

-- Selecione todos os dados das cidades que pertencem a região sudeste.;
select c.*
from cidade c, estado e
where c.estado = e.sigla
and e.região = 'sudeste';

-- Selecione o nome e a quantidade de habitantes das cidades da região sudeste que não sejam
-- capitais, que não sejam do estado cuja sigla é mg e que tenham a renda per capita maior do
-- que 15000.;
select c.nome, c.total_habitantes
from cidade c, estado e
where c.estado = e.sigla
and e.região = 'sudeste'
and c.capital = 0
and e.sigla <> 'MG'
and c.renda_per_capita > 1500;