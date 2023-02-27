// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.stmt.LabeledStmt
import codeql.swift.elements.stmt.Stmt

module Generated {
  class RepeatWhileStmt extends Synth::TRepeatWhileStmt, LabeledStmt {
    override string getAPrimaryQlClass() { result = "RepeatWhileStmt" }

    /**
     * Gets the condition of this repeat while statement.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateCondition() {
      result =
        Synth::convertExprFromRaw(Synth::convertRepeatWhileStmtToRaw(this)
              .(Raw::RepeatWhileStmt)
              .getCondition())
    }

    /**
     * Gets the condition of this repeat while statement.
     */
    final Expr getCondition() { result = getImmediateCondition().resolve() }

    /**
     * Gets the body of this repeat while statement.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Stmt getImmediateBody() {
      result =
        Synth::convertStmtFromRaw(Synth::convertRepeatWhileStmtToRaw(this)
              .(Raw::RepeatWhileStmt)
              .getBody())
    }

    /**
     * Gets the body of this repeat while statement.
     */
    final Stmt getBody() { result = getImmediateBody().resolve() }
  }
}
