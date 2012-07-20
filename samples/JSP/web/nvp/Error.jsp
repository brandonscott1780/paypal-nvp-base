<%@page import="java.lang.Exception" %>
<html>
<head>
<title>PayPal SDK - Java Exception</title>
</head>
<body alink=#0000FF vlink=#0000FF>
<center>
<br>
<font size=2 color=black face=Verdana><b>Java Exception</b></font>
<br><br>
<b>A Java exception has occured!</b><br><br>
<%
	Exception obj = (Exception) session.getValue("exception");
%>
<table width="500">
	<tr>
		<td>Error Type:</td>
		<td><%= obj.getClass().getName() %></td>
	</tr>
	<tr>
		<td>Message:</td>
		<td><%= obj.getMessage() %></td>
	</tr>
</table>
<b>Please check your configuration.</b>
<br><br>
<b>Help:</b>
<ul>
<li><a href='https://www.paypal.com/IntegrationCenter'>PayPal Integration Center</a><br>
<li><a href='https://www.paypal.com/IntegrationCenter/ic_button-encryption.html'>Encrypted Website Payments (EWP)</a><br>
<li>For Encrypted Website Payments (EWP) functionality of the SDK, make sure you have installed the 
Java Cryptography Extension Unlimited Strength Jurisdiction Policy Files:
<a href='http://java.sun.com/j2se/1.4.2/download.html'>Download</a>
</ul>
<a href="index.html">Index</a>
</center>

</body>
</html>