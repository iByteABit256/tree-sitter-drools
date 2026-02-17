;; ============================================================
;; KEYWORDS
;; ============================================================

;; Top-level keywords
[
  "package"
  "import"
  "global"
  "declare"
  "rule"
  "query"
  "function"
  "unit"
] @keyword

;; Declaration keywords
[
  "trait"
  "type"
  "enum"
  "extends"
  "entry-point"
  "window"
] @keyword.type

;; Rule structure keywords
[
  "when"
  "then"
  "end"
  "attributes"
] @keyword.control

;; LHS operators
[
  "and"
  "or"
  "not"
  "exists"
  "forall"
  "eval"
  "accumulate"
  "acc"
  "groupby"
  "collect"
  "from"
  "over"
] @keyword.operator

;; Accumulate keywords
[
  "init"
  "action"
  "reverse"
  "result"
] @keyword.function

;; Named consequence keywords
[
  "do"
  "break"
  "if"
  "else"
] @keyword.control.conditional

;; Java/control flow keywords
[
  "return"
  "for"
  "while"
  "new"
  "this"
  "super"
  "insert"
  "insertLogical"
  "update"
  "modify"
  "delete"
  "retract"
] @keyword.control

;; Import modifiers
[
  "static"
] @keyword.modifier

;; ============================================================
;; RULE ATTRIBUTES
;; ============================================================

(attribute
  name: [
    "salience"
    "enabled"
    "no-loop"
    "auto-focus"
    "lock-on-active"
    "refract"
    "direct"
    "activation-group"
    "ruleflow-group"
    "date-effective"
    "date-expires"
    "dialect"
    "calendars"
    "timer"
    "duration"
  ] @attribute)

;; ============================================================
;; DROOLS-SPECIFIC OPERATORS
;; ============================================================

;; Relational operators
[
  "matches"
  "memberOf"
  "contains"
  "excludes"
  "soundslike"
  "str"
] @keyword.operator

;; Temporal operators
[
  "after"
  "before"
  "coincides"
  "during"
  "includes"
  "finishes"
  "finishedby"
  "meets"
  "metby"
  "overlaps"
  "overlappedby"
  "starts"
  "startedby"
] @keyword.operator

;; ============================================================
;; OPERATORS
;; ============================================================

;; Comparison operators
[
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
] @operator

;; Logical operators
[
  "&&"
  "||"
  "!"
] @operator

;; Arithmetic operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
] @operator

;; Bitwise operators
[
  "&"
  "|"
  "^"
  "~"
  "<<"
  ">>"
  ">>>"
] @operator

;; Assignment operators
[
  "="
  "+="
  "-="
  "*="
  "/="
  "&="
  "|="
  "^="
  "%="
  "<<="
  ">>="
  ">>>="
] @operator

;; Other operators
[
  "?"
  ":"
  "++"
  "--"
  "instanceof"
] @operator

;; Drools-specific operators
[
  ":="  ; unification
] @operator

;; ============================================================
;; LITERALS
;; ============================================================

(string_literal) @string
(number) @number
(boolean_literal) @constant.builtin.boolean
(null_literal) @constant.builtin
(time_interval) @number.time

;; ============================================================
;; IDENTIFIERS
;; ============================================================

;; Rule names
(rule_decl
  name: (string_literal) @string.special) @markup.heading

(rule_decl
  name: (identifier) @markup.heading)

;; Query names
(query_decl
  name: (string_literal) @string.special) @markup.heading

(query_decl
  name: (identifier) @markup.heading)

;; Function names
(function_decl
  (identifier) @function)

;; Package and imports
(package_decl
  (qualified_name) @namespace)

(import_decl
  (import_path) @namespace)

(global_decl
  (identifier) @variable.global)

;; Type declarations
(type_declaration
  name: (qualified_name) @type)

(enum_declaration
  (qualified_name) @type)

(enumerative
  (identifier) @constant)

;; Field declarations
(field_decl
  name: (identifier) @variable.member)

;; ============================================================
;; PATTERNS
;; ============================================================

;; Pattern types
(lhs_pattern
  type: (qualified_name) @type)

;; Pattern binding labels
(label
  (identifier) @variable.parameter)

;; Unification
(unif
  (identifier) @variable.parameter)

;; Constraint bindings
(constraint_binding
  (label
    (identifier) @variable.parameter)
  (identifier) @variable.member)

(constraint_unification
  (unif
    (identifier) @variable.parameter)
  (identifier) @variable.member)

;; ============================================================
;; EXPRESSIONS
;; ============================================================

;; Method calls
(method_call
  method: (identifier) @function.method)

;; Field access
(field_access
  (identifier) @variable.member)

;; Object creation
(object_creation
  (type) @type)

;; Cast expressions
(cast_expression
  (type) @type)

;; ============================================================
;; TYPES
;; ============================================================

(primitive_type) @type.builtin

(qualified_type
  (qualified_name) @type)

(type_argument
  (type) @type)

;; ============================================================
;; ANNOTATIONS
;; ============================================================

(annotation
  "@" @punctuation.special
  (qualified_name) @attribute)

(annotation_element_value_pair
  key: (identifier) @variable.parameter)

;; ============================================================
;; VARIABLES AND PARAMETERS
;; ============================================================

(parameter
  (identifier) @variable.parameter)

(variable_declaration
  (identifier) @variable)

(for_init
  (identifier) @variable)

;; ============================================================
;; PUNCTUATION
;; ============================================================

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ";"
  ","
  "."
  "?."
  "#"
] @punctuation.delimiter

;; ============================================================
;; COMMENTS
;; ============================================================

(comment) @comment

;; ============================================================
;; SPECIAL
;; ============================================================

;; Wildcard in imports
(import_path "*" @constant.builtin)

;; Question mark for optional patterns
(lhs_pattern "?" @operator)

;; Named consequence markers
(named_consequence_invocation
  "[" @punctuation.special
  (identifier) @label
  "]" @punctuation.special)

(breaking_named_consequence_invocation
  "[" @punctuation.special
  (identifier) @label
  "]" @punctuation.special)

;; ============================================================
;; IDENTIFIERS (catch-all for remaining)
;; ============================================================

(identifier) @variable

;; Qualified names in expressions
(qualified_name) @variable
