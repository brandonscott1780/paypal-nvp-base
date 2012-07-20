

<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
    <title>PayPal JSP SDK - DoVoid API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

   	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.					
		NVPEncoder encoder = new NVPEncoder();
		
		encoder.add("METHOD","DoVoid");		
		encoder.add("AUTHORIZATIONID",(String)request.getParameter("authorization_id"));
		encoder.add("NOTE",(String)request.getParameter("note"));
		encoder.add("TRXTYPE","V");
		
		//encode method will encode the name and value and form NVP string for the request		
		String nVPString = encoder.encode();

		//call method will send the request to the server and return the response NVPString
		String ppresponse = 
			(String) caller.call(nVPString);

			//NVPDecoder object is created
			NVPDecoder decoder = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair			
			decoder.decode(ppresponse);
			
			ResponseBuilder rb=new ResponseBuilder();
		    String header1="Do Void";
		    String header2="Authorization voided!";
		    String resp=rb.BuildResponse(decoder,header1,header2);
		    
			String authorizationID = decoder.get("AUTHORIZATIONID");
			
			//checks for Acknowledgement and redirects accordingly to display error messages			
			String strAck = decoder.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",decoder);
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
