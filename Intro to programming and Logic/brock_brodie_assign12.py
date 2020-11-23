# where one inputs a file
fileName = input("Enter the file name: ")

# where the file is read
data = open(fileName, 'r').readlines()
count = 0

# printing new line
print()

# printing the data line by line
for line in data:
    count = count + 1
    if count > 6:
        break
    print(line.strip())
