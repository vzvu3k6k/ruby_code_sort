require 'parser/current'

code = $stdin.read
ast = Parser::CurrentRuby.parse(code)

# If there is only one statement, returns code as it is.
unless ast.type == :begin
  print code
  exit
end

new_code = code.dup
offset = 0
sorted = ast.children.sort_by{|child|
  code[child.loc.expression.begin_pos .. child.loc.expression.end_pos]
}
ast.children.zip(sorted).each{|old, new|
  old_begin = old.loc.expression.begin_pos + offset
  old_end   = old.loc.expression.end_pos   + offset
  new_begin = new.loc.expression.begin_pos
  new_end   = new.loc.expression.end_pos

  new_code[old_begin .. old_end] = code[new_begin .. new_end]

  offset += (new_end - new_begin) - (old_end - old_begin)
}

print new_code
