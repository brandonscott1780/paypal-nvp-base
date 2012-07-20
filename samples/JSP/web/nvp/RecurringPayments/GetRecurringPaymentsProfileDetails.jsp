<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>Recurring Payments Profile Details</title>
<LINK href="..\sdk.css" type="text/css" rel="stylesheet"></LINK>
</HEAD>
<body>
<form action="GetRecurringPaymentsProfileDetailsReceipt.jsp" method="post">
<% 
         String profileId=request.getParameter("profileid");
         if(profileId == null){
        	 profileId="";
         }
%>
<center><font size=2 color=black face=Verdana><b>Recurring
Payments Profile Details</b></font> <br/><br/>
<table width="600">
	<tr>
		<td align="right">Profile ID:</td>
		<td align="left">
		     <input name="profileId" id="profileId" type="text" maxlength="32" 
		     size="36" style="WIDTH: 253px; HEIGHT: 22px" value="<%=profileId%>" />
		     (Required)
		</td>
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
<a id="CallsLink" href="RecurringPayments.jsp">Recurring Payments Home</a>
</form>
</body>
</html>