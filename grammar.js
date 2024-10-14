/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "demo",

  rules: {
    source_file: $ => repeat($._node),
    _node: $ => choice(
      $.text,
      $.math,
    ),

    text: _ => /[^{}\r\n]+/,
    math: $ => seq(
      "#",
      "{", $._node, "}",
    ),
  }
});
