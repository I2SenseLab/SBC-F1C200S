import math

# Function to check if a number is prime
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

# Find and print the first 100 prime numbers
count = 0
num = 2
while count < 100:
    if is_prime(num):
        print(num)
        count += 1
    num += 1
