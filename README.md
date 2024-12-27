# mm
Simple wrapper around markitdown and possibly more. Save time. Pronounce as mmm! 

# installation

```
pip install git+https://github.com/ytbryan/mm
```

if you use uv
```
uv venv
source .venv/bin/activate
uv pip install git+https://github.com/ytbryan/mm
```

# usage

Generate `input.md`
```
mm input.docx
```

Take in multiple `*.docx` and output multiple `.md` at once

```
mm *.docx
```

## todo
- [] Add pandoc support
- [] Convert default multiple input format 
- [] output multiple output format
- [] use config.yml
