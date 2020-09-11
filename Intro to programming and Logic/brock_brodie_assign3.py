
hourlyRate = float(input("What is your hourly rate: "))
hoursWorked = float(input("How many hours did you work: "))
# if hoursWorked > 40:
#pay = (hourlyRate)

pay = (hourlyRate * hoursWorked)

print("The total weekly number is ", format(pay, '.2f'))
