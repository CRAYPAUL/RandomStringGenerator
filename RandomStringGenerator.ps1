function Get-RandomCharacters {
	[CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)] [String] $length,
        [Parameter(Mandatory=$true)] [String] $characters
    )
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=''
    return [String]$characters[$random]
}

function Invoke-Randomize([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $randomizedArray = $characterArray | Get-Random -Count $characterArray.Length     
    $output = -join $randomizedArray
    return $output 
}

#Generates a 20 character minimum (up to 40 characters), randomized string 
try {
	Do{
		$total = 0
		$characterTotal  = Get-Random -InputObject 5,6,7,8,9,10 -Count 4
		$characterTotal | ForEach-Object {$total += $_}
	} Until ($total -ge 20)
	$randomString = Get-RandomCharacters -length $characterTotal[0] -characters 'abcdefghijklmnopqrstuvwxyz'
	$randomString = $randomString + (Get-RandomCharacters -length $characterTotal[1] -characters 'ABCDEFGHKLMNOPRSTUVWXYZ')
	$randomString = $randomString + (Get-RandomCharacters -length $characterTotal[2] -characters '1234567890')
	$randomString = $randomString + (Get-RandomCharacters -length $characterTotal[3] -characters "~!@#$%^&*_-+=`|\(){}[]:;`"'<>,.?/'")

	1..15 | % {$randomString = Invoke-Randomize($randomString)}
}
catch {
	Write-Warning -Message "Unable to generate random string."
}

$randomString