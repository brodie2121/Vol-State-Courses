# testing to see if two integers are equal
def is_Equal(x, y):
    if x == y:

        # if integers are equal return boolean true
        return True
    else:

        # if integers are not equal return boolean false
        return False


# calling to find the result
if __name__ == '__main__':

    # what we are comparing
    result = is_Equal("Hello World", "Hello World")

# if result is true print Equal
    if result == True:
        print("Equal")
    else:

        # if result is false print not equal
        print("Not Equal")
