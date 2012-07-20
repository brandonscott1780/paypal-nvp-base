
<html>
<head>
    <title>PayPal JSP SDK - RefundTransaction API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
    
    <form method="POST" action="RefundReceipt.jsp">
	<%
		String transaction_id = request.getParameter("transactionID");
		if (transaction_id == null) transaction_id = "";
		String currency = request.getParameter("currency");
		String amount = request.getParameter("amount");
		if (amount == null) amount = "0.00";
	%>
	
		<br>
		<center>
		<font size=2 color=black face=Verdana><b>RefundTransaction</b></font>
		<br><br>
        <table class="api">
            
            <tr>
                <td class="field">
                    Transaction ID:</td>
                <td>
                    <input type="text" name="transactionID" value="<%=transaction_id%>"/></td>
                    <td><b>(Required) </b></td>
            </tr>
            <tr>
                <td class="field">
                    Refund Type:</td>
                <td>
                    <select name="refundType">
                    <option value="Full">Full</option>
                    <option value="Partial">Partial</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="field">
                    Amount:</td>
                <td>
                    <input type="text" name="amount" value="<%=amount%>" />
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
	                    <option value="JPY">JPY</option>
	                    <option value="EUR">EUR</option>
	                    <option value="CAD">CAD</option>
	                    <option value="AUD">AUD</option>
                    </select>
	<%
		}
	%>
	
                   
                </td>
            </tr>
            <tr>
                <td />
                <td>
                    <b>(Required if Partial Refund) </b>
                </td>
            </tr>
            <tr>
                <td class="field">
                    Memo:</td>
                <td>
                    <textarea name="memo" cols="30" rows="4"></textarea></td>
            </tr>
            <tr>
                <td class="field">
                </td>
                <td>
                    <input type="Submit" value="Submit" /></td>
            </tr>
        </table>
    </form>
    </center>
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>





