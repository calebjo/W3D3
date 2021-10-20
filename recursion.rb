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

def iter_sum(arr)
    return nil if arr.empty? 
    return arr[0] if arr.length == 1

    arr[0] + iter_sum(arr[1..-1])

end

