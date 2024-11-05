-- name: CreateApplicationVersionTable :exec
CREATE TABLE IF NOT EXISTS ApplicationVersion (
    Name  text constraint ApplicationVersion_pk primary key,
    Major integer default 0 not null,
    Minor integer default 0 not null,
    Patch integer default 0 not null
);

-- name: CreateApplicationFileTable :exec
CREATE TABLE IF NOT EXISTS ApplicationFile (
    Path        text    not null,
    Size        integer not null,
    TimeStamp   integer not null,
    Application text    not null
);


-- name: GetApplicationVersion :one
SELECT * FROM ApplicationVersion
WHERE Name = ? LIMIT 1;

-- name: GetApplicationFiles :many
SELECT * FROM ApplicationFile
WHERE Application = ?;

-- name: CreateApplicationVersion :exec
INSERT INTO ApplicationVersion (Name, Major, Minor, Patch)
VALUES (?, ?, ?, ?);

-- name: CreateApplicationFile :exec
INSERT INTO ApplicationFile (Path, Size, TimeStamp, Application)
VALUES (?, ?, ?, ?);