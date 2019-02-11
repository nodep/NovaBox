# this calculates the best combination of voltage dividers for the given voltages.
# sort the output of this program to get least number of resistor values and voltage error sum.

# standard 5%
resistors_5p = [10,11,12,13,15,16,18,20,22,24,27,30,
				33,36,39,43,47,51,56,62,68,75,82,91]
			
# standard 2%
resistors_2p = [10.0,10.5,11.0,11.5,12.1,12.7,13.3,14.0,
				14.7,15.4,16.2,16.9,17.8,18.7,19.6,20.5,
				21.5,22.6,23.7,24.9,26.1,27.4,28.7,30.1,
				31.6,33.2,34.8,36.5,38.3,40.2,42.2,44.2,
				46.4,48.7,51.1,53.6,56.2,59.0,61.9,64.9,
				68.1,71.5,75.0,78.7,82.5,86.6,90.9,95.3]

# standard 1%
resistors_1p = [10.0,10.2,10.5,10.7,11.0,11.3,11.5,11.8,
				12.1,12.4,12.7,13.0,13.3,13.7,14.0,14.3,
				14.7,15.0,15.4,15.8,16.2,16.5,16.9,17.4,
				17.8,18.2,18.7,19.1,19.6,20.0,20.5,21.0,
				21.5,22.1,22.6,23.2,23.7,24.3,24.9,25.5,
				26.1,26.7,27.4,28.0,28.7,29.4,30.1,30.9,
				31.6,32.4,33.2,34.0,34.8,35.7,36.5,37.4,
				38.3,39.2,40.2,41.2,42.2,43.2,44.2,45.3,
				46.4,47.5,48.7,49.9,51.1,52.3,53.6,54.9,
				56.2,57.6,59.0,60.4,61.9,63.4,64.9,66.5,
				68.1,69.8,71.5,73.2,75.0,76.8,78.7,80.6,
				82.5,84.5,86.6,88.7,90.9,93.1,95.3,97.6]

def makeAllResistors(resIn):
	resistors = resIn.copy()
	for r in resIn:
		resistors.append(r * 10)
	for r in resIn:
		resistors.append(r * 100)
	for r in resIn:
		resistors.append(r * 1000)
	return resistors

resistors = makeAllResistors(resistors_1p)

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

def calcResistors():
	vtol = 0.05		# tolerance to abs(vout - vref)
	vref = 2.5		# reference voltage

	# input voltages for single LiIon 4.2V cell
	vins = (3.949, 3.777, 3.601, 3.477)

	maxResistors = 5
	maxTotalError = vins[0] * .01

	dsets = []
	for vin in vins:
		dsets.append(getSet(vin, vtol, vref))

	print ('# of resistors	total error V max={}	total current (mA) at vin1	Vout	R1	R2	Vout	R1	R2	Vout	R1	R2	Vout	R1	R2'.format(round(maxTotalError, 3)))
	combinationCounters = [0] * len(vins)
	done = False
	while not done:
		# sum the total verr for this combination
		tverr = 0
		tcurr = 0
		resistorValues = {}
		desc = ''
		for cnt in range(len(dsets)):
			dataEntry = dsets[cnt][1][combinationCounters[cnt]]
			vin = dsets[cnt][0]
			r1 = dataEntry[0]
			r2 = dataEntry[1]
			resistorValues[r1] = 1
			resistorValues[r2] = 1
			tverr += dataEntry[2]
			tcurr += vin / (r1 + r2)
			desc += '\t{}\t{}\t{}'.format(vin, r1, r2)
		
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
			
def calcMax6457():
	
	lipoCell = 3.2	# cutoff voltage of a single LiPo cell
	
	vTripGoals = (	3 * lipoCell,	# 3 cell LiPo
					4 * lipoCell,	# 4 cell LiPo
					11.2,			# PbAc
					)
					
	vTh = (1.093 + 1.151) / 2		# average of min and max from the datasheet

	results = []
	for r1 in resistors:
		res = [r1]	# add the upper resistor in the voltage divider

					# r2 vTrip  vErr  uA
		res.extend([	0,   0, 1000,  0] * len(vTripGoals))

		for r2 in resistors:
			# calc the trip and current for r1/r2
			vTrip = (r1/r2 + 1) * vTh
			current = vTrip / (r1 + r2)

			# compare with previous values
			for cnt in range(len(vTripGoals)):
				ndx = 1 + cnt*4
				vErr = abs(vTripGoals[cnt] - vTrip)
				
				# is this better?
				if vErr < res[ndx + 2]:
					res[ndx]     = r2
					res[ndx + 1] = vTrip
					res[ndx + 2] = vErr
					res[ndx + 3] = current * 1000

		# totals for the XL table
		res.extend(('=SO4+SO8+SO12', ))

		results.append(res)

	print ('r1 K' + '\tr2 K\tvTrip\tvErr\tuA' * len(vTripGoals) + '\tvErrTot')

	for res in results:
		if res[0] >= 470:
			row = ''
			for elem in res:
				row += '\t' if row else ''
				row += elem if isinstance(elem, str) else str(round(elem, 3))
			print (row)

calcMax6457()