#!/usr/bin/python
'''
    For the given path, get the List of all files in the directory tree
'''
import os, re, subprocess

# List of not found applications
notFoundApps = []

'''Return a list of files with path '''
def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    allFiles = list()
    
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)

    return allFiles

''' Return the filenames from the file path '''
def extractFileNamesFromPath(pathOfFiles):
    # List of file names
    fileNames = list()
    # Match app name
    re1 = "[ \w-]+\."
    rg1 = re.compile(re1, re.IGNORECASE | re.DOTALL)

    for path in pathOfFiles:
        # Apply RegEx
        regExResult = rg1.findall(path)
        # Remove last dot from app name
        appName = regExResult[0].replace(".", "")
        fileNames.append(appName)

    return fileNames

''' Check different install methods for each app '''
def checkInstalled(listApps):
    for app in listApps:
        app = str(app)

        if not listApps[app]:
            appStatus = checkBinaries(app)
            listApps = setStatusProgramm(listApps, app, appStatus)
        if not listApps[app]:
            appStatus = checkNpm(app)
            listApps = setStatusProgramm(listApps, app, appStatus)
        if not listApps[app]:
            addNotFoundApps(app)

''' Add apps to list, that could not be found '''
def addNotFoundApps(app):
    notFoundApps.append(app)

''' Check binaries and returns new Status '''
def checkBinaries(app):
    try:
        res = subprocess.call(["which", app],  stdout=subprocess.PIPE)
        if res == 0:
            return True
        else:
            return False 
    except subprocess.CalledProcessError as e:
        # print("Error checking " + app + " for binaries.")
        print(e)

''' Checking for global npm package installations and returns new Status '''               
def checkNpm(app):
    try:
        res = subprocess.call(["npm", "list", "-g", app, "|", "grep", app], shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if res == 0:
            return True
        else:
            return False
    except subprocess.CalledProcessError as e:
        print("Error checking existence of npm package: " + app)
        print(e)

''' Return Dictionary with programms to check '''
def prepareDictionary(listApps):
    # List of applications that have to be tested manually
    blacklist = ["exfat", "cleanup"]
    # Remove apps from blacklist
    listApps = [e for e in listApps if e not in blacklist]
    # Dictionary to store install status of applications
    appsToCheck = {el: False for el in listApps}
    return appsToCheck
    
''' Change the value of an application and return updated dictionary '''
def setStatusProgramm(listOfAppsToChange, app, value):
   listOfAppsToChange[app] = value
   return listOfAppsToChange 

def main():

    dirName = '../../../linux/apps/'

    # Get the list of all files in directory tree at given path
    listOfFiles = getListOfFiles(dirName)

    # Remove file path & get only the file names
    fileNames = extractFileNamesFromPath(listOfFiles)

    programms = prepareDictionary(fileNames)

    # Check apps for install status
    checkInstalled(programms)

    #Show not installed apps
    print("""
    The following list of apps could not be found or had errors installing.\n
    Please check the logs for errors(search for specific application with: cat LOG | grep APPNAME)
    or search system wide: sudo find / -name APPNAME | grep APPNAME.\n
    Check manually with the whereis command below:
    """)
    for app in notFoundApps:
        try:
            subprocess.call(["whereis", app])
        except subprocess.CalledProcessError as e:
            print(e)

if __name__ == '__main__':
    main()
