<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>

<%= Request.ServerVariables("HTTP_USER-AGENT") %>

<%

function getBrowserName()
{
   var lsBrowser = new String(Request.ServerVariables("HTTP_USER-AGENT"));
   if (lsBrowser.indexOf("MSIE") >= 0)
   {
      lsBrowser = "MSIE";
   }
   else if (lsBrowser.indexOf("Mozilla") >= 0)
   {
      lsBrowser = "NETSCAPE";
   }
   else
   {
      lsBrowser = "UNKNOWN";
   }

   return lsBrowser;
}

function getOS()
{
   var userPlat = "unknown";
   var navInfo = new String(Request.ServerVariables("HTTP_USER-AGENT"));

   if ((navInfo.indexOf("Windows NT") != -1)
      || (navInfo.indexOf("Windows 95") != -1 )
      || (navInfo.indexOf("Windows 98") != -1 )
      || (navInfo.indexOf("WinNT") != -1 )
      || (navInfo.indexOf("Win95") != -1 )
      || (navInfo.indexOf("Win98") != -1 ))
   {
      userPlat = "Win32";
   }
   else if(navInfo.indexOf("Win16") != -1)
   {
      userPlat = "Win16";
   }
   else if(navInfo.indexOf("Macintosh") != -1)
   {
      userPlat = "PPC";
   }
   else if(navInfo.indexOf("68K") != -1)
   {
      userPlat = "68K";
   }
   return userPlat;
}

function getBrowserVersion()
{
   var findIndex;
   var browserVersion;
   var browser = getBrowserName();
   browserVersion = new String(Request.ServerVariables("HTTP_USER-AGENT"));

   if (browser == "MSIE")
   {
      findIndex = browserVersion.indexOf("MSIE") + 5;
      browserVersion = parseFloat(browserVersion.substring(findIndex,
         findIndex + 4));
   }
   else if (browser == "NETSCAPE")
   {
      findIndex = browserVersion.indexOf("Mozilla") + 8;
      browserVersion = parseFloat(browserVersion.substring(findIndex,
         findIndex + 4));
   }
   else if (browser == "UNKNOWN")
   {
      browserversion = 0;
   }

   return browserVersion;
}

%>
<P>
브라우저 : <%=getBrowserName()%>
<BR>
운영 체계 : <%=getOS()%>
<BR>
브라우저 버전 : <%=getBrowserVersion()%>
</P>
</BODY>
</HTML>
