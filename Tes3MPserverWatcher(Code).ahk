global A1, global A2, global A3
ReadConfig()
Url := A1
Message := A2
PostData := "{""content"": """ . Message . """}"
Connect(Url, Method := "POST", PostData)

loop
{
Sleep, 1000
RunWait, tes3mp-server-autorestart.bat
Message := A3
PostData := "{""content"": """ . Message . """}"
Connect(Url, Method := "POST", PostData)
}

Connect(Url, Method, PostData)
{
 HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
 HTTP.Open(Method, Url, false)
 HTTP.SetRequestHeader("Content-Type", "application/json")
 HTTP.Send(PostData)
 HTTP.WaitForResponse()
 Text := HTTP.ResponseText
return Text
}

ReadConfig()
{
 IniRead, A1, WebHookUrl.ini, Webhook, Url
 IniRead, A2, WebHookUrl.ini, Messages, 1
 IniRead, A3, WebHookUrl.ini, Messages, 2
}