/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "demo",

  rules: {
    source_file: $ => repeat($._node),
    _node: $ => choice(
      $.command,
      $.query,
    ),

    ident: _ => /[a-zA-Z][a-zA-Z0-9\-]*/,

    command: $ => seq(
      "\\",
      seq($.ident, repeat($.path))
    ),
    path: $ => seq("/", $.ident),

    query: _ => "\\query",
  }
});
