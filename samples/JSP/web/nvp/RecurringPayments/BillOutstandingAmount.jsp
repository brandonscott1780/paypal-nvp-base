<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>Bill Outstanding Amount</title>
<LINK href="..\sdk.css" type="text/css" rel="stylesheet"></LINK>
</HEAD>
<body>
<form action="BillOutstandingAmountReceipt.jsp" method="post">
<center><font face="Verdana" color="black" size="2"><b>Bill Outstanding Amount </b></font>
 <br/><br/>
<table class="api">
	<tr>
	</tr>
	<tr>
		<td class="field">Profile ID:</td>
		<td><input id="profileId" type="text" maxLength="32" size="30"
			name="profileId" >(Required)</td>
	</tr>
	<tr>
		<td class="field">Amount:</td>
		<td><input id="amount" type="text" maxLength="32" size="30"
			name="amount"></td>
	</tr>
	<tr>
	    <td/>
		<td colspan="1">
		   <input type="submit" value="Submit" id="Submit"
			name="Submit" style="WIDTH: 71px; HEIGHT: 24px">
		</td>
	</tr>
</table>
</center>
<A id="CallsLink" href="RecurringPayments.jsp">Recurring
Payments Home</A>
</form>
</body>
</HTML>
