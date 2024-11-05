-- name: GetApplicationVersion :one
SELECT * FROM ApplicationVersion
WHERE Name = ? LIMIT 1;

-- name: GetApplicationFiles :many
SELECT * FROM ApplicationFile
WHERE Application = ?