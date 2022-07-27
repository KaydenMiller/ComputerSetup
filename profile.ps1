#oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/powerlevel10k_modern.omp.json | Invoke-Expression
oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/atomic.omp.json | Invoke-Expression

function work()
{
    param([switch]$root);

    $location = "F:\";

    if (!$root)
    {
        $location += "personal\";
    }

    Set-Location $location;
}

function Install-Font
{
    param
    (
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][System.IO.FileInfo]$FontFile
    )

    #Get Font Name from the File's Extended Attributes  
    $oShell = new-object -com shell.application
    $Folder = $oShell.namespace($FontFile.DirectoryName)
    $Item = $Folder.Items().Item($FontFile.Name)
    $FontName = $Folder.GetDetailsOf($Item, 21)
    try
    {
        switch ($FontFile.Extension)
        {
            ".ttf" {
                $FontName = $FontName + [char]32 + '(TrueType)'
            }
            ".otf" {
                $FontName = $FontName + [char]32 + '(OpenType)'
            }
        }
        $Copy = $true
        Write-Host ('Copying' + [char]32 + $FontFile.Name + '.....') -NoNewline
        Copy-Item -Path $fontFile.FullName -Destination ("C:\Windows\Fonts\" + $FontFile.Name) -Force
        #Test if font is copied over  
        If ((Test-Path ("C:\Windows\Fonts\" + $FontFile.Name)) -eq $true)
        {
            Write-Host ('Success') -Foreground Yellow
        }
        else
        {
            Write-Host ('Failed') -ForegroundColor Red
        }
        $Copy = $false
        #Test if font registry entry exists  
        If ((Get-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -ErrorAction SilentlyContinue) -ne $null)
        {
            #Test if the entry matches the font file name  
            If ((Get-ItemPropertyValue -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts") -eq $FontFile.Name)
            {
                Write-Host ('Adding' + [char]32 + $FontName + [char]32 + 'to the registry.....') -NoNewline
                Write-Host ('Success') -ForegroundColor Yellow
            }
            else
            {
                $AddKey = $true
                Remove-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Force
                Write-Host ('Adding' + [char]32 + $FontName + [char]32 + 'to the registry.....') -NoNewline
                New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $FontFile.Name -Force -ErrorAction SilentlyContinue | Out-Null
                If ((Get-ItemPropertyValue -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts") -eq $FontFile.Name)
                {
                    Write-Host ('Success') -ForegroundColor Yellow
                }
                else
                {
                    Write-Host ('Failed') -ForegroundColor Red
                }
                $AddKey = $false
            }
        }
        else
        {
            $AddKey = $true
            Write-Host ('Adding' + [char]32 + $FontName + [char]32 + 'to the registry.....') -NoNewline
            New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $FontFile.Name -Force -ErrorAction SilentlyContinue | Out-Null
            If ((Get-ItemPropertyValue -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts") -eq $FontFile.Name)
            {
                Write-Host ('Success') -ForegroundColor Yellow
            }
            else
            {
                Write-Host ('Failed') -ForegroundColor Red
            }
            $AddKey = $false
        }

    }
    catch
    {
        If ($Copy -eq $true)
        {
            Write-Host ('Failed') -ForegroundColor Red
            $Copy = $false
        }
        If ($AddKey -eq $true)
        {
            Write-Host ('Failed') -ForegroundColor Red
            $AddKey = $false
        }
        write-warning $_.exception.message
    }
    Write-Host
}

function Install-Fonts()
{
    param([string]$path);
    $path = Resolve-Path -Relative $path;
    Write-Output $path;
    #Get a list of all font files relative to this script and parse through the list  
    $fonts = (Get-ChildItem -Path $PSScriptRoot | Where-Object {
        ($_.Name -like '*.ttf') -or ($_.Name -like '*.OTF')
    })
    Write-Output $PSScriptRoot;
    Write-Output $fonts;
    foreach ($FontItem in $fonts)
    {
        Write-Output $FontItem
#        Install-Font -FontFile $FontItem
    }
}