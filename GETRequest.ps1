   . ./config.ps1
    #Example of GET-Request for Atlassian Confluence (Get Content of Page by Id)
    function getBodyByPageId($pageId) {
        $myurl = $confluenceBaseUrl + "/rest/api/content/" + $pageId + "?expand=space,history,body.view,metadata.labels"
        $Response = Invoke-WebRequest -URI $myurl -Headers $header
        $data =$Response.Content | ConvertFrom-JSON
        return $data
    }
