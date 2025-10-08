-- création de la base
create database if not exists centreformation;
use centreformation;

-- table des stagiaires
create table stagiaire (
    idstagiaire int auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    datenaissance date,
    email varchar(100) unique,
    telephone varchar(20)
);

-- table des formateurs
create table formateur (
    idformateur int auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    specialite varchar(100),
    email varchar(100) unique
);

-- table des filières
create table filiere (
    idfiliere int auto_increment primary key,
    nomfiliere varchar(100) not null,
    dureemois int check (dureemois > 0)
);

-- table des modules
create table module (
    idmodule int auto_increment primary key,
    nommodule varchar(100) not null,
    volumehoraire int check (volumehoraire > 0),
    idfiliere int,
    foreign key (idfiliere) references filiere(idfiliere)
        on delete cascade
        on update cascade
);

-- table des sessions
create table session (
    idsession int auto_increment primary key,
    datedebut date not null,
    datefin date not null,
    idfiliere int,
    idformateur int,
    foreign key (idfiliere) references filiere(idfiliere)
        on delete set null
        on update cascade,
    foreign key (idformateur) references formateur(idformateur)
        on delete set null
        on update cascade
);

-- table des inscriptions
create table inscription (
    idinscription int auto_increment primary key,
    idstagiaire int,
    idsession int,
    dateinscription date default (current_date),
    foreign key (idstagiaire) references stagiaire(idstagiaire)
        on delete cascade
        on update cascade,
    foreign key (idsession) references session(idsession)
        on delete cascade
        on update cascade
);

-- table des évaluations
create table evaluation (
    idevaluation int auto_increment primary key,
    idstagiaire int,
    idmodule int,
    note decimal(5,2) check (note >= 0 and note <= 20),
    dateevaluation date default (current_date),
    foreign key (idstagiaire) references stagiaire(idstagiaire)
        on delete cascade
        on update cascade,
    foreign key (idmodule) references module(idmodule)
        on delete cascade
        on update cascade
);





use centreformation;

-- insertion des formateurs
insert into formateur (nom, prenom, specialite, email) values
('benali', 'youssef', 'développement web', 'youssef.benali@gmail.com'),
('lahmar', 'amina', 'réseaux informatiques', 'amina.lahmar@gmail.com'),
('elhassani', 'karim', 'base de données', 'karim.elhassani@gmail.com'),
('mouline', 'fatima', 'cybersécurité', 'fatima.mouline@gmail.com'),
('ouardi', 'amine', 'intelligence artificielle', 'amine.ouardi@gmail.com'),
('sahli', 'sara', 'développement mobile', 'sara.sahli@gmail.com'),
('benslimane', 'yassine', 'devops', 'yassine.benslimane@gmail.com'),
('merzouki', 'hanae', 'cloud computing', 'hanae.merzouki@gmail.com'),
('elkhattabi', 'hicham', 'data science', 'hicham.elkhattabi@gmail.com'),
('talbi', 'leila', 'gestion de projet', 'leila.talbi@gmail.com');

-- insertion des filières
insert into filiere (nomfiliere, dureemois) values
('développement web', 12),
('réseaux et systèmes', 18),
('cybersécurité', 12),
('intelligence artificielle', 24),
('data science', 24);

-- insertion des modules
insert into module (nommodule, volumehoraire, idfiliere) values
('html et css', 40, 1),
('javascript', 60, 1),
('php et mysql', 80, 1),
('réseaux cisco', 70, 2),
('administration linux', 60, 2),
('sécurité réseau', 50, 3),
('cryptographie', 60, 3),
('python pour IA', 80, 4),
('machine learning', 90, 4),
('deep learning', 100, 4),
('analyse de données', 70, 5),
('python data', 80, 5),
('statistiques', 50, 5),
('visualisation', 60, 5),
('gestion de projet agile', 40, 1);

