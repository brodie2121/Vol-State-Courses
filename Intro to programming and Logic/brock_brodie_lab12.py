
def main():
    filename = input('Enter filename: ')  # asking for file name
    with open(filename, 'r') as f:
        for line in f:  # reading lines
            print(line.strip())  # printing the line


main()
