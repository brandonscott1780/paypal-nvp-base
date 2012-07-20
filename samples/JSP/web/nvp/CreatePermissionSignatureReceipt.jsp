<%@ page import="com.paypal.soap.api.*" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal JSP SDK - Permission Signature generation</title>
<link href="sdk.css" rel="stylesheet" type="text/css"/>
</head> 
<body alink=#0000FF vlink=#0000FF>
<br>
<center>
<b>Authorization Parameters</b><br><br>
<%
    String consumerKey=request.getParameter("consumerKey");
    String consumerSecret=request.getParameter("consumerSecret");
    String accessToken=request.getParameter("accessToken");
    String tokenSecret=request.getParameter("tokenSecret");
    String httpMethod=request.getParameter("httpMethod");
    String scriptURI=request.getParameter("scriptURI");
    
    OAuthSignature.HTTPMethod method=null;
    if("POST".equalsIgnoreCase(httpMethod)){
    	method=OAuthSignature.HTTPMethod.POST;
    }else if("GET".equalsIgnoreCase(httpMethod)){
    	method=OAuthSignature.HTTPMethod.GET;
    }else if("HEAD".equalsIgnoreCase(httpMethod)){
    	method=OAuthSignature.HTTPMethod.HEAD;
    }else if("PUT".equalsIgnoreCase(httpMethod)){
    	method=OAuthSignature.HTTPMethod.PUT;
    }else if("UPDATE".equalsIgnoreCase(httpMethod)){
    	method=OAuthSignature.HTTPMethod.UPDATE;
    }
	try {
		
	 Map params= OAuthSignature.getAuthHeader(consumerKey,consumerSecret,accessToken,tokenSecret,method,scriptURI,null);
	 if(params !=null && params.size()>0){
	 Set set=params.entrySet();
	 Iterator itr=set.iterator();
%>

<table width=400>
   <% while(itr.hasNext()){
		Map.Entry  m=(Map.Entry)itr.next(); %>
	<tr>
		<td><%=m.getKey() %>:</td>
		<td><%=m.getValue() %></td>
	</tr>
	<%} }else{%>
	  <tr> 
	    <td>Please provide all parameters to compute signature.</td>
	  </tr>
	 
	<%} %>
</table><br/><br/>
<%
	} catch (Exception e) {
		out.println(e);
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>
</center>
<a id="CallsLink" href="Pro.jsp">Home</a>
</body>
</html>