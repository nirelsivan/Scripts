# Install FFmpeg using Chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install ffmpeg -y

# Set the input and output folder paths
$inputFolder = "C:\temp\mp4"
$outputFolder = "C:\temp\mp3"

# Get all MP4 files in the input folder
$files = Get-ChildItem -Path $inputFolder -Filter *.mp4

# Loop through each MP4 file and convert it to MP3
foreach ($file in $files) {
    $outputFile = Join-Path -Path $outputFolder -ChildPath ($file.BaseName + ".mp3")
    ffmpeg -i $file.FullName -vn -ar 44100 -ac 2 -ab 192k $outputFile
}
