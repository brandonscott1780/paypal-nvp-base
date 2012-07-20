

<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>

<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder"%>
<%@ page language="java" %>
<html>
<head>
    <title>PayPal PHP JSP - RefundTransaction API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	//N	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

	try
	{
							
		//NVPEncoder object is created and all the name value pairs are loaded into it.				
		NVPEncoder encoder = new NVPEncoder();
		
		encoder.add("METHOD","RefundTransaction");
		encoder.add("REFUNDTYPE",(String)request.getParameter("refundType"));
		encoder.add("TRANSACTIONID",(String)request.getParameter("transactionID"));

		if((request.getParameter("refundType")!=null) && ((String)request.getParameter("refundType")).length()>0 &&
			((String)request.getParameter("refundType")).equalsIgnoreCase("Partial"))
			{
				encoder.add("AMT",(String)request.getParameter("amount"));					
			}
				
		encoder.add("NOTE",(String)request.getParameter("memo"));						

		//encode method will encode the name and value and form NVP string for the request
		String nVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = 
			(String) caller.call( nVPString);
		
			//NVPDecoder object is created		
			NVPDecoder decoder = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair			
			decoder.decode(ppresponse);
			
			ResponseBuilder rb=new ResponseBuilder();
		    String header1="Refund Transaction";
		    String header2="Transaction refunded!";
		    String resp=rb.BuildResponse(decoder,header1,header2);
		    
			String transactionId = decoder.get("TRANSACTIONID");
					
			//checks for Acknowledgement and redirects accordingly to display error messages					
			String strAck = decoder.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",decoder);
				response.sendRedirect("APIError.jsp");
				return;
			}
%>

<center>
 <%=resp %>
</center>   
    <a class="home" id="CallsLink" href="Calls.html">Home</a>    
<%
    
    }
    catch (Exception e)
    {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
    
%>
</body>
</html>
