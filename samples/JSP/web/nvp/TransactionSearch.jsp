
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" %>

<%
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	Calendar startDate = Calendar.getInstance();
	startDate.add(Calendar.DATE, -1);
	Calendar endDate = Calendar.getInstance();
%>
<html>
<head>
    <title>PayPal SDK - TransactionSearch</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <center>
    <font size=3 color=black face=Verdana><b>TransactionSearch</b></font>
    <form action="TransactionSearchResults.jsp">
        <table class="api">
            <tr>
                <td class="field">
                    <b>StartDate:</b> </td>
                <td>
                    <input type="text" name="startDate" maxlength="10" size="10" value=<%= df.format(startDate.getTime()) %> />
				</td>
                <td> (Required)</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    MM/DD/YYYY
                </td>
            </tr>
            <tr>
                <td class="field">
                   <b> EndDate:</b></td>
                <td>
                    <input type="text" name="endDate" maxlength="10" size="10" value=<%= df.format(endDate.getTime()) %> />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    MM/DD/YYYY
                </td>
            </tr>
            <tr>
                <td class="field">
                   <b> TransactionID:</b></td>
                <td>
                    <input type="text" name="transactionID" /></td>
            </tr>
            <tr>
                <td class="field">
                </td>
                <td>
                    <br />
                    <input type="Submit" value="Submit" /></td>
            </tr>
        </table>
    </form>
    </center>
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>
