
# how much do you make an hour?
hourlyRate = float(input("What is your hourly rate: "))
# how many hours did you work this week?
hoursWorked = float(input("How many hours did you work: "))

if hoursWorked <= 40:
    pay = hoursWorked * hourlyRate
elif hoursWorked > 40:
    pay = ((hoursWorked-40)*hourlyRate*1.5)+hourlyRate*40

print("The total weekly number is ", format(pay, '.2f'))
