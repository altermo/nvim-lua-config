(exec (string) @injection.content (#set! injection.language "bash"))

(params (string) @cmd . (#lua-match? @cmd "^%s*exec%s*$") ((string) @injection.content) . (#set! injection.language "bash"))

(declaration (string_literal) @injection.content (#set! injection.language "bash"))
