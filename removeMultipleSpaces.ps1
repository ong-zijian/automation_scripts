function process_line($line) {
    # Replace multiple consecutive spaces with a single space
    $line -replace '\s+', ' '
}

while ($true) {
    $user_input = Read-Host "Enter your text: "
    Write-Host "============"
    process_line($user_input)
}