def config [] {
    let file = $"($env.HOME)/.config/deepl-nu/config.yaml"
    { file: $file }
    | merge (open $file)
}

# Show config for deepl-nu.
export def main [] {
    config
}

def headers [] {
    [
        Authorization $"DeepL-Auth-Key (config|get api-key)"
        Content-Type  application/json
    ]
}

def language-types [] {
    [source, target]
}

# Check Usage and Limits
export def usage [--type: string@language-types = source] {
    http get https://api-free.deepl.com/v2/usage --headers (headers)
}

# Retrieve languages
export def languages [--type: string@language-types = source] {
    http get https://api-free.deepl.com/v2/languages --headers (headers)
}