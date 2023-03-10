/** Provides a class for generated files. */

import go

/** Provides a class for generated files. */
module GeneratedFile {
  /**
   * A file that has been generated.
   *
   * Extend this class to model new APIs. If you want to refine existing API models,
   * extend `GeneratedFile` instead.
   */
  abstract class Range extends File { }

  private string generatorCommentRegex() {
    result =
      [
        "Generated By\\b.*\\bDo not edit",
        "This (file|class|interface|art[ei]fact) (was|is|(has been)) (?:auto[ -]?)?gener(e?)ated",
        "Any modifications to this file will be lost",
        "This (file|class|interface|art[ei]fact) (was|is) (?:mechanically|automatically) generated",
        "The following code was (?:auto[ -]?)?generated (?:by|from)", "Autogenerated by Thrift",
        "(Code g|G)enerated from .* by ANTLR"
      ]
  }

  private class CommentHeuristicGeneratedFile extends Range {
    CommentHeuristicGeneratedFile() {
      exists(Comment c | c.getFile() = this |
        c.getText().regexpMatch("(?i).*\\b(" + concat(generatorCommentRegex(), "|") + ")\\b.*")
        or
        // regular expression recommended for Go code generators
        // (https://golang.org/pkg/cmd/go/internal/generate/)
        c.getText().regexpMatch("^\\s*Code generated .* DO NOT EDIT\\.\\s*$")
      )
    }
  }
}

/**
 * A file that has been generated.
 *
 * Extend this class to refine existing API models. If you want to model new APIs,
 * extend `GeneratedFile::Range` instead.
 */
class GeneratedFile extends File instanceof GeneratedFile::Range { }
