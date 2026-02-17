;; ============================================================
;; SCOPES
;; ============================================================

;; File-level scope
(source_file) @local.scope

;; Rule scope
(rule_decl) @local.scope

;; Query scope
(query_decl) @local.scope

;; Function scope
(function_decl) @local.scope

;; Block scope (in RHS and function bodies)
(block) @local.scope

;; LHS scope (when clause)
(lhs) @local.scope

;; For loop scope
(for_statement) @local.scope

;; If statement scope
(if_statement) @local.scope

;; While loop scope
(while_statement) @local.scope

;; ============================================================
;; DEFINITIONS
;; ============================================================

;; Package definition (file-level namespace)
(package_decl
  (qualified_name) @local.definition.namespace)

;; Global variable definitions
(global_decl
  (identifier) @local.definition.var)

;; Type declarations
(type_declaration
  name: (qualified_name) @local.definition.type)

(enum_declaration
  (qualified_name) @local.definition.type)

;; Enum values
(enumerative
  (identifier) @local.definition.constant)

;; Field declarations in types
(field_decl
  name: (identifier) @local.definition.field)

;; Rule definitions
(rule_decl
  name: (string_literal) @local.definition.function)

(rule_decl
  name: (identifier) @local.definition.function)

;; Query definitions
(query_decl
  name: (string_literal) @local.definition.function)

(query_decl
  name: (identifier) @local.definition.function)

;; Function definitions
(function_decl
  (identifier) @local.definition.function)

;; Function parameters
(function_decl
  (formal_parameters
    (identifier) @local.definition.parameter))

;; Query parameters
(query_decl
  (parameters
    (parameter
      (identifier) @local.definition.parameter)))

;; Pattern binding - variables bound in LHS
(label
  (identifier) @local.definition.var)

;; Unification binding
(unif
  (identifier) @local.definition.var)

;; Constraint bindings - field value bindings
(constraint_binding
  (label
    (identifier) @local.definition.var))

(constraint_unification
  (unif
    (identifier) @local.definition.var))

;; Accumulate function bindings
(accumulate_function
  (label
    (identifier) @local.definition.var))

(accumulate_function
  (unif
    (identifier) @local.definition.var))

;; Group by key binding
(group_by_key_binding
  (label
    (identifier) @local.definition.var))

;; Variable declarations in RHS/functions
(variable_declaration
  (identifier) @local.definition.var)

;; For loop variables
(for_init
  (identifier) @local.definition.var)

;; Enhanced for loop variable
(for_statement
  (identifier) @local.definition.var)

;; Named consequence labels (like goto labels)
(named_consequence
  (identifier) @local.definition.label)

;; ============================================================
;; REFERENCES
;; ============================================================

;; Pattern type references
(lhs_pattern
  type: (qualified_name) @local.reference.type)

;; Type references in declarations and expressions
(type
  (qualified_type
    (qualified_name) @local.reference.type))

(type
  (primitive_type) @local.reference.type)

;; Type arguments in generics
(type_argument
  (type
    (qualified_type
      (qualified_name) @local.reference.type)))

;; Object creation type reference
(object_creation
  (type) @local.reference.type)

;; Cast expression type reference
(cast_expression
  (type) @local.reference.type)

;; Field access references
(field_access
  (identifier) @local.reference.field)

;; Method call references
(method_call
  method: (identifier) @local.reference.method)

;; Variable references in expressions
(primary_expression
  (identifier) @local.reference.var)

;; Qualified name references (could be type or variable)
(qualified_name) @local.reference

;; Named consequence invocations (like goto)
(named_consequence_invocation
  (identifier) @local.reference.label)

(breaking_named_consequence_invocation
  (identifier) @local.reference.label)

;; Import references
(import_decl
  (import_path) @local.reference.namespace)

;; Extends references (type inheritance)
(type_declaration
  (qualified_name) @local.reference.type)

;; Rule extension reference
(rule_decl
  (string_literal) @local.reference.function)

;; Constraint field references (right side of binding)
(constraint_binding
  (identifier) @local.reference.field)

(constraint_unification
  (identifier) @local.reference.field)

;; Pattern source references (entry-points, windows)
(from_entry_point
  (string_literal) @local.reference.constant)

(from_window
  (identifier) @local.reference.constant)

;; ============================================================
;; SPECIAL CASES
;; ============================================================

;; "this" and "super" are implicit references
((identifier) @local.reference.var
  (#eq? @local.reference.var "this"))

((identifier) @local.reference.var
  (#eq? @local.reference.var "super"))
