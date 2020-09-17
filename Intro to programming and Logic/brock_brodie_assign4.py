
number = int(input("Enter the monster number: "))

if number > 36:
    print("ERROR")

else:
    if(number % 2) == 0:
        print("The monster color is blue")
    else:
        print("The monster color is black")


# Monster 0 is purple.
# For monsters 1 through 10, the odd-numbered monsters are blue and the even-numbered monsters are black.
# For monsters 11 through 18, the odd-numbered monsters are black and the even-numbered monsters are blue .
# For monsters 19 through 28, the odd-numbered monsters are blue and the even-numbered monsters are black.
# For monsters 29 through 36, the odd-numbered monsters are black and the even-numbered monsters are blue
