-- Function to check if a number is prime
function is_prime(n)
    if n < 2 then
        return false
    end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false
        end
    end
    return true
end

-- Find and print the first 100 prime numbers
local count = 0
local num = 2
while count < 100 do
    if is_prime(num) then
        print(num)
        count = count + 1
    end
    num = num + 1
end
