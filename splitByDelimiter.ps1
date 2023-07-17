function process_input($input_string) {
    # Replace multiple consecutive spaces with a single space
    $processed_string = $input_string -replace '\s+', ' '

    return $processed_string
}

while ($true) {
    $user_input = ""
    $processed_input = ""

    $user_input = Read-Host "Enter your text: "
    $processed_input = process_input $user_input

    Write-Host "Processed text:"
    $delimiter = [char]::ConvertFromUtf32(8226)  # Unicode code point of `•`
    $lines = $processed_input -split $delimiter
    foreach ($line in $lines) {
        Write-Host $line
    }
}