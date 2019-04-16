'''
    For the given path, get the List of all files in the directory tree
'''
import os
import re
import subprocess


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

    return allFiles


def extractFileNamesFromPath(pathOfFiles):
    # List of file names
    fileNames = list()

    # Match app name
    re1 = "[ \w-]+\."
    rg1 = re.compile(re1, re.IGNORECASE | re.DOTALL)

    # Iterate through paths and extract app name
    for path in pathOfFiles:
        regExResult = rg1.findall(path)
        appName = regExResult[0].replace(".", "")
        fileNames.append(appName)
        # print(appName)

    return fileNames


def checkInstalled(listApps):

    # Iterate through apps in list and check if installed
    for app in listApps:
        # print("++++++++++++++++++ CHECKING FOR: " + app + "++++++++++++++++++")

        # Get into right format(String)
        app = str(app)

        # TODO Remove bash script and make it here
        # Call bash script, to check install status
        try:
            res = subprocess.check_output(["./check-installed.sh", app])
            # print(res.splitlines()[0])
        except subprocess.CalledProcessError as e:
            print("++++++++++++++++++ ERROR AT: " + app + "++++++++++++++++++")
            print("App could not be found, error:")
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
