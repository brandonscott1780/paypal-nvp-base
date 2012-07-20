<%@ include file='constants.jsp' %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal SDK - Express Checkout</title>
</head>
<body alink=#0000FF vlink=#0000FF>
<br>
<center>
<font size=2 color=black face=Verdana><b>Express Checkout</b></font>
<br><br>
	<font color=red>
		<b>You must be logged into <a href="https://<%=devCentral%>.paypal.com" target="_blank">Developer Central</a></b>
	</font>
<br>
<form method="POST" action="SetExpressCheckout.jsp">
<input type=hidden name=paymentType value=<%= request.getParameter("paymentType") %>>
<table width=700>
        <tr>
		<td align=right><br>Buyer's Email:</td>
		<td align=left><br><input type="text" name="buyersemail" value="buyersemail@paypal.com"><b>(Required)</b></td>
			
	</tr>
	<tr>
		<td align=right>Item:</td>
		<td align=left>Photographic Print - Tropical Sunset</td>
	</tr>
	<tr>
		<td align=right>Amount:</td>
		<td align=left>
			<p>
				<input type="text" name=amount value=111.00>
				<select name=currency>
					<option value=USD>USD</option>
					<option value=GBP>GBP</option>
					<option value=EUR>EUR</option>
					<option value=JPY>JPY</option>
					<option value=CAD>CAD</option>
					<option value=AUD>AUD</option>
				</select>
				<b>(Required)</b>
			</p>
		</td>
	</tr>
	<tr>
		<td align=right><br><input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" border="0"></td>
		<td><br>
			<p>
				Save time. Checkout Securely.<br>
				Pay without sharing your financial information.
			</p>
		</td>
        </tr>		
</table>
</form>
</center>
<a id="CallsLink" href="Calls.html">Home</a>
</body>
</html>

