. ./GETRequest.ps1
. ./PUTRequest.ps1
. ./config.ps1

$pageId = "39093198"
#GET-Request
$data = getBodyByPageId $pageId
#Get HTML Text from Confluence Page
$HTMLBody = $data.body.view.value
$todaysDate = Get-Date -Format "yyyy-MM-dd"
[regex]$regex = '(?<=(?<='+$todaysDate+')(.*?)(wlnedmr)(.*?)(confluenceTd\"\>))'
#Get First Match of Regex
$firstMatch = [regex]::matches($HTMLBody,$regex)[0]
#If a Match was found get Index of the first Match
if ($firstMatch -eq $null){
    $index = 0
}
if ($firstMatch -ne $null) {
    $index = $firstMatch.Index
}
#Value to add after First Match
$value = "<p>19.07. Foobar</p>"
#Insert this Value into the HTML
$newBody = $HTMLBody.Insert($index,$value)

putBodyByPageId $pageId, $newBody
