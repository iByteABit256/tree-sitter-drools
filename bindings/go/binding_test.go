package tree_sitter_drools_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_drools "github.com/ibyteabit256/tree-sitter-drools.git/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_drools.Language())
	if language == nil {
		t.Errorf("Error loading Drools grammar")
	}
}
