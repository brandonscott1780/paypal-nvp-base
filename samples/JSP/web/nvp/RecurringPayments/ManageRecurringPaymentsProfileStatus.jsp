<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>Manage Recurring Payments Profile Status</title>
<LINK href="../sdk.css" type="text/css" rel="stylesheet"></LINK>
</HEAD>
<body>
<form action="ManageRecurringPaymentsProfileStatusReceipt.jsp"
	method="post">
<center><font size=2 color=black face=Verdana><b>Manage Recurring Payments Profile Status</b></font>
     <br/> <br/>
	<table width="600">
		<tr>
			<td align="right">Profile ID:</td>
			<td align="left"><input name="profileId" id="profileId"
				type="text" maxlength="32" size="36"
				style="WIDTH: 253px; HEIGHT: 22px" value="" />
			(Required)</td>
		</tr>
		<tr>
			<td class="field">Action:</td>
			<td><select id="action" name="action">
					<option value="Cancel" selected>Cancel</option>
					<option value="Suspend">Suspend</option>
					<option value="Reactivate">Reactivate</option>
				</select>
			</td>
		</tr>
		<tr>
		    <td/>
			<td colspan="1"><input type="submit"
				value="Submit" id="Submit" name="Submit"
				style="WIDTH: 71px; HEIGHT: 24px"></td>
		</tr>
	</table>
</center>	
<a id="CallsLink" href="RecurringPayments.jsp">Recurring Payments Home</a>
</form>
</body>
</HTML>




