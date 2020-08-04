require_relative '../numeral_parser'


describe NumeralParser do
  it 'Should return integers' do
    expect(NumeralParser.to_arabic('I')).to be_a(Float)
  end
  it 'Should parse simple single digit numbers' do
    expect(NumeralParser.to_arabic('I')).to eq(1)
  end
  it 'Should evaluate single digit edge cases correctly' do
    expect(NumeralParser.to_arabic('IV')).to eq(4)
    expect(NumeralParser.to_arabic('IX')).to eq(9)
  end
  it 'Should evaluate larger numbers' do
    expect(NumeralParser.to_arabic('MCMXCIV')).to eq(1994)
  end
end
