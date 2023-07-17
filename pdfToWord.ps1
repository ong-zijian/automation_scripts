Add-Type -AssemblyName System.Windows.Forms

# Show a file dialog to select the PDF file
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Filter = "PDF files (*.pdf)|*.pdf"
$openFileDialog.Title = "Select PDF File"

if ($openFileDialog.ShowDialog() -eq 'OK') {
    # Get the selected PDF file path
    $pdfPath = $openFileDialog.FileName
    
    # Create a new Word application object
    $wordApp = New-Object -ComObject Word.Application

    # Disable alerts and visibility for Word
    $wordApp.DisplayAlerts = $false
    $wordApp.Visible = $false

    # Define the output file path
    $docxPath = [System.IO.Path]::ChangeExtension($pdfPath, ".docx")

    # Open the PDF file in Word
    $document = $wordApp.Documents.Open($pdfPath)

    # Save the document as a Word file
    $document.SaveAs($docxPath, [ref] 16)  # 16 is the file format for Word document (.docx)

    # Close the document and quit Word
    $document.Close()
    $wordApp.Quit()

    # Release the COM objects
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($document) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wordApp) | Out-Null

    # Display a success message
    Write-Host "PDF conversion to Word completed successfully. Output file: $docxPath"
}
else {
    # Display an error message if no file was selected
    Write-Host "No file selected."
}
