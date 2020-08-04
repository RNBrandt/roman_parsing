# Project Requirements 
Implement a calculator that takes its input as a string, with numbers written as Roman Numerals, and outputs
the result as a decimal value. Your solution should obey the standard order of operations, and should support
`+ , - , * , /` and parentheses.

## To Test
From the project root `rspec spec/roman_calculator_spec.rb` or `rspec spec/numeral_parser_spec.rb` to test the
calculator and numeral parser respectively.   

## Of Note
I want to make it clear from the outset that this is my implementation of the Shunting Yard Algorithm originally 
created by Edsger Dijkstra, and my implementation of evaluating Reverse Polish Notation.  There are ruby standards 
to complete these algorithms which I referenced; however this code is mine. 


