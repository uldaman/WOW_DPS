FP = {}

-- 左闭右开 (包含 from, 不包含 to)
FP.range = function(from, to, step)
    local nums, i = {}, 1
    for v = from, to - 1, step or 1 do
        nums[i] = v
        i = i + 1
    end
    return nums
end

FP.any = function(fun, gen_x, param_x, state_x)

end

FP.reduce = function(fn, init, list)
    local accumlator = init or list[1]

    if init then
        for _, v in ipairs(list) do
            accumlator = fn(accumlator, v)
        end
    else
        for i = 2, #list do
            accumlator = fn(accumlator, list[i])
        end
    end

    return accumlator
end

FP.pipe = function( ... )
    local args = { ... }
    return function(v)
        return FP.reduce(function(acc, fn) return fn(acc) end, v, args)
    end
end

FP.find = function(predicate, list, start)
    index = FP.findIndex(predicate, list, start)
    return index and list[index]
end

FP.findIndex = function(predicate, list, start)
    for i = start or 1, #list do
        if predicate(list[i]) then
            return i
        end
    end
    return nil
end
