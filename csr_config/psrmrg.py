import sys

class PsrEntry:
	# contains data for a single entry in the psr file
	def __init__(self):
		self.name		= ''
		self.addr		= 0
		self.value		= 0
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
					entry.value = line[8:]

				ndx = entry.value.find('//')
				if ndx != -1:
					entry.comment = entry.value[ndx:]
					entry.value = entry.value[0:ndx]
					
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
		
	origVals = readPsrFile(sys.argv[1])
	newVals = readPsrFile(sys.argv[2])
	outFile = sys.argv[3]

	with open(outFile, 'w') as outf:
		for nv in newVals:
			srchEntry = next((ov for ov in origVals if ov.addr == nv.addr), None)
			if srchEntry.value.lower() != nv.value.lower():
				print ('## ----------------------', file=outf)
				print ('## overwriting', srchEntry.name, file=outf)
				print ('## addr ', srchEntry.addr, file=outf)
				print ('## value', srchEntry.value, file=outf)
				print ('## with ', nv.value, file=outf)
			
				srchEntry.value = nv.value
				srchEntry.comment += nv.comment[2:]

		print ('', file=outf)

		for entry in origVals:
			print (entry, file=outf)
			
	print ('successfuly merged {} and {} into {}'.format(sys.argv[1], sys.argv[2], sys.argv[3]))
		
except (FileNotFoundError, RuntimeError) as ex:
	print (ex)
	usage()
	exit(1)
	
except:
	print ('Error: unknown exception')
	usage()
	exit(1)

exit(0)