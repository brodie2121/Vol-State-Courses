
# for regular expressions
import re

# for validating an Email
regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'


# validating Email
def check(email):

    # passing the regular expression
    if(re.search(regex, email)):
        print("true")

    else:
        print("false")


# Driver Code
if __name__ == '__main__':

    # Enter the email
    email = "brodiebrock@volstate.edu"
    # calling run function
    check(email)

    email = "johndoe!volstate.edu"
    check(email)
