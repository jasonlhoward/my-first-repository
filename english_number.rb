def english_number(number)
  return 'Please enter a number greater than zero!' if number < 0
  return 'zero' if number.zero?
  # 1123 => ['1', 1', '2', '3']
  arr_nums = number.to_s.scan(/\w/)
  # ['1', 1', '2', '3'] => ['0', '0', 1', 1', '2', '3']
  arr_nums.unshift('0') while arr_nums.length % 3 > 0
  
  english_string = ''
  i = 0
  scale = arr_nums.length/3
  loop do
    break if i >= arr_nums.length
    english_string += " #{hecto(arr_nums[i..i+2], scale)}" if !arr_nums[i..i+2].join.to_i.zero?
    i += 3
    scale -= 1
  end
  english_string.strip
end

def hecto(arr, scale)
  ones_teens = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  tens = %w(twenty thirty forty fifty sixty seventy eighty ninety)
  scales = %w(zero hundred thousand million billion trillion quadrillion quintillion sextillion septillion)
  s = ''
  s = "#{ones_teens[arr[0].to_i-1]}-hundred" if !arr[0].to_i.zero?
  if (arr[1].to_i.zero? || arr[1].to_i == 1) && !arr[1..2].join.to_i.zero?
    s += " #{ones_teens[arr[1..2].join.to_i - 1]}"
  else
    s += " #{tens[arr[1].to_i - 2]}" if !arr[1].to_i.zero?
    s += "-#{ones_teens[arr[2].to_i - 1]}" if !arr[2].to_i.zero?
  end
  s += " #{scales[scale]}" if scale >= 2
  s.strip
end

puts english_number(6_000_672_877)
