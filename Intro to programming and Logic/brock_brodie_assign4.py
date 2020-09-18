number = int(input("Enter the monster number: "))

if number < 0 or 36 < number:
    color = 'error'
elif number == 0:
    color = 'Purple'
elif number <= 10 or (19 <= number and number <= 28):
    if number % 2 == 0:
        color = 'black'
    else:
        color = 'blue'
else:
    if number % 2 == 0:
        color = 'blue'
    else:
        color = 'black'

if color == 'error':
    print('Error')
else:
    print('The monster color is:', color)
