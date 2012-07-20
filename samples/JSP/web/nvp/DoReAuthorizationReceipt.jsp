<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page language="java" %>
<html>
<head>
<title>PayPal JSP SDK - DoReAuthorization API</title>
</head> 
<body alink=#0000FF vlink=#0000FF>
<center>
<%
	//NVPCallerServices object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.
		NVPEncoder encoder = new NVPEncoder();

		encoder.add("METHOD","DoReauthorization");
		encoder.add("AUTHORIZATIONID",(String)request.getParameter("authorizationID"));
		encoder.add("CURRENCYCODE",(String)request.getParameter("currency"));
		encoder.add("AMT",(String)request.getParameter("amount"));
		
		
		//encode method will encode the name and value and form NVP string for the request
		String strNVPString = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String ppresponse =(String) caller.call( strNVPString);

			//NVPDecoder object is created
			NVPDecoder resultValues = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair
			resultValues.decode(ppresponse);
		
		   ResponseBuilder rb=new ResponseBuilder();
		   String header1="Do ReAuthorization";
		   String header2="ReAuthorization Succeeded!";
		   String resp=rb.BuildResponse(resultValues,header1,header2);
			   
			
			//checks for Acknowledgement and redirects accordingly to display error messages
			String strAck = resultValues.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",resultValues);
				response.sendRedirect("APIError.jsp");
				return;
			}
		
%>

<%=resp %>

<%
	} catch (Exception e) {
		out.println(e);
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>
</center>
<a id="CallsLink" href="Calls.html">Home</a>
</body>
</html>