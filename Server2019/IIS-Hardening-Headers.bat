appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='Content-Security-Policy',value='upgrade-insecure-requests']"
appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='X-Frame-Options',value='SAMEORIGIN']"
appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='X-Content-Type-Options',value='nosniff']"
appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='Referrer-Policy',value='strict-origin-when-cross-origin']"
appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='X-XSS-Protection',value='1; mode=block']"
appcmd.exe set config "Default Web Site" -section:system.webServer/httpProtocol /+"customHeaders.[name='Permissions-Policy',value='camera=(); microphone=()']"
