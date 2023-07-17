# Script Help

These are some scripts that can be used to speed up formatting of the words when copying and pasting from PDF.
## To Clone:
1. Click on the green `Code` button
2. Ensure that you are in the clone tab
3. Click on `Download ZIP`
4. Extract folder to the directory you want

## To Run:
1. Open Window Powershell
2. Use the cd command to go to the directory of the script.
e.g. if your file is in the Document folder, run `cd C:\User\name\Documents\automation_scripts`
3. run `.\<nameOfScript>.ps1`
4. Perform the task
5. Hit enter
6. Press Control + C to terminate the program except for pdfConverter

## Scripts
### removeMultipleSpaces.ps1
This removes the multiple spaces when the text is justified

### splitByDelimiter.ps1
This will remove trailing spaces like the previous function and split by delimiter. 

This is useful when there are bullet points that come out with messed up formatting. This will split them point by point and each point will be in a new line.

* Note: For some of the delimiters using bullets, they cannot be read by the compiler, thus you will need to find the unicode for the delimiter.
e.g. $delimiter = [char]::ConvertFromUtf32(8226) # Unicode code point of `•`
you will need to google the unicode for the specific delimiter you are using, then replace the code in the file.

### pdfToWord
Opens a prompt to load a pdf and convert it to word document.