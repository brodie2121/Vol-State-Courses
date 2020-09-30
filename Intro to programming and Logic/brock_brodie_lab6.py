# Write a for loop that prints 1 to 10 to the console:
for i in range(1, 11):
    print(i)

# Write a while loop that prints "Energizer Bunny keeps on going and going... " as long as a
# variable called "status" is true. Each loop as the user whether to keep going. If the user says
# "y", then run the while loop again.
status = True

while status:
    user_input = input(" Energizer Bunny keeps on going and going... " +
                       " would you like to print this again? ")
    if user_input == "yes":
        print(user_input)
    else:
        user_input == "no"
        should_run = False

        print("bye")
