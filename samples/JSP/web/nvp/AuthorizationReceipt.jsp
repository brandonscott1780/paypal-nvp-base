<%@ page import="com.paypal.sdk.services.*" %>
<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
    <title>PayPal JSP SDK - DoAuthorization API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	//NVPCallerService object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.
		NVPEncoder encoder = new NVPEncoder();

		encoder.add("METHOD","DoAuthorization");		
		encoder.add("TRANSACTIONID",(String)request.getParameter("order_id"));		
		encoder.add("AMT",(String)request.getParameter("amount"));
		encoder.add("CURRENCYCODE",(String)request.getParameter("currency"));
		//encode method will encode the name and value and form NVP string for the request
		String strNVPString = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String ppresponse =
			(String) caller.call( strNVPString);

			//NVPDecoder object is created
			NVPDecoder resultValues = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair
			resultValues.decode(ppresponse);
			
			ResponseBuilder rb=new ResponseBuilder();
		    String header1="Do Authorization";
		    String header2="Authorization Done!";
		    String resp=rb.BuildResponse(resultValues,header1,header2);
			
			String authorizationID = (String)resultValues.get("AUTHORIZATIONID");
			String paymentStatus = (String)resultValues.get("PAYMENTSTATUS");
			String amount = (String)resultValues.get("AMT");
			String transactionId = (String)resultValues.get("TRANSACTIONID");
			String ProtectionEligibility = (String)resultValues.get("PROTECTIONELIGIBILITY");
			String pendingreason = (String)resultValues.get("PENDINGREASON");
	
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
    
    <a id="CallsLink" class="home" href="Calls.html">Home</a>
    <%	

    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}

    %>
</body>
</html>
