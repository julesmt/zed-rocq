(comment) @comment
(string) @string
[(number) (decnat) (hexnat)] @number

["From" "Require" "Import" "Export"] @keyword

[
  "Theorem" "Lemma" "Fact" "Remark" "Corollary" "Proposition"
  "Definition" "Example" "Fixpoint" "Inductive"
  "Axiom" "Axioms" "Parameter" "Parameters"
  "Hypothesis" "Hypotheses" "Variable" "Variables"
] @keyword

[
  "Section" "Module" "End" "Proof" "Save" "Defined"
  "fun" "forall" "exists" "let" "match" "return" "end"
  "if" "then" "else" "fix" "with" "struct"
] @keyword

[(qed_command) (admitted_command) (abort_command)] @keyword

["intros" "intro" "assert" "rewrite" "repeat" "try"] @keyword

((ident) @type.builtin
  (#match? @type.builtin "^(Prop|Set|Type)$"))

(ident_decl) @function
(inductive_definition name: (_) @type)
(constructor name: (_) @constructor)
(section_command (ident) @type)
(module_command (ident) @type)
(application . (ident) @function)
(application . (dotted_qualid) @function)
(generic_tactic name: (_) @function)

[
  ":=" "=>" "->" "<-" "<->" "=" "<>" "<" "<=" ">" ">="
  "+" "-" "*" "/" "%" "||" "|" "::" "++" "@"
  "/\\" "\\/" "~" "?" "&" "!"
] @operator

["." "..." "," ";" ":"] @punctuation.delimiter
["(" ")" "[" "]" "{" "}"] @punctuation.bracket
