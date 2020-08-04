require_relative 'numeral_parser'

class RomanCalculator
  # This class assumes any equations will be properly formatted to have a logical number of
  # operators and each operator is separated by a space.
  # If an array of roman numerals is returned as part of a fail case, it's likely because of misformatted input.

  @operators = {"*" => 3, "/" => 3, "+" => 2, "-" => 2}.freeze

  def self.evaluate_roman_equation(equation)
    rpn = to_rpn(equation)
    number_stack = []
    rpn.each do |value|
      if @operators.include?(value)  #when the value being worked on is an operator
        numbers = number_stack.pop(2) #Take the previous 2 numbers
        result = numbers.inject(value) # call that operator on them
        number_stack.push(result)# after removing the previous two numbers this pushes the result back on the stack
      else
        number_stack.push(value) #If it's a number push it onto the number stack
      end
    end
    number_stack.last #by the end there should only be one number left.
  end

  private

  def self.to_rpn(expression)
    #This is my implementation of the shunting yard algorithm.  which will take an infix notation and turn it
    # into Reverse Polish notation.
    rpn = [] #The working stack
    operator_stack = [] #operators
    components = expression.split #... the expression

    until components.empty? #maybe come up with better names
      component = components.shift # In one move assignes the component and removes it from the components list
      if @operators.include?(component) #when the component is a +-*/
        earlier_operator = operator_stack.last #gets the last value to be on there setting up the comparison on the next line
        if @operators.include?(earlier_operator) and @operators[component] <= @operators[earlier_operator] # First checks for a nil if the precedence of the current operator is less than or equal to the earlier operator
          rpn << operator_stack.pop #then add the earlier value to the rpn
        end
        operator_stack << component #Add the component to the operator stack (This is the core)

      elsif component == "(" #opening paren always goes on the operator stack
        operator_stack << component
      elsif component == ")"
        until operator_stack.last == "("
          rpn << operator_stack.pop #add everything on the operator stack to the rpn until we get to the opening paren
        end
        operator_stack.pop #this gets rid of the closing paren
      else
        rpn << NumeralParser.to_arabic(component)
      end
    end
    until operator_stack.empty?
      rpn << operator_stack.pop
    end
    rpn
  end
end
