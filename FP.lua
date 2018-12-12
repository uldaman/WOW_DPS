FP = {}

FP.reduce = function(list, fn, init)
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
        return FP.reduce(args, function(acc, fn) return fn(acc) end, v)
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
