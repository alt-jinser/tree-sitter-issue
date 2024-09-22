package tree_sitter_jinser_45tjd1_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-jinser_45tjd1"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_jinser_45tjd1.Language())
	if language == nil {
		t.Errorf("Error loading Jinser45tjd1 grammar")
	}
}
