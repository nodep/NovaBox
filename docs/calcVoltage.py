# this calculates the best combination of voltage dividers for the four given voltages.
# sort the output of this program to get least number of resistor values and voltage error sum.

resistors = (10,11,12,13,15,16,18,20,22,24,27,30,
			33,36,39,43,47,51,56,62,68,75,82,91,
			100,110,120,130,150,160,180,200,220,
			240,270,300,330,360,390,430,470,510,
			560,620,680,750,820,910)
			
def getSet(vin, vtol, vref):
	dataSet = []
	for r1 in resistors:
		for r2 in resistors:
			vout = r1/(r1+r2)*vin
			verr = abs(vout - vref)
			if vtol > verr:
				dataSet.append((r1, r2, verr))
				
	return (vin, dataSet)

vtol = 0.01		# tolerance to abs(vout - vref)
vref = 2.5		# reference voltage

# 4	0.024	3.949	470	270	3.777	470	240	3.601	620	270	3.477	620	240		

dsets = []
dsets.append(getSet(3.949, vtol, vref))
dsets.append(getSet(3.777, vtol, vref))
dsets.append(getSet(3.601, vtol, vref))
dsets.append(getSet(3.477, vtol, vref))

combinationCounters = [0, 0, 0, 0]
done = False
while not done:
	# sum the total verr for this combination
	tverr = 0
	resistorValues = {}
	desc = ''
	for cnt in range(len(dsets)):
		dataEntry = dsets[cnt][1][combinationCounters[cnt]]
		r1 = dataEntry[0]
		r2 = dataEntry[1]
		resistorValues[r1] = 1
		resistorValues[r2] = 1
		tverr += dataEntry[2]
		desc += '{}\t{}\t{}\t'.format(dsets[cnt][0], r1, r2)
	
	print ('{}\t{}\t{}\t'.format(len(resistorValues), round(tverr, 3), desc))
		
	#print (cnts)
	# increment
	done = True
	for setcnt in range(len(combinationCounters)):
		combinationCounters[setcnt] += 1
		if combinationCounters[setcnt] < len(dsets[setcnt][1]):
			done = False
			break
		else:
			combinationCounters[setcnt] = 0
		
