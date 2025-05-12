Function Get-GistFile {
	param (
		[string]$Url
	)

	$fileName = $Url.Split("/")[-1]
	$cache = "$env:LOCALAPPDATA\PwshUtils\$fileName"

	try {
		if (-not (Test-Path (Split-Path $cache))) {
			New-Item -ItemType Directory -Path (Split-Path $cache) -Force | Out-Null
		}

		Invoke-WebRequest -Uri $url -OutFile $cache -ErrorAction Stop
	}
 catch {
		Write-Warning "Download failed. Using local copy if available."
	}

	if (Test-Path $cache) {
		Import-Csv $cache
	}
 else {
		throw "No CSV file available."
	}

}

Function Get-UtilVimCheatSheet {
	param (
		[string]$ExportHtml
	)

	$data = Get-GistFile -Url 'https://gist.githubusercontent.com/gvnadir/8d240f6a885b301a7cbbfdcb563d4600/raw/6a7a1f77bc6575b75d1d7adc591db819aa7b6c79/VimCheatSheet.csv'

	if ($ExportHtml) {
		$outputPath = Join-Path $ExportHtml "VimCheatSheet.html"
		$data | ConvertTo-Html -Title "Vim Cheat Sheet" | Out-File -FilePath $outputPath
		Write-Host "Exported as HTML: $ExportHtml"
	}
	else {
		return $data
	}
}