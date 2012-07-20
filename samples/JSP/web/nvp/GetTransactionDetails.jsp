
<html>
<head>
    <title>PayPal SDK - GetTransactionDetails API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <center>
    <%
		String transaction_id = request.getParameter("transactionID");
		if (transaction_id == null) transaction_id = "20P46879S1049380U";
	%>
    <form action="TransactionDetails.jsp">
         <span id=apiheader>GetTransactionDetails</span>
        <br><br>
        <table class="api">
            <tr>
                <td class="field">
                    Transaction ID:
                </td>
                <td><input type="text" name="transactionID" value="<%=transaction_id%>" />
                    (Required)</td>
            </tr>
            <tr>
                <td colspan="2">
                    <center>
                    <input type="Submit" value="Submit" /></center>
                </td>
            </tr>
        </table>
    </form>
    </center>
    <br />
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>
