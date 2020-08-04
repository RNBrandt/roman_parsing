require_relative '../roman_calculator'
require 'spec_helper'

describe RomanCalculator do
  it 'Should return integers' do
    expect(RomanCalculator.evaluate_roman_equation('I')).to be_a(Float)
  end
  it 'Should add subtract multiply and divide' do
    expect(RomanCalculator.evaluate_roman_equation('I + II')).to eq(3)
    expect(RomanCalculator.evaluate_roman_equation('I - II')).to eq(-1)
    expect(RomanCalculator.evaluate_roman_equation('I * II')).to eq(2)
    expect(RomanCalculator.evaluate_roman_equation('I / II')).to eq(0.5)
  end
  it 'Should handle multiple operators' do
    expect(RomanCalculator.evaluate_roman_equation('I + II + III')).to eq(6)
    expect(RomanCalculator.evaluate_roman_equation('I - II - III')).to eq(-4)
    expect(RomanCalculator.evaluate_roman_equation('I * II * III')).to eq(6)
    expect(RomanCalculator.evaluate_roman_equation('I / II / III')).to be_within(0.01).of(0.166)
  end
  it 'Should handle different types of operators following PEMDAS' do
    expect(RomanCalculator.evaluate_roman_equation('I + II * III')).to eq(7)
    expect(RomanCalculator.evaluate_roman_equation('I * II + III')).to eq(5)
  end
  it 'Should continue to follow PEMDAS with parentheses' do
    expect(RomanCalculator.evaluate_roman_equation('( I + II ) * III')).to eq(9)
    expect(RomanCalculator.evaluate_roman_equation('I * ( II + III )')).to eq(5)
  end
end
