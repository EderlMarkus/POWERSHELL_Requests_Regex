#Global configuration
$confluenceBaseUrl = "https://myCollabServer.at"
#base64 of username:password
$auth = "dXNlcm5hbWU6cGFzc3dvcmQ="

$header = @{
"Accept"="application/json"
"Authorization"="Basic " + $auth
"Content-Type"="application/json"
}