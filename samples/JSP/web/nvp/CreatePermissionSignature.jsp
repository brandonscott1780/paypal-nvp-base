<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java"%>
<html>
<head>
<title>PayPal JSP SDK - Permission Signature generation</title>
<link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body alink=#0000FF vlink=#0000FF>
<br>
<center><font size=3 color=black face=Verdana><b>Generate Signature</b></font>
<br>
<br>
<form method="POST" action="CreatePermissionSignatureReceipt.jsp">
<table>
	<tr>
		<td><b>API User Name(Consumer Key):</b></td>
		<td><input type="text" name="consumerKey" value="" size="50"/></td>
		<td>(Required)</td>
	</tr>
	<tr>
		<td><b>API Password(Consumer Secret):</b></td>
		<td><input type="text" name="consumerSecret" value="" size="50"/></td>
		<td>(Required)</td>
	</tr>
	<tr>
		<td><b>Access Token:</b></td>
		<td><input type="text" name="accessToken" value="" size="50"/></td>
		<td>(Required)</td>
	</tr>

	<tr>
		<td><b>Token Secret:</b></td>
		<td><input type="text" name="tokenSecret" value="" size="50"/></td>
		<td>(Required)</td>
	</tr>
	<tr>
		<td><b>Http Method:</b></td>
		<td>
		   <select name="httpMethod">
				<option value="POST" selected>POST</option>
			</select>
		</td>
		<td>(Required)</td>
	</tr>

	<tr>
		<td><b>Script Uri (endpoint):</b></td>
		<td><input type="text" name="scriptURI" value="" size="50"/></td>
		<td>(Required)</td>
	</tr>

</table>
<br/>
<table>
  <tr>
		<td><input type="Submit" value="Submit"></td>
	</tr>
</table>
</form>
</center>
<a id="CallsLink" class="home"  href="Pro.jsp">Home</a>
</body>
</html>