
number = float(input("Enter the monster number: "))
flag = number % 2
if number > 36:
    print("ERROR")

# Monster 0 is purple.
if number == 0:
    print("PURPLE")
    # For monsters 1 through 10, the odd-numbered monsters are blue and the even-numbered monsters are black.
if flag == 0:
    print("The monster color is black")
else:
    print("The monster color is blue")


# Monster 0 is purple.
# For monsters 1 through 10, the odd-numbered monsters are blue and the even-numbered monsters are black.
# For monsters 11 through 18, the odd-numbered monsters are black and the even-numbered monsters are blue .
# For monsters 19 through 28, the odd-numbered monsters are blue and the even-numbered monsters are black.
# For monsters 29 through 36, the odd-numbered monsters are black and the even-numbered monsters are blue
