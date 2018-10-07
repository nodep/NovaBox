import xml.etree.ElementTree as ET
# xml created by going to KiCad eeschema and go Tools/Bill of materials
tree = ET.parse('NovaBox_8635.xml')

root = tree.getroot()

for comp in root[1]:
	reference = comp.attrib['ref']
	value = comp[0].text

	if reference.startswith('R')  or  reference.startswith('C'):
		print (reference + ',' + value)