-- insertion des stagiaires
insert into stagiaire (nom, prenom, datenaissance, email, telephone) values
('aghilas', 'omar', '2001-05-12', 'omar.aghilas@gmail.com', '0612345678'),
('rajeb', 'hiba', '2002-09-30', 'hiba.rajeb@gmail.com', '0611122233'),
('aguezar', 'ayoub', '2005-04-10', 'ayoub.aguezar@gmail.com', '0612233445'),
('elmansouri', 'sara', '2003-07-22', 'sara.elmansouri@gmail.com', '0619988776'),
('elkhattabi', 'youssef', '2000-12-15', 'youssef.elkhattabi@gmail.com', '0611123344'),
('benslimane', 'amina', '2001-11-10', 'amina.benslimane@gmail.com', '0612233556'),
('merzouki', 'karim', '2002-03-08', 'karim.merzouki@gmail.com', '0613344556'),
('talbi', 'leila', '2002-05-20', 'leila.talbi@gmail.com', '0614455667'),
('ouardi', 'fatima', '2003-09-01', 'fatima.ouardi@gmail.com', '0615566778'),
('sahli', 'yassine', '2001-08-14', 'yassine.sahli@gmail.com', '0616677889'),
('elhassani', 'hanae', '2000-07-22', 'hanae.elhassani@gmail.com', '0617788990'),
('mouline', 'hicham', '2003-12-02', 'hicham.mouline@gmail.com', '0618899001'),
('benali', 'sara', '2004-04-19', 'sara.benali@gmail.com', '0619900112'),
('lahmar', 'amine', '2000-01-30', 'amine.lahmar@gmail.com', '0611011223'),
('merzouki', 'leila', '2002-02-28', 'leila.merzouki@gmail.com', '0612122334'),
('elmansouri', 'omar', '2001-03-11', 'omar.elmansouri@gmail.com', '0613233445'),
('aguezar', 'yassine', '2003-05-15', 'yassine.aguezar@gmail.com', '0614344556'),
('talbi', 'amina', '2000-06-20', 'amina.talbi@gmail.com', '0615455667'),
('elhassani', 'karim', '2002-07-25', 'karim.elhassani2@gmail.com', '0616566778'),
('rajeb', 'hiba2', '2003-08-30', 'hiba2.rajeb@gmail.com', '0617677889');

-- insertion des sessions
insert into session (datedebut, datefin, idfiliere, idformateur) values
('2025-01-10', '2025-07-10', 1, 1),
('2025-03-01', '2025-09-01', 2, 2),
('2025-02-15', '2025-08-15', 3, 4),
('2025-04-01', '2025-10-01', 4, 5),
('2025-05-01', '2025-11-01', 5, 9),
('2025-06-01', '2025-12-01', 1, 6),
('2025-07-01', '2026-01-01', 2, 7),
('2025-08-01', '2026-02-01', 3, 8),
('2025-09-01', '2026-03-01', 4, 5),
('2025-10-01', '2026-04-01', 5, 10);

-- insertion des inscriptions
insert into inscription (idstagiaire, idsession, dateinscription) values
(1,1,'2024-12-20'),
(2,1,'2024-12-21'),
(3,1,'2024-12-25'),
(4,2,'2025-02-10'),
(5,3,'2025-01-12'),
(6,3,'2025-01-15'),
(7,4,'2025-03-01'),
(8,4,'2025-03-02'),
(9,5,'2025-04-01'),
(10,5,'2025-04-05'),
(11,6,'2025-06-10'),
(12,6,'2025-06-12'),
(13,7,'2025-07-01'),
(14,7,'2025-07-02'),
(15,8,'2025-08-01'),
(16,8,'2025-08-02'),
(17,9,'2025-09-01'),
(18,9,'2025-09-02'),
(19,10,'2025-10-01'),
(20,10,'2025-10-02'),
(1,6,'2025-06-15'),
(2,7,'2025-07-10'),
(3,8,'2025-08-10'),
(4,9,'2025-09-15'),
(5,10,'2025-10-10'),
(6,1,'2024-12-28'),
(7,2,'2025-02-20'),
(8,3,'2025-01-25'),
(9,4,'2025-03-05'),
(10,5,'2025-04-12'),
(11,6,'2025-06-18'),
(12,7,'2025-07-12'),
(13,8,'2025-08-15'),
(14,9,'2025-09-18'),
(15,10,'2025-10-15'),
(16,1,'2024-12-30'),
(17,2,'2025-02-25'),
(18,3,'2025-01-30'),
(19,4,'2025-03-10'),
(20,5,'2025-04-18');

