
def showInches(feet):

    print(feet, "feet=", feet*12, " inches")


def showYards(yards):

    print(yards, "yards=", yards*3, "feet")


def showMilesToYards(miles):

    print(miles, "miles=", miles*1760, "yards")


def showMilesToFeet(miles):

    print(miles, "miles=", miles*5280, "feet")


def menu():

    print("1.Convert feet to inches\n")
    print("2.convert yards to feet\n")

    print("3.Convert miles to yards\n")
    print("4.convert miles to feet\n")

    print("5.Quit the program\n")


while(True):
    menu()
    option = int(input('Enter your choice:'))
    if(option not in [1, 2, 3, 4]):
        print('invalid choice. please try again')
    else:

        if(option == 1):
            feet = float(input('enter no of feet:'))
            showInches(feet)
        if(option == 2):
            yards = float(input('enter no of yards:'))
            showYards(yards)
        if(option == 3):
            miles = float(input('enter no of miles:'))
            showMilesToYards(miles)
        if(option == 4):
            miles = float(input('enter no of miles:'))
            showMilesToFeet(miles)
        if(option == 5):
            print('Quiting...')
            break
