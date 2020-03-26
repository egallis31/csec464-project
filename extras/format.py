import os

cur_dir = os.getcwd()
# remember to edit file path for linux
file = open(str(cur_dir) + '\\Lab1\\linux-output.txt', "r")
data = {}
cur_cat = ''
cur_sub = ''
line = file.readline()

while line:
    if "----------" in line:
        category = line.split('----------')[1].strip()
        data[category] = {}
        cur_cat = category
        print(category)
    elif "**********" in line:
        sub_cat = line.split('**********')[1].strip()
        cur_sub = sub_cat
        data[cur_cat][sub_cat] = []
    else:
        if line == '\n':
            pass
        else:
            #data[cur_cat][cur_sub].append(line.strip())
            pass

    line = file.readline()

file.close()
print(data)