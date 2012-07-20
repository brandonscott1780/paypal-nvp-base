<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
    <title>PayPal JSP SDK - DoDirectPayment API</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

   	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.				
		NVPEncoder encoder = new NVPEncoder();
		
		encoder.add("METHOD","DoDirectPayment");
		encoder.add("PAYMENTACTION",(String)request.getParameter("paymentType"));
		encoder.add("AMT",(String)request.getParameter("amount"));
		encoder.add("CREDITCARDTYPE",(String)request.getParameter("creditCardType"));		
		encoder.add("ACCT",(String)request.getParameter("creditCardNumber"));						
		encoder.add("EXPDATE",(String)request.getParameter("expdate_month")+(String)request.getParameter("expdate_year"));
		encoder.add("CVV2",(String)request.getParameter("cvv2Number"));
		encoder.add("FIRSTNAME",(String)request.getParameter("firstName"));
		encoder.add("LASTNAME",(String)request.getParameter("lastName"));										
		encoder.add("STREET",(String)request.getParameter("address1"));
		encoder.add("CITY",(String)request.getParameter("city"));	
		encoder.add("STATE",(String)request.getParameter("state"));			
		encoder.add("ZIP",(String)request.getParameter("zip"));	
		encoder.add("COUNTRYCODE","US");	
		//encoder.add("CURRENCYCODE",(String)request.getParameter("currency"));													
		encoder.add("CURRENCYCODE","USD");													
		//encode method will encode the name and value and form NVP string for the request		
		String NVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = (String) caller.call(NVPString);
		//NVPDecoder object is created		
		NVPDecoder resultValues = new NVPDecoder();
		//decode method of NVPDecoder will parse the request and decode the name and value pair			
		resultValues.decode(ppresponse);
		
		   ResponseBuilder rb=new ResponseBuilder();
		   String header1="Do Direct Payment";
		   String header2="Thank you for your payment!";
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
    <a id="CallsLink" href="Calls.html">Home</a>
      <%
    
    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
    
    %>
</body>
</html>
