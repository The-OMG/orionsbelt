// See output.txt for instructions on setting output path.

myFile = new File("$HOME\\orionsbelt\\fileBot\\output.txt")

def input  = args.getFiles()
// def format = new URL('https://raw.github.com/CapriciousSage/schemes/master/anime.txt').getText()
def format = new File('$HOME\\orionsbelt\\fileBot\\schemes\\anime.txt').getText()

def output = myFile.readLines().get(0)

rename(file:input, format:format, output:output)