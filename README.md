# Hemanto Bora's Homebrew Tap

A collection of Homebrew formulae maintained by [Hemanto Bora](https://github.com/hemantobora).  
Install CLI tools built for developers, recruiters, and engineers — all from a single tap.

---

## Installation

Add this tap once:

```bash
brew tap hemantobora/tap
```

Then install any tool from it, for example:

```bash
brew install automock
```

Or directly:

```bash
brew install hemantobora/tap/automock
```

To upgrade all tools from this tap:

```bash
brew update
brew upgrade
```

---

## Available Formulae

### api-probe

Python-based CLI to configure AI skills for api-probe in any project. Installs slash commands for GitHub Copilot and Claude Code that generate and sync YAML probe files for API validation in CI/CD pipelines.

Key features:
- Scans your codebase to auto-detect API endpoints, auth patterns, and dependencies
- Interactive workflow — asks targeted questions before generating
- Supports REST, GraphQL, Postman, Bruno, Insomnia, OpenAPI, HAR

**Install:**
```bash
brew install hemantobora/tap/api-probe
```

**Usage:**
```bash
cd your-project
api-probe init
```

**Project:** [hemantobora/api-probe](https://github.com/hemantobora/api-probe)
**License:** [MIT](https://github.com/hemantobora/api-probe/blob/main/LICENSE)

---

### AutoMock

Go-based CLI to generate, deploy, and manage mock-server infrastructures (MockServer) in the cloud.

Key features:
- Provisions AWS infrastructure. Azure and GCP Planned  
- YAML-driven request/response mappings   
- AI-assisted stub generation via MCP  

**Install:**
```bash
brew install hemantobora/tap/automock
```

**Project:** [hemantobora/auto-mock](https://github.com/hemantobora/auto-mock)  
**License:** [MIT](https://github.com/hemantobora/auto-mock/blob/main/LICENSE)

---

## Verify Installation

Check any installed tool’s version:

```bash
automock --version
```

---

## Contributing

Want to add or update a formula?

1. Fork this repository  
2. Add or modify a file under `Formula/`  
3. Submit a pull request  

All formulae should:
- Build reproducibly with `go build` or an equivalent compiler  
- Include a valid license and homepage  
- Pass a simple `system "#{bin}/<tool>", "--version"` test  

---

## Related Links

- GitHub Profile: [Hemanto Bora](https://github.com/hemantobora)
- api-probe Repository: [hemantobora/api-probe](https://github.com/hemantobora/api-probe)
- AutoMock Repository: [hemantobora/auto-mock](https://github.com/hemantobora/auto-mock)
- GoReleaser Documentation: [https://goreleaser.com](https://goreleaser.com)

---

## License

All formulae in this tap are distributed under their respective project licenses.

---

Cheers!  
Install once, stay up to date forever.
