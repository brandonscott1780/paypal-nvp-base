
<html>
<head>
    <title>PayPal JSP SDK - DoVoid API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form method="POST" action="DoVoidReceipt.jsp">
	<%
		String transaction_id = request.getParameter("transactionID");
		if (transaction_id == null) transaction_id = "";
	%>

    <center>
	<font size=2 color=black face=Verdana><b>DoVoid</b></font>
	<br><br>
    <table class="api">
        <tr>
            <td class="field">
                Authorization ID:</td>
            <td>
                <input type="text" name="authorization_id" value="<%=transaction_id%>"/>
                </td>
                <td><b> (Required) </b></td>
        </tr>
        <tr>
            <td class="field">
                Note:</td>
            <td>
                <textarea name="note" cols="30" rows="4"></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                <input type="Submit" value="Submit" /></center>
            </td>
        </tr>
    </table>
    </center>
    <a id="CallsLink" class="home" href="Calls.html">Home</a>
    </form>
</body>
</html>
