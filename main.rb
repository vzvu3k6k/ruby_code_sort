require 'parser/current'

def sort(code)
  ast = Parser::CurrentRuby.parse(code)

  # If there is only one statement, returns code as it is.
  return code unless ast.type == :begin

  new_code = code.dup
  sorted = ast.children.sort_by{|child|
    code[child.loc.expression.begin_pos .. child.loc.expression.end_pos]
  }
  ast.children.zip(sorted).each{|old, new|
    offset = new_code.size - code.size
    old_begin = old.loc.expression.begin_pos + offset
    old_end   = old.loc.expression.end_pos   + offset
    new_begin = new.loc.expression.begin_pos
    new_end   = new.loc.expression.end_pos

    new_code[old_begin .. old_end] = code[new_begin .. new_end]
  }

  new_code
end

if $0 == __FILE__
  print sort($stdin.read)
end
