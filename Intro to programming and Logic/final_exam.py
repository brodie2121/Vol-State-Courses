
# creating function
def list_writer(list):

    # file opening
    file = open("colors.txt", "w")

    # giving items directions
    for items in list:

        # write items into txt file
        file.write(items)

        # close file
        file.close()


# list of items going into txt file
list = ["Red" "\n" "Yellow" "\n" "Blue"]

# executing task
list_writer(list)
