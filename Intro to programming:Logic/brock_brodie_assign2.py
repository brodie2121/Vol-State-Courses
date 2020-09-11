# print giant letters P and Y using Python print statements
for row in range(6):
    for col in range(30):
        if col == 0 or (col == 7 and (row == 1 or row == 2)) or ((row == 0 or row == 3) and (col > 0 and col < 3)):
            print("PP", end="")

        if (col == 18 and row > 3) or (row == 1 and col == 13) or (row == 2 and col == 16) or (row == 1 and col == 18) or (row == 0 and col == 18) or (row == 3 and col == 14) or (row == 0 and col == 9) or (row == 2 and col == 15):
            print("YY", end="")
        else:
            print(end=" ")
    print()

# Define three variables and set them equal to appropriate values
my_name = "Brodie"       # A string
my_age = 25          # An integer assignment
my_last_meal = 1000.45       # A floating point

print(my_name)
print(my_age)
print(my_last_meal)

# Print the data type of my_name, my_age, and my_last_meal variables using Python's type function
my_name = "Bill"      # A string
my_age = 31          # An integer assignment
my_last_meal = 3.32       # A floating point

print(my_name, type(my_name))
print(my_age, type(my_age))
print(my_last_meal, type(my_last_meal))
