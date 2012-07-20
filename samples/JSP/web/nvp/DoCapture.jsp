
<html>
<head>
    <title>PayPal JSP SDK - DoCapture API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form method="POST" action="DoCaptureReceipt.jsp">
	<%
		String transaction_id = request.getParameter("transactionID");
		if (transaction_id == null) transaction_id = "";
		String currency = request.getParameter("currency");
		String amount = request.getParameter("amount");
		if (amount == null) amount = "0.00";
	%>

    <center>
    <font size=2 color=black face=Verdana><b>DoCapture</b></font>
    </br> </br>
    <table class="api">
        
        <tr>
            <td class="field">
                Authorization ID:</td>
            <td>
                <input type="text" name="authorization_id" value="<%=transaction_id%>"/>
                </td>
                <td><b> (Required)</b></td>
        </tr>
        <tr>
            <td class="field">
                Complete Code Type:</td>
            <td>
                <select name="CompleteCodeType">
                <option value="Complete">Complete</option>
                <option value="NotComplete">NotComplete</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="field">
                Amount:</td>
            <td>
                <input type="text" name="amount" value="<%=amount%>" size="5" maxlength="7" />
                
	<%
		if ((currency != null) && (currency.length() > 0)) {
	%>
				<%= currency %>
				<input type="hidden" name="currency" value=<%= currency %>>			
	<%
		} else {
	%>
 	     		<select name="currency">
	                <option value="USD">USD</option>
	                <option value="GBP">GBP</option>
	                <option value="EUR">EUR</option>
	                <option value="JPY">JPY</option>
	                <option value="CAD">CAD</option>
	                <option value="AUD">AUD</option>
                </select>
                </td>
	<%
		}
	%>
	
                
          <td><b> (Required)</b></td>      
        </tr>
        <tr>
            <td class="field">
                Invoice ID:</td>
            <td>
                <input type="text" name="invoice_id" /></td>
        </tr>
        <tr>
            <td class="field">
                Note:</td>
            <td>
                <textarea name="note" cols="30" rows="4"></textarea></td>
        </tr>
        <tr>
            <td class="field">
            </td>
            <td>
                <input type="Submit" value="Submit" />
            </td>
        </tr>
    </table>
    </center>
    <a id="CallsLink" class="home" href="Calls.html">Home</a>
   </form>
</body>
</html>
