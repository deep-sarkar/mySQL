alter table note_note modify column color varchar(7) default '#ffffff';
alter table note_note modify column pin tinyint(1) default 0;
alter table note_note modify column trash tinyint(1) default 0;
alter table note_note modify column archive tinyint(1) default 0;
alter table note_note modify column note longtext default null;
