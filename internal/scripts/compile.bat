cd %GOPATH%/src

protoc --proto_path=github.com/justjack1521/mevmanifest/internal/genproto --go_out=github.com/justjack1521/mevmanifest/pkg/genproto --go_opt=paths=source_relative manifest.proto
