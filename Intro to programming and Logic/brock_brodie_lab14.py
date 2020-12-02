
# for regular expressions
import re

# for validating an Email
regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'


# validating Email
def check(is_valid_email):

    # passing the regular expression
    if(re.search(regex, is_valid_email)):
        print("true")

    else:
        print("false")


# Driver Code
if __name__ == '__main__':

    # Enter the email
    is_valid_email = "brodiebrock@volstate.edu"
    # calling run function
    check(is_valid_email)

    is_valid_email = "johndoe!volstate.edu"
    check(is_valid_email)
