require "byebug"

def rec_range(first, last)
    return [] if last < first
    return [first] if first == last || last - first == first

    new_arr = rec_range(first, last - 1) 
        new_arr << last - first
end

# rec_range(1, 1) #[1] 
# p rec_range(1, 2)  #[1] << 2
# p rec_range(1, 3)  #[1, 2]
# p rec_range(1, 5)

def rec_sum(arr)
    return nil if arr.empty? 
    return arr[0] if arr.length == 1

    arr[0] + rec_sum(arr[1..-1])

end

def iter_sum(arr)
    sum = 0
    arr.each {|num| sum += num }
    sum
end

# --------------------------------------------------------------------------------
# Exponentiation

def rec_expo1(b, n)
    return 1 if n == 0
    return b if n == 1

    rec_expo(b, n - 1) * b
end

def rec_expo2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        rec_expo2(b, n / 2) * b
    else
        b * (rec_expo2(b, (n - 1) / 2) * b)
    end
end

# --------------------------------------------------------------------------------
# Deep Dup

class Array  #["a", "b", "c"]
    def deep_dup
        return nil if self.empty?
        return self if !self.is_a?(Array)
        new_arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else
                new_arr << ele
            end
        end
        new_arr
    end
end

# p [1, 1, [2], [3, [4]]].deep_dup
# p [1, [2,3,[4]], [2], [3, [4]]].deep_dup

# --------------------------------------------------------------------------------
# Fibonacci

def fib(n)
    return [0] if n == 0
    return [0, 1] if n == 1

    array = fib(n - 1)
    array << array[-2] + array[-1]
end


def iter_fib(n)
    return [0] if n == 0
    return [0, 1] if n == 1

    new_arr = [0, 1]
    
    (n - 1).times {new_arr << new_arr[-2] + new_arr[-1]}
    
    new_arr
end

# --------------------------------------------------------------------------------
# Binary Search

def bsearch(array, target)
    midpoint = array.length / 2 
    return nil if !array.include?(target)
    return midpoint if target == array[midpoint]

    if target < array[midpoint]
        bsearch(array[0..midpoint-1], target) # first half
    else
        midpoint + bsearch(array[midpoint..-1], target) # last half
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# --------------------------------------------------------------------------------
# Merge Sort

def merge_sort(arr)
    midpoint = arr.length / 2
    return arr if arr.length == 1

    first_half = arr[0..(midpoint-1)]
    second_half = arr[midpoint..-1]

    merge(merge_sort(first_half), merge_sort(second_half))
end

def merge(arr1, arr2)
    new_arr = []
    
    while (!arr1.empty? && !arr2.empty?)
        if arr1.first < arr2.first
            new_arr << arr1.shift
        else
            new_arr << arr2.shift
        end
    end
    new_arr + arr1 + arr2
end

# p merge_sort([1,4,3,2])
# p merge_sort([1,3,6,22,66,44,100])
# p merge_sort([38,27,43,3,9,82,10])

# --------------------------------------------------------------------------------
# Array Subsets

def subsets(array)
    return [[]] if array.length == 0
    return [[],array] if array.length == 1

    #subsets(array.length - 1).push(array)
    subsets(array[0...-1]) << subsets(array.last) # => [[], [1], [2], [1, 2],TURNS INTO [3], [1, 3], [2, 3], [1, 2, 3]]
end

p subsets([1,2,3])