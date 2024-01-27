$currentPath = $MyInvocation.MyCommand.Path | split-path -parent
$inputFolder = $currentPath + '/input/'
$outputFolder = $currentPath + '/output/'
$ffmpeg = 'ffmpeg '

foreach($file in Get-ChildItem -Path $inputFolder)
{
	Write-Host "------------Started next------------"
	
	$arg = '-i "' + $file.FullName + '" -c:v hevc_nvenc -b:v 1M -c:a copy "' + $outputFolder + $file.Name +'"'
	
	Invoke-Expression "& $ffmpeg $arg"
}

Read-Host -Prompt "Press any key to exit...:"