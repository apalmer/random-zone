param()

. $PSScriptRoot\utilities.ps1

$zoneDir = "D:\\pics\\zones"

function Get-RandomZone {
    param($zone="science fiction ")

    $bingApiUrl = "https://api.bing.microsoft.com/"
    $bingApiKey = "baa2d62cb4f74b2384194c2b3ff7d22f"

    $zone =  [System.Web.HttpUtility]::UrlEncode($zone)
    $images = Invoke-RestMethod -Headers @{"Ocp-Apim-Subscription-Key"="$bingApiKey";} -Uri "$bingApiUrl/v7.0/images/search?aspect=wide&q=$zone"
    $randomImage = $images.value | Get-Random | Select-Object -ExpandProperty contentUrl
    $randomFile = Split-Path ($randomImage.split('?')[0])  -Leaf

    $zoneFile = "$zoneDir\$randomFile"
    Invoke-RestMethod -Uri $randomImage -OutFile $zoneFile

    Set-Zone $zoneFile
}

function Set-RandomZone{

    $randomZone = Get-ChildItem $zoneDir | 
        Where-Object {  $_.name -notmatch "rotary-(\d{14}).jpg"} | 
        Get-Random 
    
    Set-Zone $randomZone.FullName
}

function Set-Zone{
    param($zoneName)

    $windowsTerminalSettingsPath = 'C:\Users\Diggy\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json'

    $newRotaryFile = "$zoneDir\\rotary-$((Get-Date).ToString('yyyMMddHHmmss')).jpg"

    Copy-Item -Path $zoneName -Destination $newRotaryFile

    $settingsContent = (Get-Content $windowsTerminalSettingsPath -Raw) 
    if($settingsContent -match 'D:\\\\pics\\\\zones\\\\rotary-(\d{14}).jpg'){
       $settingsContent = $settingsContent -replace 'D:\\\\pics\\\\zones\\\\rotary-\d{14}.jpg', $newRotaryFile
    }
    Set-Content -Path $windowsTerminalSettingsPath -Value $settingsContent
}

$exportModuleMemberParams = @{
    Function = @(
        'Get-RandomZone',
        'Set-RandomZone',
        'Set-Zone'
    )
    Variable = @(
    )
}

Export-ModuleMember @exportModuleMemberParams
