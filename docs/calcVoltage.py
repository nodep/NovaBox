# this calculates the best combination of voltage dividers for the four given voltages.
# sort the output of this program to get least number of resistor values and voltage error sum.

resistors = (10,11,12,13,15,16,18,20,22,24,27,30,
			33,36,39,43,47,51,56,62,68,75,82,91,
			100,110,120,130,150,160,180,200,220,
			240,270,300,330,360,390,430,470,510,
			560,620,680,750,820,910)
			
vtol = 0.05		# tolerance to abs(vout - vref)
vref = 2.5		# reference voltage

# input voltages for single LiIon 4.2V cell
#vin1 = 3.949
#vin2 = 3.777
#vin3 = 3.601
#vin4 = 3.477

# input voltages for two LiIon cells totaling 8.4V
vin1 = 7.898
vin2 = 7.554
vin3 = 7.202
vin4 = 6.954

maxResistors = 6
maxTotalError = vin1 * .01

##################################################
##################################################
##################################################

def getSet(vin, vtol, vref):
	dataSet = []
	for r1 in resistors:
		for r2 in resistors:
			vout = r1/(r1+r2)*vin
			verr = abs(vout - vref)
			if vtol > verr:
				dataSet.append((r1, r2, verr))

	if len(dataSet) == 0:
		raise RuntimeError("vtol is too limiting; data set is empty for voltage: {}".format(vin))
		
	return (vin, dataSet)

dsets = []
dsets.append(getSet(vin1, vtol, vref))
dsets.append(getSet(vin2, vtol, vref))
dsets.append(getSet(vin3, vtol, vref))
dsets.append(getSet(vin4, vtol, vref))

print ('# of resistors	total error V max={}	total current (mA) at vin1	Vout	R1	R2	Vout	R1	R2	Vout	R1	R2	Vout	R1	R2'.format(round(maxTotalError, 3)))
combinationCounters = [0, 0, 0, 0]
done = False
while not done:
	# sum the total verr for this combination
	tverr = 0
	tcurr = 0
	resistorValues = {}
	desc = ''
	for cnt in range(len(dsets)):
		dataEntry = dsets[cnt][1][combinationCounters[cnt]]
		r1 = dataEntry[0]
		r2 = dataEntry[1]
		resistorValues[r1] = 1
		resistorValues[r2] = 1
		tverr += dataEntry[2]
		tcurr += vin1 / (r1 + r2)
		desc += '\t{}\t{}\t{}'.format(dsets[cnt][0], r1, r2)
	
	if len(resistorValues) <= maxResistors  and  tverr <= maxTotalError:
		print ('{}\t{}\t{}{}'.format(len(resistorValues), round(tverr, 3), round(tcurr, 3), desc))

	# increment combination counters
	done = True
	for setcnt in range(len(combinationCounters)):
		combinationCounters[setcnt] += 1
		if combinationCounters[setcnt] < len(dsets[setcnt][1]):
			done = False
			break
		else:
			combinationCounters[setcnt] = 0
		