-- insertion des évaluations
insert into evaluation (idstagiaire, idmodule, note, dateevaluation) values
(1,1,16.5,'2025-02-01'),
(1,2,15.0,'2025-03-15'),
(2,3,17.25,'2025-04-10'),
(3,1,14.0,'2025-02-20'),
(4,4,13.5,'2025-05-05'),
(5,5,18.0,'2025-06-01'),
(6,6,16.0,'2025-03-10'),
(7,7,14.5,'2025-04-20'),
(8,8,15.0,'2025-05-10'),
(9,9,17.0,'2025-06-15'),
(10,10,12.5,'2025-07-01'),
(11,11,16.0,'2025-06-20'),
(12,12,18.5,'2025-07-15'),
(13,13,14.0,'2025-08-01'),
(14,14,15.5,'2025-08-10'),
(15,15,13.0,'2025-09-01'),
(16,1,12.5,'2025-09-10'),
(17,2,17.0,'2025-09-15'),
(18,3,15.5,'2025-10-01'),
(19,4,16.0,'2025-10-05'),
(20,5,14.5,'2025-10-10'),
(1,6,15.0,'2025-06-25'),
(2,7,14.0,'2025-07-20'),
(3,8,16.5,'2025-08-20'),
(4,9,13.5,'2025-09-15'),
(5,10,12.0,'2025-10-12'),
(6,11,17.0,'2025-06-28'),
(7,12,16.0,'2025-07-25'),
(8,13,15.5,'2025-08-20'),
(9,14,14.5,'2025-09-18'),
(10,15,13.0,'2025-10-15'),
(11,1,18.0,'2025-06-30'),
(12,2,17.5,'2025-07-28'),
(13,3,16.0,'2025-08-22'),
(14,4,15.0,'2025-09-20'),
(15,5,14.5,'2025-10-18'),
(16,6,13.0,'2025-06-30'),
(17,7,12.5,'2025-07-30'),
(18,8,16.0,'2025-08-25'),
(19,9,15.0,'2025-09-22'),
(20,10,14.0,'2025-10-20');

-- 1- Créez un trigger qui empêche l’insertion d’un stagiaire âgé de moins de 18 ans dans la table Stagiaire.

delimiter ##
create trigger check_age 
before insert 
on Stagiaire 
for each row 
begin
	
	if ( datediff(new.datenaissance , current_date) / 365 )  < 18   then 
		signal 	sqlstate  '45000'
		set MESSAGE_TEXT = "stagiaire doit etre age plus de 18";
	end if ;
end ##
delimiter ;
  -- test 
insert into stagiaire (nom, prenom, datenaissance, email, telephone) values
('aghilas001', 'omar001', '2022-05-12', 'omar.aghila001s@gmail.com', '0612398678');


-- 2- Créez un trigger qui empêche l’insertion ou la mise à jour d’un formateur si son email ne contient pas le symbole @.

delimiter ##
create trigger check_email_fomateur_insert
before 
insert 
on formateur
for each row 
begin 
	if new.email not like '%@%' then 
		signal sqlstate '45000' set message_text = 'l\'email doit contenir @ ' ;
	end if ;
end ##
delimiter ;


delimiter ##
create trigger check_email_fomateur_update
before 
update 
on formateur
for each row 
begin 
	if new.email not like '%@%' then 
		signal sqlstate '45000' set message_text = 'l\'email doit contenir @ ' ;
	end if ;
end ##
delimiter ;

-- test 

insert into formateur (nom, prenom, specialite, email) values
('benali', 'youssef', 'développement web', 'youssef.benali#gmail.com');

update formateur 
set email = 'youssef.benali#gmail.com'
where idformateur = 1 ;

-- 3- Créez un trigger qui vérifie que la dateFin d’une session est postérieure à la dateDebut.

