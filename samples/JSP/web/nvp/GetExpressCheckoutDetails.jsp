
<html>

<%@ page import="com.paypal.sdk.services.NVPCallerServices"%>
<%@ page import="com.paypal.sdk.util.*"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder"%>
<%@ page language="java"%>

<head>
<title>PayPal NVP SDK - ExpressCheckout-Instant API- Simplified
Order Review Page</title>
<link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");		
  
	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.
		NVPEncoder encoder = new NVPEncoder();
		encoder.add("METHOD","GetExpressCheckoutDetails");
		encoder.add("TOKEN",request.getParameter("token"));

		//encode method will encode the name and value and form NVP string for the request			
		String strNVPString = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String strNVPResponse =
			(String) caller.call( strNVPString);

		//NVPDecoder object is created
		NVPDecoder decoder = new NVPDecoder();
		
		//decode method of NVPDecoder will parse the request and decode the name and value pair		
		decoder.decode(strNVPResponse);
		
		   ResponseBuilder rb=new ResponseBuilder();
		   String header1="Review Order";
		   String header2="Step 3: DoExpressCheckoutPayment, Order Review Page";
		   String resp=rb.BuildResponse(decoder,header1,header2);
		   
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
<form action="DoExpressCheckoutPayment.jsp">
<table width=400>
	<tr>
	   <td>
	     <%=resp %>
	   </td>
	</tr>

	<tr>
		<td colspan="2" class="header">
			<input type="submit" value="Buy" /> 
			<input type="hidden" name="token" value="<%=decoder.get("TOKEN")%>" />
			<input type="hidden" name="PayerID" value="<%= decoder.get("PAYERID")%>" />
			<% session.setAttribute("TotalAmount",decoder.get("AMT")); %>
		</td>
	</tr>
</table>
</form>
</center>
<%
		} catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}			
	%>
<a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>
