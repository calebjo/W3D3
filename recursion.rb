def rec_range(first, last)
    # return [] if last < first
    # return [first] if first == last

    # rec_range(first, )

    # # new_arr = []
    # # new_arr << [rec_range(first, last-1)].concat([last])

    # new_arr
 
    return [] if last < first
    return [first] if first == last

    new_arr = []
    new_arr += rec_range(first, last)
end

p rec_range(1, 2)
p rec_range(1, 5)