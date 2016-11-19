CREATE SCHEMA admin;
create table admin.user (
	id bigint(10) auto_increment not null, 
	login varchar(100) not null,
	password varchar(100) not null,
	password_force_change int(1) not null,
	primary key (id)
);
alter table admin.user add constraint user_uk1 unique(login);
insert into admin.user (login,password,password_force_change) values ('admin@localhost.com',HASH('SHA256', STRINGTOUTF8('password'),1),1);

create table admin.configuration (
	id bigint(10) auto_increment not null, 
	variable varchar(100) not null,
	value varchar(100),
	primary key (id)
);
alter table admin.configuration add constraint configuration_uk1 unique(variable);
insert into admin.configuration (variable,value) values ('VERSION','1');
insert into admin.configuration (variable,value) values ('CONFIGURED','0');

create table admin.nginx (
	id bigint(10) auto_increment not null, 
	username varchar(100) not null,
	groupname varchar(100) not null,
	home varchar(255) not null,
	bin varchar(255) not null,
	conf varchar(255) not null,
	error varchar(255) not null,
	access varchar(255) not null,
	primary key (id)
);
insert into admin.nginx (user_name,group_name,home,bin,conf,error,access) values ('nginx','nginx','/etc/nginx','/usr/sbin/nginx','/etc/nginx/nginx.conf','/var/log/nginx/error.log','/var/log/nginx/access.log');

create table admin.smtp (
	id bigint(10) auto_increment not null, 
	host varchar(100) not null,
	username varchar(100),
	password varchar(100),
	from_address varchar(100) not null,
	port int(5) not null,
	tls int(1) not null,
	authenticate int(1) not null,
	primary key (id)
);
insert into admin.smtp (host,from,port,tls,authenticate) values ('localhost','nginx.admin@localhost.com',25,0,0);

commit;