import csv, io

# Sample sales data (acts as our CSV file for now)
data = """order_id,category,amount
1,Electronics,250.00
2,Grocery,45.50
3,Electronics,1200.00
4,Clothing,80.00
5,Grocery,12.25
6,Clothing,150.00
7,Electronics,99.99
"""

# Running total for each category, e.g. {"Electronics": 1549.99, ...}
totals = {}

reader = csv.DictReader(io.StringIO(data))
for row in reader:
    category = row["category"]
    amount = float(row["amount"])   # text "250.00" -> number 250.0

    if category not in totals:
        totals[category] = 0
    totals[category] = totals[category] + amount

# Print each category total with 2 decimal places
for category, total in totals.items():
    print(f"{category}: {total:.2f}")

print(f"Grand total: {sum(totals.values()):.2f}")
