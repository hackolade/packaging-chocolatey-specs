$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Hackolade-win64-setup-signed.exe'
$url        = 'https://s3-eu-west-1.amazonaws.com/hackolade/previous/v6.11.2/Hackolade-win64-setup-signed.exe'
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'hackolade*'
  checksum      = '__WINDOWS_INSTALLER_CHECKSUM__'
  checksumType  = 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
