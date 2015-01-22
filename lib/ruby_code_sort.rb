require "ruby_code_sort/version"
require "parser/current"

module RubyCodeSort
  module_function

  def sort(code)
    ast = Parser::CurrentRuby.parse(code)

    # If code is empty, returns code as it is.
    return code if ast.nil?

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
end
