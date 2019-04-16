'''
    For the given path, get the List of all files in the directory tree
'''
import os, re, subprocess


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


def extractFileNames(pathOfFiles):
    # Use RegEx to get only the file name
    # List of file names
    fileNames = list()

    # RegEx to match file name from path
    re1 = '.*?'  # Non-greedy match on filler
    re2 = '(?:[a-z][a-z]+)'  # Uninteresting: word
    re3 = '.*?'  # Non-greedy match on filler
    re4 = '(?:[a-z][a-z]+)'  # Uninteresting: word
    re5 = '.*?'  # Non-greedy match on filler
    re6 = '((?:[a-z][a-z]+))'  # Word 1
    rg = re.compile(re1+re2+re3+re4+re5+re6, re.IGNORECASE | re.DOTALL)

    # Iterate over all paths & apply RegEx
    for path in pathOfFiles:
        m = rg.search(path)
        if m:
            word = m.group(1)
            fileNames.append(word)

    return fileNames


def main():

    dirName = '../../linux/apps/'

    # Get the list of all files in directory tree at given path
    listOfFiles = getListOfFiles(dirName)

    # Print the files(DEBUG)
    # for elem in listOfFiles:
    #     print(elem)
    
    # Remove file path & get only the file names
    fileNames = extractFileNames(listOfFiles)

    print("++++++++++++++++++++++++++")

    # Print name of files(DEBUG)
    for file in fileNames:
        print(file)



if __name__ == '__main__':
    main()
