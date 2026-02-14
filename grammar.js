/**
 * @file Drools gramamr for treesitter
 * @author Pavlos Smith <paulsmith4561@proton.me>
 * @license AGPLv3
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

export default grammar({
  name: "drools",

  extras: $ => [
    /\s/,
    $.comment
  ],

  rules: {
    source_file: $ => repeat($._statement),

    _statement: $ => choice(
      $.package_decl,
      $.import_decl,
      $.rule_decl
    ),

    // package com.example.rules
    package_decl: $ => seq(
      "package",
      $.qualified_name
    ),

    // import com.example.Foo
    import_decl: $ => seq(
      "import",
      $.qualified_name
    ),

    // rule "My Rule" ... end
    rule_decl: $ => seq(
      "rule",
      choice($.string, $.identifier),
      optional($.rule_attributes),
      "when",
      repeat($._condition),
      "then",
      repeat($._action),
      "end"
    ),

    rule_attributes: $ => repeat1(
      seq(
        $.identifier,
        $.literal
      )
    ),

    _condition: $ => seq(
      $.expression,
      optional(";")
    ),

    _action: $ => seq(
      $.expression,
      optional(";")
    ),

    expression: $ => choice(
      $.method_call,
      $.binary_expression,
      $.identifier,
      $.string,
      $.number,
      $.qualified_name
    ),

    binary_expression: $ => prec.left(seq(
      $.expression,
      choice("==", "!=", "<", ">", "<=", ">=", "&&", "||"),
      $.expression
    )),

    method_call: $ => seq(
      $.expression,
      "(",
      sepBy(",", $.expression),
      ")"
    ),

    qualified_name: $ => seq(
      $.identifier,
      ".",
      sepBy1(".", $.identifier)
    ),

    identifier: _ => /[a-zA-Z_][a-zA-Z0-9_]*/,

    number: _ => /\d+(\.\d+)?/,

    string: _ => /"([^"\\]|\\.)*"/,

    comment: _ => token(choice(
      seq("//", /.*/),
      seq("/*", /[^*]*\*+([^/*][^*]*\*+)*/, "/")
    )),

    literal: $ => choice(
      $.string,
      $.number,
      "true",
      "false",
      "null"
    ),
  }
});

// Helpers
function sepBy1(sep, rule) {
  return seq(rule, repeat(seq(sep, rule)));
}

function sepBy(sep, rule) {
  return optional(sepBy1(sep, rule));
}
