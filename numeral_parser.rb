class NumeralParser
  # Simple recursive algorithm to parse roman numerals
  # into arabic numerals. As written this won't handle
  # negative numbers, lowercase numerals, or very high numbers.
  @arabic_to_roman = {
      1000.0 => "M",
      900.0 => "CM",
      500.0 => "D",
      400.0 => "CD",
      100.0 => "C",
      90.0 => "XC",
      50.0 => "L",
      40.0 => "XL",
      10.0 => "X",
      9.0 => "IX",
      5.0 => "V",
      4.0 => "IV",
      1.0 => "I"
  }.freeze

  def self.to_arabic(str = self, result = 0)
    #This iterates over a list of roman numerals in order of highest value to lowest value.
    # Once it has found a match using the starts_with? method it adds that value to the result, and removes those
    # values from the beginning of the input string. It iterates through recursively until the input string is empty
    # returning the sum of each of the iterations.
    return result if str.empty?
    @arabic_to_roman.values.each do |roman|
      if str.start_with?(roman)
        result += @arabic_to_roman.invert[roman]
        str = str.slice(roman.length, str.length)
        return to_arabic(str, result)
      end
    end
  end
end
