<%@ page language="java" %>

<html>
<head>
<title>PayPal SDK - DoAuthorizartion API</title>
<link href="sdk.css" rel="stylesheet" type="text/css"/>
</head>
<body alink=#0000FF vlink=#0000FF>
<br>
<center>
<font size=2 color=black face=Verdana><b>DoAuthorization</b></font>
<br><br>
<%
	String order_id = request.getParameter("order_id");
	if (order_id == null) order_id = "";
	String amount = request.getParameter("amount");
	if (amount == null) amount = "0.00";
	String currency = request.getParameter("currency");
	if (currency == null) currency = "USD";
%>
<form method="POST" action="AuthorizationReceipt.jsp">
<table width=500>
	<tr>
		<td align=right><br>Order ID:</td>
		<td align=left><br><input type="text" name="order_id" value=<%= order_id %>></td>
		<td><b>(Required)</b></td>
	</tr>
	<tr>
		<td align=right>Amount:</td>
		<td align=left>
			<input type="text" name="amount" value=<%=amount%>>
			<select name=currency>
<%
			String[] currencies = {"USD", "GBP", "EUR", "JPY", "CAD", "AUD"};
			for(int s=0; s < currencies.length; s++) {
%>
				<option <%=currency.equals(currencies[s]) ? "selected" : ""%>><%=currencies[s]%></option>
<%
			}
%>
			</select>
		</td>
		<td><b>(Required)</b></td>
	</tr>
	<tr>
		<td/>
		<td align=left><br><input type="Submit" value="Submit"></td>
	</tr>
</table>
</form>
</center>
<a id="CallsLink" href="Calls.html">Home</a>
</body>
</html>