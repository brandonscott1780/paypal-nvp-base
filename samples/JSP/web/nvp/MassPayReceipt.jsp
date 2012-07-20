<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page language="java" %>
<html>
<head>
<title>PayPal JSP SDK - MassPay API</title>
</head> 
<body alink=#0000FF vlink=#0000FF>

<%
	//NVPCallerServices object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.
		NVPEncoder encoder = new NVPEncoder();

		encoder.add("METHOD","MassPay");
		encoder.add("EMAILSUBJECT",(String)request.getParameter("emailSubject"));
		encoder.add("RECEIVERTYPE",(String)request.getParameter("receiverType"));
		String[] receiverEmailItems=request.getParameterValues("receiveremail");
		String[] amountItems=request.getParameterValues("amount");
		String[] uniqueIDItems=request.getParameterValues("uniqueID");
		String[] noteItems=request.getParameterValues("note");
		
		for(int i=0,j=0;i<receiverEmailItems.length; i++)
		{
			String recreceiverEmail=receiverEmailItems[i];
			if(recreceiverEmail != null && recreceiverEmail.length()!= 0)
			{
				encoder.add("L_EMAIL"+j,receiverEmailItems[i]);
				encoder.add("L_Amt"+j,amountItems[i]);
				encoder.add("L_UNIQUEID"+j,uniqueIDItems[i]);
				encoder.add("L_NOTE"+j,noteItems[i]);	
				j++;
			}								
		}
		
		
		//encode method will encode the name and value and form NVP string for the request
		String strNVPString = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String ppresponse =	(String) caller.call( strNVPString);

			//NVPDecoder object is created
			NVPDecoder resultValues = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair
			resultValues.decode(ppresponse);
		    
			ResponseBuilder rb=new ResponseBuilder();
		    String header1="Mass Pay Response";
		    String header2="MassPay has been completed successfully!";
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
<a id="CallsLink" href="Calls.html">Home</a>
</body>
</html>