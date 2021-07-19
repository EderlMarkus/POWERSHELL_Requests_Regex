. ./config.ps1
#Example of PUT-Request for Atlassian Confluence (Write Content to Page by Id)
function putBodyByPageId($pageId, $body){
    $myurl = $confluenceBaseUrl + "/rest/api/content/" + $pageId + "?expand=body.storage"

    $json = '{"body": "storage": {"value": '+$body+'}}'
    $json = $json | convertFrom-JSON
    $json = $json |convertTo-JSON -Depth 6

    Invoke-RestMethod -Uri $myurl -Method 'Put' -Body $json -Headers $header | ConvertTo-HTML
}