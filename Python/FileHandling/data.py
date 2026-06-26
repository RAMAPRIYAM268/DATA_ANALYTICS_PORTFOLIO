import csv
with open(r"C:\Users\Ramapriya Murugesan\Desktop\DataAnalyticsPortfolio\Python\data.csv",'r') as file:
    data=csv.reader(file)
    for row in data:
        print(row)


import csv
with open(r"C:\Users\Ramapriya Murugesan\Desktop\DataAnalyticsPortfolio\Python\data.csv",'w',newline='') as file:
    writer=csv.writer(file)
    writer.writerow(["product","sales"])
    writer.writerow(["INK",25])
    writer.writerow(["PEN",25])

import csv
totalsales=0
with open(r"C:\Users\Ramapriya Murugesan\Desktop\DataAnalyticsPortfolio\Python\data.csv",'r') as file:
    reader=csv.DictReader(file)
    for row in reader:
        totalsales=totalsales+int(row['sales'])
        print(totalsales)


import csv
totalsales=0
with open(r"C:\Users\Ramapriya Murugesan\Desktop\DataAnalyticsPortfolio\Python\data.csv",'r') as file:
    reader=csv.DictReader(file)
    for row in reader:
        totalsales=totalsales+int(row['sales'])
        print(totalsales)
    averagesales=totalsales/len(row)
    print(averagesales)