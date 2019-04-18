#!/usr/bin/python
'''
    For the given path, get the List of all files in the directory tree
'''
import os
import re
import subprocess

# List of applications that have to be tested manually
blacklist = ["exfat", "cleanup"]
appsToCheck = {}

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
    # TODO add better handling of dict
    # (not good to add as argument and have as global variable?)

    # Remove apps from blacklist
    listApps = [e for e in listApps if e not in blacklist]
    # Dictionary to store install status of applications
    appsToCheck = {el: False for el in listApps}

    # Iterate through apps in list and check if installed
    for app in appsToCheck:
        # Get into right format(String)
        app = str(app)
        # Check for different methods
        if not appsToCheck[app]:
            checkBinaries(app)
        if appsToCheck[app] == False:
            print(appsToCheck[app])
            checkNpm(app)
        if not appsToCheck[app]:

            # TODO Check for fonts(powerline & firacode)?
            # TODO Check marker from home directory
            # TODO httpie, git-flow, system-load-indicator, solar, miktex, safe-eyes & spaceship-theme -> Check other installment folders"

            checkAll(app)
        if not appsToCheck[app]:
           print(app + "could not be found and is probably not installed.\n")
           print("Please check manually ") 

            # TODO show error log from install
            # Show specific part -> search with grep 
            # TODO add all failed applications to list, check better and show afterwards

''' Check binaries '''
def checkBinaries(app):
    try:
        res = subprocess.call(["which", app])
        print(res)
        if res == 0:
            appsToCheck[app] = True
            print(appsToCheck[app])
        else:
            print(
            app + " could not be found as installed with the binary search")
            print("Proceding with other methods...")
    except subprocess.CalledProcessError as e:
        print("There was an error searching for the binaries of :" + app)
        print(e)

''' Checking for global npm package installations '''               
def checkNpm(app):
    try:
        # TODO remove shell=True for security reasons
        res = subprocess.call(["npm", "list", "-g", app, "|", "grep", app], shell=True)
        if res == 0:
            appsToCheck[app] = True
        else:
            print(
            app + " could not be found as installed in the local npm directory.")
            print("Proceding with other methods...")
    except subprocess.CalledProcessError as e:
        print("Error checking existence of npm package: " + app)
        print(e)

''' Checking system wide(worst case) '''
def checkAll(app):
    try:
        res = subprocess.call(["sudo", "find", "/", "-name", "'*"+app+"'", "|", "grep", app])
        if res == 0:
            appsToCheck[app] = True
        else:
            print(app + " could not be found in the system wide search.")
    except subprocess.CalledProcessError as e:
        print("Error at the system wide search after: " + app)
        print(e)

def main():

    dirName = '../../linux/apps/'

    # Get the list of all files in directory tree at given path
    listOfFiles = getListOfFiles(dirName)

    # Remove file path & get only the file names
    fileNames = extractFileNamesFromPath(listOfFiles)

    # Check apps for install status
    checkInstalled(fileNames)


if __name__ == '__main__':
    main()
