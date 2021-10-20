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
                ele.deep_dup
            else
                new_arr << ele
            end
        end
        new_arr
    end
end




p [1, 1, [2], [3, [4]]].deep_dup