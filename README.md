# tree-sitter-drools

A [tree-sitter][] grammar for the [Drools Rule Language (DRL)][drools-ref], the
business rules language used by [Red Hat's Drools][] decision engine.

[tree-sitter]: https://github.com/tree-sitter/tree-sitter
[drools-ref]: https://docs.drools.org/7.6.0.Final/drools-docs/html_single/
[red hat's drools]: https://www.drools.org/

## Features

The grammar covers the core of the Drools Rule Language:

- **Rules**, **queries**, **functions**, and **global** declarations
- **LHS patterns** — bindings (`$p : Person()`), `and`/`or`/`not`/`exists`/
  `forall`, `eval`, `from`, `collect`, `accumulate`/`acc`, `groupby`,
  `entry-point`, and windowed sources
- **RHS actions** — `insert`, `insertLogical`, `update`, `modify`, `delete`,
  `retract`, plus regular Java statements in rule consequences
- **Type declarations** — `declare` blocks with `trait`/`type`/`enum`,
  fields, and `extends`
- **Rule attributes** — `salience`, `activation-group`, `dialect`, `timer`,
  `date-effective`, etc.
- **Drools-specific operators** — `matches`, `contains`, `memberOf`,
  temporal operators (`after`, `before`, `during`, …), `instanceof`, `str`
- **Annotations**, comments (`//` and `/* */`), and nested blocks

## Editor support

Alongside `highlights.scm`, the `queries/` directory ships:

| Query | Purpose |
|---|---|
| `highlights.scm` | Syntax highlighting |
| `tags.scm` | Symbol navigation (symbol picker, definitions) |
| `textobjects.scm` | Text objects and navigation (functions, classes, parameters) |

**Helix** — copy (or symlink) the `queries/*.scm` files into
`runtime/queries/drools/` in your Helix config directory (on Linux/macOS this
is `~/.config/helix/runtime/queries/drools/`, on Windows
`%APPDATA%\helix\runtime\queries\drools\`), e.g.:

```sh
mkdir -p ~/.config/helix/runtime/queries/drools
cp queries/*.scm ~/.config/helix/runtime/queries/drools/
```

Once installed you can use `]f`/`[f` to jump between rules and functions,
`mi`/`ma` to select rule bodies, and the syntax symbol picker.

**Neovim** — used automatically by [nvim-treesitter][] (or manually via
`queries/drools/` in your `runtimepath`).

[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter

## Usage

This is a standard tree-sitter grammar. Install it with your language
integration of choice, or build it directly:

```bash
npm install
npx tree-sitter generate
```

The grammar exposes a single root `compilation_unit` node (scope:
`source.drools`) and targets `*.drl` files.

## Development

Corpus tests live in `test/corpus/` and are run with the tree-sitter CLI:

```bash
npx tree-sitter test
```

Rust bindings tests:

```bash
cargo test
```

## Example

```drl
package com.example.rules

rule "Adult person"
when
    $p : Person(age >= 18)
then
    System.out.println("Adult detected");
end
```

See the `examples/` directory for more complete `.drl` files.

## References

- [Drools Grammar (ANTLR4)](https://github.com/kiegroup/drools-lsp/tree/main/drools-parser/src/main/antlr4/org/drools/drl/parser/antlr4)
- [Drools Reference](https://docs.drools.org/7.6.0.Final/drools-docs/html_single/)

## License

[AGPL-3.0](LICENSE)