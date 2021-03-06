
def create_csv(dbFile, logFile, nameFile):
	fileDB = open(dbFile)
	fileServer = open(logFile)

	linesDB = fileDB.readlines()[0].strip().split("\\n")
	linesServer = fileServer.readlines()

	lineN = 0
	lineServer = 0
	result = "requisicaoN,tempoBanco,tempoHTTP\n"

	#print (len(linesDB)-2, len(linesServer)-1)
	for i in range(0,len(linesDB)-1,2):

		bDB = float(linesDB[i].split(",")[-1].split(" ")[0]) + float(linesDB[i].split(",")[-1].split(" ")[1])
		aDB = float(linesDB[i+1].split(",")[-1].split(" ")[0]) + float(linesDB[i+1].split(",")[-1].split(" ")[1])
		resultDB = aDB - bDB

		bServer = float(linesServer[lineServer].split(" ")[0])
		aServer = float(linesServer[lineServer+1].split(" ")[0])
		resultServer = (aServer - bServer) * (10**-9)

		while(resultServer > 8):
			#print resultServer
			lineServer += 2
			bServer = float(linesServer[lineServer].split(" ")[0])
			aServer = float(linesServer[lineServer+1].split(" ")[0])
			resultServer = (aServer - bServer) * (10**-9)

		lineN += 1

		result += "%d,%f,%f\n" % (lineN, resultDB, resultServer)

		lineServer += 2
	#print "FINAL", i+1, lineServer-1
	file = open("result/" + nameFile + ".csv" , 'w')
	file.writelines(result.strip())
	file.close()

def create_all():

	filesDb = ["1GB/dblogpost50.txt", "1GB/dblogput50.txt", "1GB/dblogpost250.txt", "1GB/dblogput250.txt", "1GB/dblogpost50_1.txt", "500MB/dblogpost50_500MB.txt", "500MB/dblogput50_500MB.txt", "500MB/dblogpost250_500MB.txt", "500MB/dblogput250_500MB.txt" , "100MB/dblogpost250_100MB.txt", "100MB/dblogpost50_100MB.txt", "100MB/dblogput250_100MB.txt", "100MB/dblogput50_100MB.txt", "dblogpost50.txt"]
	filesLog = ["1GB/requestlogpost50.txt", "1GB/requestlogput50.txt", "1GB/requestlogpost250.txt", "1GB/requestlogput250.txt", "1GB/requestlogpost50_1.txt", "500MB/requestlogpost50_500MB.txt", "500MB/requestlogput50_500MB.txt", "500MB/requestlogpost250_500MB.txt", "500MB/requestlogput250_500MB.txt", "100MB/requestlogpost250_100MB.txt", "100MB/requestlogpost50_100MB.txt", "100MB/requestlogput250_100MB.txt", "100MB/requestlogput50_100MB.txt", "requestlogpost50.txt"]
	filesName = ["1gbPost50", "1gbPut50", "1gbPost250", "1gbPut250", "1gbPost50_1" "500mbPost50", "500mbPut50", "500mbPost250", "500mbPut250", "100mbPost250", "100mbPost50", "100mbPut250", "100mbPut50", "logPost50"]

	for i in range(len(filesName)):
		#print filesName[i]
		if(filesName[i] not in []):
			create_csv(filesDb[i], filesLog[i], filesName[i])

create_all()
