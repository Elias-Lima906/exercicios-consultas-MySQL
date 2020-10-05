create database país_estrelas;

create table cidade(
nome varchar(30) not null, 
cep varchar(9) primary key unique, 
total_habitantes int not null,
capital boolean not null,
estado char(2) not null,
renda_per_capita decimal(6, 2) not null,
data_fundação date not null
)default charset = utf8;

INSERT INTO CIDADE VALUES
('Campinas', '13000-000', '1213792', '0', 'SP', '1628.55', '1774-07-14'),
('Rio Grande', '96200-000', '198048 ', '0', 'RS', '841.05', '1737-02-19'),
('Curitiba', '80000-000', ' 1948626', '1', 'PR', '1802.45', '1693-03-29'),
('Campo Grande', '79100-000', '774202', '1', 'MS', '1246.75', '1899-08-26'),
('Betim', '32600-000', '375331', '0', 'MG', '646.15', '1938-12-17');

select * from cidade;
 
delete from cidade where cep = '32600-000';
 
update cidade set numero_habitantes = '217852' where cep = '96200-000';

insert into cidade values
('Betim', '32600-000', '375331', '0', 'MG', '646.15', '1938-12-17');

update cidade set numero_habitantes = '412864' where cep = '32600-000';

select * from cidade;

create table estado(sigla char(2), nome varchar(30)not null)default charset = utf8;

alter table estado
add primary key (sigla);

desc estado;
desc cidade;

insert into estado values
('SP', 'São Paulo'),
('MG', 'Minas Gerais'),
('MS', 'Mato Grosso Do Sul'),
('PR', 'Paraná'),
('RS', 'Rio Grande Do Sul');

select * from cidade;
select * from estado;

ALTER TABLE CIDADE 
ADD constraint estado_fk
FOREIGN KEY (estado)
REFERENCES país_estrelas.estado (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION
;

alter table estado 
add column região text not null;

update estado set região = 'Centro-Oeste' where sigla = 'MS';
update estado set região = 'Sul' where sigla = 'PR';
update estado set região = 'Sul' where sigla = 'RS';
update estado set região = 'Sudeste' where sigla = 'MG';
update estado set região = 'Sudeste' where sigla = 'SP';