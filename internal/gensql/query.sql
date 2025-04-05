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
    Checksum    varchar(64) not null ,
    TimeStamp   integer not null,
    Application text    not null,
    PRIMARY KEY (Path, Application)
);


-- name: GetApplicationVersion :one
SELECT * FROM ApplicationVersion
WHERE Name = ? LIMIT 1;

-- name: GetApplicationFile :one
SELECT * FROM ApplicationFile
WHERE Path = ? AND Application = ? LIMIT 1;

-- name: GetApplicationFiles :many
SELECT * FROM ApplicationFile
WHERE Application = ?;

-- name: CreateApplicationVersion :exec
INSERT INTO ApplicationVersion (Name, Major, Minor, Patch)
VALUES (?, ?, ?, ?)
    ON CONFLICT(Name) DO UPDATE SET
    Major = EXCLUDED.Major,
    Minor = EXCLUDED.Minor,
    Patch = EXCLUDED.Patch;


-- name: UpdateApplicationVersion :exec
UPDATE ApplicationVersion SET Major = ?, Minor = ?, Patch = ?
WHERE Name = ?;

-- name: CreateApplicationFile :exec
INSERT INTO ApplicationFile (Path, Size, Checksum, TimeStamp, Application)
VALUES (?, ?, ?, ?, ?)
ON CONFLICT (Path, Application) DO UPDATE
SET Size = EXCLUDED.Size,
    Checksum = EXCLUDED.Checksum,
    TimeStamp = EXCLUDED.TimeStamp;