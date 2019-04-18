#!/usr/bin/python
'''
    For the given path, get the List of all files in the directory tree
'''
import os
import re
import subprocess

'''Return a list of file with path '''
def getListOfFiles(dirName):
    # create a list of file and sub directories
    # names in the given directory
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)

    # Return all files as path
    return allFiles

''' Return the filenames from the file path '''
def extractFileNamesFromPath(pathOfFiles):
    # List of file names
    fileNames = list()
    # Match app name
    re1 = "[ \w-]+\."
    rg1 = re.compile(re1, re.IGNORECASE | re.DOTALL)

    # Iterate through paths and extract app name
    for path in pathOfFiles:
        # Apply RegEx
        regExResult = rg1.findall(path)
        # Remove last dot from app name
        appName = regExResult[0].replace(".", "")
        fileNames.append(appName)

    # Return list of filename
    return fileNames

''' Check different install methods for each app '''
def checkInstalled(listApps):
    # Iterate through apps in list and check if installed
    for app in listApps:
        # Get into right format(String)
        app = str(app)
        # Check for different methods
        if not listApps[app]:
            appStatus = checkBinaries(app)
            listApps = setStatusProgramm(listApps, app, appStatus)
        if not listApps[app]:
            appStatus = checkNpm(app)
            listApps = setStatusProgramm(listApps, app, appStatus)
        if not listApps[app]:
	
            # TODO Check for fonts(powerline & firacode)?
            # TODO Check marker from home directory
            # TODO httpie, git-flow, system-load-indicator, solar, miktex, safe-eyes & spaceship-theme -> Check other installment folders"

            appStatus = checkAll(app)
            listApps = setStatusProgramm(listApps, app, appStatus)

        if not listApps[app]:
           print(app + "could not be found and is probably not installed.\n")
           print("Please check manually ") 

            # TODO show error log from install
            # Show specific part -> search with grep 
            # TODO add all failed applications to list, check better and show afterwards

''' Check binaries and returns new Status '''
def checkBinaries(app):
    try:
        res = subprocess.call(["which", app])
        if res == 0:
            return True
        else:
            print(
            app + " could not be found as installed with the binary search")
            print("Proceding with other methods...")
            return False
    except subprocess.CalledProcessError as e:
        print("There was an error searching for the binaries of :" + app)
        print(e)

''' Checking for global npm package installations and returns new Status '''               
def checkNpm(app):
    try:
        # TODO remove shell=True for security reasons
        res = subprocess.call(["npm", "list", "-g", app, "|", "grep", app], shell=True)
        if res == 0:
            return True
        else:
            print(
            app + " could not be found as installed in the local npm directory.")
            print("Proceding with other methods...")
            return False
    except subprocess.CalledProcessError as e:
        print("Error checking existence of npm package: " + app)
        print(e)

''' Checking system wide(worst case) and returns new Status '''
def checkAll(app):
    try:
        res = subprocess.call(["sudo", "find", "/", "-name", "'*"+app+"'", "|", "grep", app])
        if res == 0:
            return True
        else:
            return False
    except subprocess.CalledProcessError as e:
        print("Error at the system wide search after: " + app)
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

    dirName = '../../linux/apps/'

    # Get the list of all files in directory tree at given path
    listOfFiles = getListOfFiles(dirName)

    # Remove file path & get only the file names
    fileNames = extractFileNamesFromPath(listOfFiles)

    programms = prepareDictionary(fileNames)

    # Check apps for install status
    checkInstalled(programms)


if __name__ == '__main__':
    main()
