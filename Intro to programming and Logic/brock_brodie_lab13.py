

# writing the file name
FILENAME = "/Users/brodiebrock/Vol-State-Courses/Intro to programming and Logic/movies.txt"

# loading the file name


def displaycontents(filename):
    fp = open(filename)
    print(fp.read())
    fp.close()


# putting text in new file
displaycontents(FILENAME)
fp = open(FILENAME, "a")
while True:
    text = input("Please enter a line of text: ")
    if text == "":
        break
    fp.write(text+"\n")
fp.close()
displaycontents(FILENAME)
