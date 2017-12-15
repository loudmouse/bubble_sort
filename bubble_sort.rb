#PART 1------------------------------------------------
#Build a method #bubble_sort that takes an array and returns a sorted array.
#It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

numbers = [8,42,16,15,4,23]

def bubble_sort(array)
  array_size = array.size-1
  array_size.times do
    index = 0
    while index < array_size
      if array[index] > array[index+1]
        #using multiple/parallel assignment to swap the index values of the variables in the array
        #not recommended for defining variables per the ruby style guide (see link below), but ok for swapping variable assignment
        #https://github.com/bbatsov/ruby-style-guide#parallel-assignment
        array[index], array[index+1] = array[index+1], array[index]
      end
      index+=1
    end
  end
  return array
end
print "Unsorted numbers: #{numbers}"
puts
print "Sorted numbers: #{bubble_sort(numbers)}"
puts

#PART 2------------------------------------------------

#Now create a similar method called #bubble_sort_by which sorts an array but accepts a block.
#The block should take two arguments which represent the two elements currently being compared.
#Expect that the block’s return will be similar to the spaceship operator you learned about before –
#if the result of the block is negative, the element on the left is “smaller” than the element on the right.
#0 means they are equal.
#A positive result means the left element is greater. Use this to sort your array.


words = ["super", "cali", "fragil", "istic", "expi", "ali", "docious"]

def bubble_sort_by(array)
  l = array.length #6
  begin
    nothing_sorted = false
    swapped = false
    (l - 1).times do |i| #5 times do this
      if yield(array[i],array[i+1]) > 0 #if left is greater than right
      array[i], array[i + 1] = array[i + 1], array[i] #swap them
      nothing_sorted = true #something was sorted in this pass
      end
    end
  end until nothing_sorted == false #once we've iterated through the prescribed number of times and after nothing was sorted then everything is now in proper order and this can now exit
  array #returns the sorted array
end

print "Unsorted words: #{words}."
puts
print "Sorted words: #{bubble_sort_by(words){ |left,right| left.length - right.length}}"
puts
