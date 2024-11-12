create table ApplicationVersion
(
    Name  text constraint ApplicationVersion_pk primary key,
    Major integer default 0 not null,
    Minor integer default 0 not null,
    Patch integer default 0 not null
);

create table ApplicationFile
(
    Path        text    not null,
    Size        integer not null,
    Checksum    varchar(64) not null ,
    TimeStamp   integer not null,
    Application text    not null,
    PRIMARY KEY (Path, Application)
);