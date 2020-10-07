
while 1:
    # asking and validating number
    num = input("Enter the maximum number for the multiplication table: ")
    if num == '-1':
        exit()
    elif not num.isdigit():
        print("invalid number ")
    else:
        num = int(num)
        count = 0
        x = 1
        y = 0
        # How many tables per column 
        col_size = 1
        print()
        # Nested loop begins
        while num > 0:
            # Column size
            if not count:
                if num >= col_size:
                    y = col_size
                    num -= col_size
                else:
                    y = num
                    num = 0

            if count:
                x = y + 1
                if num >= col_size:
                    y = y + col_size
                    num -= col_size
                else:
                    y = y + num
                    num = 0
            # printing the table
            for i in range(1, 13):
                for j in range(x, y + 1):
                    print("{:<3} x {:<2} = {:<3}".format(j, i,(i * j)), end =" ")
                print()
            print("\n")
            count += 1
