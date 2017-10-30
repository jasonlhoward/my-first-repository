org = ['origin', 'Master', 'head', 'Unstage']
# preserve the orginal
unsorted = org
sorted = []

# assume the smallest word is the last one
def smallest_to_sorted(unsorted, sorted)
  return if unsorted.length == 0
  smallest = unsorted.pop
  unsorted.each_with_index do |word, index|
    if word.downcase < smallest.downcase
      unsorted.push(smallest)
      unsorted.delete_at(index)
      smallest = word
    end
  end
  sorted.push(smallest)
  smallest_to_sorted(unsorted, sorted)
end

smallest_to_sorted(unsorted, sorted)

puts unsorted
puts ' '
puts sorted