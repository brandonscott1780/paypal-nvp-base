<%@ page import="com.paypal.sdk.services.NVPCallerServices"%>
<%@ page import="com.paypal.sdk.util.*"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder"%>
<%@ page import="java.util.*"%>
<%@ page language="java"%>

<html>
<head>
<title>PayPal JSP SDK - DoDirect 3D secure Payment API</title>
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
		encoder.add("STARTDATE",(String)request.getParameter("startdate_month")+(String)request.getParameter("startdate_year"));
		encoder.add("EXPDATE",(String)request.getParameter("expdate_month")+(String)request.getParameter("expdate_year"));
		encoder.add("CVV2",(String)request.getParameter("cvv2Number"));
		encoder.add("FIRSTNAME",(String)request.getParameter("firstName"));
		encoder.add("LASTNAME",(String)request.getParameter("lastName"));										
		encoder.add("STREET",(String)request.getParameter("address1"));
		encoder.add("CITY",(String)request.getParameter("city"));	
		encoder.add("STATE",(String)request.getParameter("state"));			
		encoder.add("ZIP",(String)request.getParameter("zip"));	
		encoder.add("COUNTRYCODE","GB");	
		encoder.add("CURRENCYCODE",(String)request.getParameter("currency"));													
		
		//For 3D Secure
		encoder.add("ECI3DS",(String)request.getParameter("eciFlag"));
		encoder.add("CAVV",(String)request.getParameter("cavv"));
		encoder.add("XID",(String)request.getParameter("xid"));
		encoder.add("MPIVENDOR3DS",(String)request.getParameter("MPIVendor3DS"));
		encoder.add("AUTHSTATUS3DS",(String)request.getParameter("AuthStatus3D"));
		//encode method will encode the name and value and form NVP string for the request		
		String NVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = 
			(String) caller.call(NVPString);
		
			//NVPDecoder object is created		
			NVPDecoder resultValues = new NVPDecoder();
			//decode method of NVPDecoder will parse the request and decode the name and value pair			
			resultValues.decode(ppresponse);
	
			String transactionId = (String)resultValues.get("TRANSACTIONID");
			String amount = (String)resultValues.get("AMT");		
			String avsCode = (String)resultValues.get("AVSCODE");	
			String cvv2Match = (String)resultValues.get("CVV2MATCH");						
					
			//checks for Acknowledgement and redirects accordingly to display error messages					
			String strAck = resultValues.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",resultValues);
				response.sendRedirect("../APIError.jsp");
				return;
			}
			Map decodedMap=resultValues.getMap();
			Set set=decodedMap.entrySet();
			Iterator itr=set.iterator();
%>


<br>
<center><font size=2 color=black face=Verdana><b>DoDirect
3D secure Payment</b></font> <br>
<br>

<b>Thank you for your payment!</b><br>
<br>
<table width=400>
	<% while(itr.hasNext()){
		Map.Entry  m=(Map.Entry)itr.next(); %>
	<tr>
		<td><%=m.getKey() %>:</td>
		<td><%=m.getValue() %></td>
	</tr>
	<%} %>
</table>
<br />
<br />
</center>
<p align="center"> <a id="CallsLink" href="../Calls.html">Home</a> </p>
<%
    
    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("../Error.jsp");
		return;
	}
    
    %>
</body>
</html>
