def rev_range(first, last)
    return [] if last < first
    return [first] if first == last

    new_arr = []
    new_arr << rev_range(first, last-1).concat([last])

    new_arr
end

p rev_range(1, 5)