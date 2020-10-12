sum = 0
while True:
    n = int(input("Enter a positive number: "))

    if n == -1:
        break
    sum += n
print ("Sum is %d"%sum)