import re
import os
count=0
for i in os.listdir():
    with open(i) as f:
        var=f.read()
    filecount=len(re.findall(r'\+ \[ \]',var,re.M))
    if filecount:print(f'{i}: {filecount}'.rjust(28))
print(f'Total cout: {count}'.rjust(28))
