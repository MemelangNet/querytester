import os
import csv

COUNT = 5

As = [
    'ant', 'bat', 'cat', 'deer', 'eagle', 'fish', 'goat', 'hawk', 'ibex', 'jackal',
    'kangaroo', 'lion', 'mink', 'newt', 'owl', 'pig', 'quail', 'rat', 'seal', 'tiger',
    'urchin', 'viper', 'wolf', 'xerus', 'yak', 'zebra'
]

Rs = [
    'admire', 'believe', 'create', 'discover', 'explore', 'feel', 'gather', 'help',
    'imagine', 'join', 'know', 'learn', 'measure', 'notice', 'observe', 'perform',
    'question', 'reflect', 'support', 'transform', 'understand', 'visualize', 'wonder',
    'xerox', 'yield', 'zoom'
]

Bs = [
    'amsterdam', 'bangkok', 'cairo', 'dubai', 'edinburgh', 'florence', 'geneva',
    'helsinki', 'istanbul', 'jakarta', 'kyoto', 'lisbon', 'mumbai', 'nairobi', 'oslo',
    'prague', 'quito', 'rome', 'sydney', 'tokyo', 'ulaanbaatar', 'vienna', 'warsaw',
    'xian', 'yokohama', 'zurich'
]

# Remove files if they already exist
if os.path.exists('data.csv'):
    os.remove('data.csv')
if os.path.exists('data.mem'):
    os.remove('data.mem')

# Open files for writing
with open('data.csv', 'w', newline='') as csv_file, open('data.mem', 'w') as mem_file:
    csv_writer = csv.writer(csv_file, delimiter='\t')
    
    for a in range(COUNT):
        animal = As[a]
        for r in range(COUNT):
            verb = Rs[r]
            for b in range(COUNT):
                city = Bs[b]
                q = 0 if a == r or b == r else 1
                
                # Write to CSV file
                if q == 1:
                    csv_writer.writerow([animal, verb, city])
                
                # Write to mem file
                mem_file.write(f"{animal}.{verb}:{city}={q};\n")