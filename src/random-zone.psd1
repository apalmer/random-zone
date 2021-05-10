@{

# Script module or binary module file associated with this manifest.
RootModule = 'random-zone.psm1'

# Version number of this module.
ModuleVersion = '1.0.0'

# ID used to uniquely identify this module
GUID = '9cec1e56-16ec-4ce0-9ffc-8980a633a392'

# Author of this module
Author = 'Adigun Palmer'

# Copyright statement for this module
Copyright = ''

# Description of the functionality provided by this module
Description = 'Random background image in windows terminal'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '7.0'

# Functions to export from this module
FunctionsToExport = @(
    'Get-RandomZone',
    'Set-RandomZone',
    'Set-Zone'
)

# Cmdlets to export from this module
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module
AliasesToExport = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess.
# This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{
    PSData = @{
        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('random', 'zones', 'windows-terminal')

        # A URL to the license for this module.
        LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = ''
    }
}
}
