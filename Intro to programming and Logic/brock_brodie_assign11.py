numbers = [1000, 47, -69, 44, 21, 32, 687, 101, -23, 87, 89, 90, 200,
           75, 62, 0, -99, 10, 51, 49, 29, 19, 105, -20, -2, 67, 79, 124, -45, -38, 100,
           64, 13, 92, 5, 61, 1, 184, 140, 65, 145, 52, 162, 114, 3, 133, 108, 83, 147, 197, 117, 88, 196, 126, 70, 136, 59, 84, 68, 163, 141, 76, 142, 69, 93, 168, 169, 148, 158, 170, 86, 96, 190, 146, 99, 28, 149, 107, 164, 153, 38, 11, 46, 109, 180, 31, 15, 143, 186, 26, 167, 151, 74, 155, 160, 171, 43, 199, 6, 144, 161, 4, 128, 63, 34, 154, 89, 54, 106, 104, 27, 172, 119, 77, 135, 176, 56, 101, 150, 189, 134, 14, 50, 157, 22, 33, 138, 193, 177, 20, 73, 192, 130, 120, 100, 118, ]
# declaring empty list to store the valid numbers according to given condition
valid_numbers = []
# defining sum as 0 intially to add sum to this variable
total = 0
# looping through the given list
for i in numbers:
    # checking the condition number should be in range 0 to 100
    if(i > 0 and i < 100):
        # if condition true adding the value to sum
        total = total+i
# adding value to new list
        valid_numbers.append(i)

# printing valid numbers
print(valid_numbers)
# printing total
print(total)
# printing average of valid list of nmbers
print(total/len(valid_numbers))
