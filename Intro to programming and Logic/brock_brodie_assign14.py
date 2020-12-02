
# writing silly encription & adding IE
def silly_encrypter(input):
    encrypted = input[1:len(input)]+""+input[0]+"IE"
    return encrypted


# creating reverse function called silly_descrypter
def silly_decrypter(input):
    decrypted = input[-3]+""+input[0:-3]
    return decrypted


# printing each statement
print("English: Have a nice day")
print("Silly Encryption: ", silly_encrypter("have a nice day"))
print("Challenge #5: ", silly_decrypter(silly_encrypter("have a nice day")))
