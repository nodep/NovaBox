import sys

class PsrEntry:
	# contains data for a single entry in the psr file
	def __init__(self):
		self.name		= ''
		self.addr		= 0
		self.value		= ''
		self.comment	= ''	
		
	def __repr__(self):
		return '// {}\n{} = {}{}'.format(self.name, self.addr, self.value, self.comment)

def readPsrFile(fileName):

	psrData = []
	with open(fileName) as inf:

		entry = PsrEntry()
		for line in inf:
			line = line.strip()
			if not line:
				continue
			if line[0:2] == '//':
				entry.name = line[2:].strip()
			elif line[0] == '&':
				entry.addr = line[0:5]
				if len(line) > 7:
					entry.value = line[8:].strip()

				ndx = entry.value.find('//')
				if ndx != -1:
					entry.comment = entry.value[ndx:]
					entry.value = entry.value[0:ndx].strip()
					
				if entry.value:
					psrData.append(entry)
					
				entry = PsrEntry()
				
	psrData.sort(key=lambda e: e.addr)
	
	return psrData
	
def usage():
	print ('usage:\n')
	print ('psrmrg.py start.psr or.psr out.psr')
	print ('')
	print ('where:   start.psr   is dump from PSTool')
	print ('         or.psr      is a psr created from the ConfigTool')
	print ('         out.psr     output of the merge')
	print ('\nmerges start.psr with or.psr and write the result to out.psr')
	
try:
	if len(sys.argv) < 4:
		raise RuntimeError('Error: not enough params')
		
	startFile = sys.argv[1]
	orFile   = sys.argv[2]
	
	startVals = readPsrFile(startFile)
	orVals = readPsrFile(orFile)
	outFile = sys.argv[3]

	with open(outFile, 'w') as outf:
		for ov in orVals:
			srchEntry = next((sv for sv in startVals if sv.addr == ov.addr), None)
			if not srchEntry:
				raise RuntimeError('Value in {} with address {} not found in {}'.format(orFile, ov.addr, startFile))
				
			srchEntry.name = ov.name
			
			if srchEntry.value.lower() != ov.value.lower():
				if srchEntry.addr == '&028d':
					if ov.value != srchEntry.value[0:len(ov.value)]:

						joinedValue = ov.value + srchEntry.value[len(ov.value):]

						print ('## ----------------------', file=outf)
						print ('## joining ', srchEntry.name, file=outf)
						print ('## addr  ', srchEntry.addr, file=outf)
						print ('## value ', srchEntry.value, file=outf)
						print ('## with  ', ov.value, file=outf)
						print ('## joined', joinedValue, file=outf)

						srchEntry.value = joinedValue
						srchEntry.comment += ov.comment[2:]
					else:
						print ('## ----------------------', file=outf)
						print ('## ignoring difference in &028d', file=outf)
						
				else:
					
					print ('## ----------------------', file=outf)
					print ('## overwriting', srchEntry.name, file=outf)
					print ('## addr ', srchEntry.addr, file=outf)
					print ('## value', srchEntry.value, file=outf)
					print ('## with ', ov.value, file=outf)
			
					srchEntry.value = ov.value
					srchEntry.comment += ov.comment[2:]

		print ('', file=outf)

		for entry in startVals:
			print (entry, file=outf)
			
	print ('successfuly merged {} and {} into {}'.format(sys.argv[1], sys.argv[2], sys.argv[3]))
		
except (FileNotFoundError, RuntimeError) as ex:
	print (ex)
	usage()
	exit(1)
	
#except:
#	print ('Error: unknown exception')
#	usage()
#	exit(1)

exit(0)