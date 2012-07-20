<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
    <title>PayPal SDK - TestConnection</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

   	try {
		TestConnection testConnection = new TestConnection();
		String strTestResult = testConnection.testServerConnection(caller);			

%>


    <center>
    <table class="api">
        <tr>
            <td colspan="2" class="header">
                Test Connection
            </td>
        </tr>
        
        <tr>
            <td class="field">
                Connection Status:&nbsp</td>
            <td>
                <%=strTestResult%></td>
        </tr>
    </table>
    </center>
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
    
     <%
    
    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
    
    %>
</body>
</html>
