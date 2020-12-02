try:
    file1 = open('grades.txt', 'r')
except:
    print('File Not found. ')

# Store each line in a list called content
Content = file1.read()
# remove newline character from each line
lines = Content.split("\n")

# number of records in a file
record_count = len(lines)


name = ''
max_score = 0
# Split list contents with respect to semicolan
for line in lines:
    line = line.split(';')
    score = int(line[1])

    # Find the highest grade
    if (score > max_score):
        max_score = score
        name = line[0]

print('Name and grade of the student with highest score : ', name, ' ', max_score)
print('Numner of records in a file :', record_count)
