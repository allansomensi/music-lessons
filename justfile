# Compile all .typ files inside the 'aulas' directory
build:
    #!powershell
    Write-Host "Generating PDFs..."
    Get-ChildItem -Path aulas -Filter *.typ -Recurse | ForEach-Object { 
        typst compile --root . "$($_.FullName)" 
    }
    Write-Host "All PDFs generated successfully!"

# Clean all generated PDFs
clean:
    #!powershell
    Write-Host "Removing PDFs..."
    Get-ChildItem -Path aulas -Filter *.pdf -Recurse | Remove-Item -Force
    Write-Host "PDFs removed."