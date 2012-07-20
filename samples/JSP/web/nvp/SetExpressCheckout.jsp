<%@ include file='constants.jsp'%>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>PayPal JAVA SDK - ExpressCheckout API</title>
<LINK href="sdk.css" rel="stylesheet" type="text/css">
</HEAD>
<body>
<%
String env = (String)session.getAttribute("environment");
String devEnv="developer";
if (env.equalsIgnoreCase("beta-sandbox")) {
  devEnv="beta-developer";
} 
%>
<center>
<form method="POST" action="ReviewOrder.jsp"><input type=hidden
	name=paymentType value=<%= request.getParameter("paymentType") %>>
<P><span id="apiheader"><font size=3 color=black face=Verdana><b>SetExpress
Checkout</b> </font> </span></P>

<TABLE id="Table1">
	<tr>
		<td colspan="2" style="WIDTH: 390px"><br>
		<center><font size=2> <b>You must be logged into <a
			href="https://<%=devEnv%>.paypal.com" target="_blank">Developer
		Central</a></b> <br>
		<br></center>
		</td>
	</tr>
	<TH>Shopping cart Products:</TH>
	<tr>
		<td align=right><br>
		Buyer's Email:</td>
		<td align=left><br>
		<input type="text" size="30" name="buyersemail"
			value="buyersemail@paypal.com"><b>(Required)</b></td>

	</tr>
	<tr>
		<td class="field">CDs:</td>
		<td><input type="text" size="30" maxlength="32" name="L_NAME1"
			value="Path To Nirvana" /></td>


		<td class="field">Amount:</td>
		<td><input type="text" name="L_AMT1" size="5" maxlength="32"
			value="39.00" /></td>

		<td class="field">Quantity:</td>
		<td><input type="text" size="3" maxlength="32" name="L_QTY1"
			value="2" /></td>

	</tr>
	<tr>
		<td class="field">Books:</td>
		<td><input type="text" size="30" maxlength="32" name="L_NAME0"
			value="Know Thyself" /></td>


		<td class="field">Amount: <br />
		</td>
		<td><input type="text" name="L_AMT0" size="5" maxlength="32"
			value="9.00" /></td>

		<td class="field">Quantity:</td>
		<td><input type="text" size="3" maxlength="32" name="L_QTY0"
			value="2" /></td>

	</tr>
	<tr>
		<td class="field">Currency: <br />
		</td>
		<td><select name="currencyCodeType">
			<option value="USD">USD</option>
			<option value="GBP">GBP</option>
			<option value="EUR">EUR</option>
			<option value="JPY">JPY</option>
			<option value="CAD">CAD</option>
			<option value="AUD">AUD</option>
		</select></td>
	</tr>
</TABLE>
<BR>
<TABLE id="Table2">
	<TH>Ship To:</TH>
	<tr>
		<td class="field">Name:</td>
		<td><input type="text" size="30" maxlength="32" name="NAME"
			value="True Seeker" /></td>
		<td colspan="20"></td>	
	</tr>
	<tr>
		<td class="field">Street:</td>
		<td><input type="text" size="30" maxlength="32"
			name="SHIPTOSTREET" value="111 Bliss Ave" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td class="field">City:</td>
		<td><input type="text" size="30" maxlength="32" name="SHIPTOCITY"
			value="San Jose" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td class="field">State:</td>
		<td><input type="text" size="30" maxlength="32"
			name="SHIPTOSTATE" value="CA" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td class="field">Country:</td>
		<td><input type="text" size="30" maxlength="32"
			name="SHIPTOCOUNTRYCODE" value="US" /></td>
			<td colspan="20"></td>
	</tr>
	<tr>
		<td class="field">Zip Code:</td>
		<td><input type="text" size="30" maxlength="32" name="SHIPTOZIP"
			value="95128" /></td>
			<td colspan="20"></td>
	</tr>

	<TR>
		<TD><input type="image" name="submit"
			src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" /> <input
			type="hidden" name=paymentType
			value=<%=request.getParameter("paymentType")%></TD>
		<TD><BR>
		<BR>
		Save time. Pay securely without sharing your financial information.</TD>
	</TR>
</TABLE>
</form>
</center>
<br>
<a id="CallsLink" class="home" href="Calls.html">Home</a>
</body>
</HTML>