delimiter ##
create trigger verifeDate_insert 
before insert 
on Session 
for each row 
begin 
	if datediff( new.datefin , new.datedebut) < 1 then 
		signal sqlstate '45000' set message_text = "Votre informations sont incorrectes";
	end if ;
end ##
delimiter ;


delimiter ##
create trigger verifeDate_update
before update  
on Session 
for each row 
begin 
	if datediff( new.datefin , new.datedebut) < 1 then 
		signal sqlstate '45000' set message_text = "Votre informations sont incorrectes";
	end if ;
end ##
delimiter ;

-- test 


-- 4- Créez un trigger qui insère automatiquement la dateInscription (date du jour) lors d’un nouvel enregistrement dans la table Inscription.


delimiter ##
create trigger  inscription_insert 
before insert 
on inscription 
for each row 
begin 
	insert into inscription values (new.idstagiaire, new.idsession, current_date) ;
end ##
delimiter ;


-- test



-- 5- Lorsqu’un stagiaire est supprimé, supprimez automatiquement toutes ses évaluations associées.

delimiter ##
create trigger supprimer 
after delete 
on Stagiaire
for each row 
begin 
	delete from evaluation where idstagiaire = old.idStagiaire ;
end ##
delimiter ;

-- tests


-- 6- Créez un trigger qui empêche l’insertion ou la modification d’une note en dehors de l’intervalle [0, 20].



delimiter ##
create trigger intervalle_insert 
before insert 
on evaluation 
for each row 
begin 
	if new.note > 20 or new.note < 0 then 
		signal sqlstate '45000' set message_text = 'La note n\'appartient pas a l\'intervalle demandee';
	end if ;
end ##
delimiter ;



delimiter ##
create trigger intervalle_update
before update  
on evaluation 
for each row 
begin 
	if new.note > 20 or new.note < 0 then 
		signal sqlstate '45000' set message_text = 'La note n\'appartient pas a l\'intervalle demandee';
	end if ;
end ##
delimiter ;

-- tests 



-- 7- Créez un trigger qui empêche d’insérer un module avec un volumeHoraire inférieur à 10 heures.

delimiter ##
create trigger module_insert
before insert  
on module 
for each row 
begin 
	if new.volumehoraire < 10 then 
		signal sqlstate '45000' set message_text = 'le volumeHoraire est inferieur a 10 ';
	end if ;
end ##
delimiter ;


-- test


-- 8- Créez un trigger qui empêche d’ajouter un stagiaire à une session si le nombre maximum de stagiaires est atteint (ex. 30 stagiaires).


delimiter ##
create trigger maxSession 
before insert  
on inscription   
for each row 
begin 
	declare nbt int ;
	select  count(*) into nbt from inscription where idsession = new.idsession ;
	if nbt > 30 then 
		signal sqlstate '45000' set message_text = 'La session est remplie';
	end if ;
end ##
delimiter ;

-- test 



-- 9- Créez un trigger qui enregistre dans une table HistoriqueEvaluation toute modification ou suppression d’une note dans Evaluation.


create table HistoriqueEvaluation(
	message text 
) ;  



delimiter ##
create trigger modificationDeLaNote  
after update  
on Evaluation   
for each row 
begin 
	insert into HistoriqueEvaluation(message) values( concat("modication de la note de ",old.note," a ",new.note) ) ;
end ##

delimiter ;



delimiter ##
create trigger suppretionDeLaNote  
after delete  
on Evaluation   
for each row 
begin 
	insert into HistoriqueEvaluation(message) values( concat("suppretion de la note  ",old.note) ) ;
end ##

delimiter ;


-- test 
update evaluation set note = 0 where idevaluation = 1;

-- 10- Créez un trigger qui insère un message dans une table Notification lorsqu’un formateur se voit attribuer une nouvelle session.

create table Notification(
 message text 
);

delimiter ##
create trigger  NotificationMessage 
after insert   
on session    
for each row 
begin 
	insert into Notification values( concat("Le formateur ",new.idformateur," est assigne a la session : ", new.idsession ) ) ;
end ##

delimiter ;

-- test 

insert into session (datedebut, datefin, idfiliere, idformateur) values
('2025-01-10', '2025-07-10', 1, 3);
select * from Notification;



