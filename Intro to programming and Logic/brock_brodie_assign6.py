# What are the variables?
total = 0
average = 0

# How many days did the User collect gems?
gems = int(input("How many days did you collect gems? "))
for i in range(gems):

    # The data from the User
    print("Enter the number of gems collected on day ", i + 1, end=": ")

# Calculating the total gems collected
    n = int(input())
    total += n

# Calculating the average gems per day
average = total/gems

# Printing the total and average gems per day
print("Total gems collected: ", total)
print("Average gems collected per day: ", average)
