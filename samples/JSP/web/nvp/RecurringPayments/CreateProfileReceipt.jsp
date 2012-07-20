<%@ page import="com.paypal.sdk.services.NVPCallerServices"%>
<%@ page import="com.paypal.sdk.util.*"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder"%>
<%@ page import="java.util.*"%>
<%@ page language="java"%>

<html>
<head>
<title>Create Recurring Payments Profile</title>
<link href="..\sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

   	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.				
		NVPEncoder encoder = new NVPEncoder();
		
		encoder.add("METHOD","CreateRecurringPaymentsProfile");
		encoder.add("AMT",(String)request.getParameter("amount"));
		encoder.add("CREDITCARDTYPE",(String)request.getParameter("creditCardType"));		
		encoder.add("ACCT",(String)request.getParameter("creditCardNumber"));						
		encoder.add("EXPDATE",(String)request.getParameter("expDateMonth")+(String)request.getParameter("expDateYear"));
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
		
		String day=request.getParameter("pDate");
	    String month=request.getParameter("pMonth");
	    String year=request.getParameter("pYear");
	    String date=year+"-"+month+"-"+day+"T0:0:0";
		encoder.add("PROFILESTARTDATE",date);
		encoder.add("BILLINGPERIOD",(String)request.getParameter("BillingPeriod"));
		encoder.add("BILLINGFREQUENCY",(String)request.getParameter("BillingFrequency"));
		encoder.add("TOTALBILLINGCYCLES",(String)request.getParameter("BillingCycles"));
		encoder.add("DESC",(String)request.getParameter("ProfileDescription"));
		
		//encode method will encode the name and value and form NVP string for the request		
		String NVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = 
			(String) caller.call(NVPString);
		
			//NVPDecoder object is created		
			NVPDecoder resultValues = new NVPDecoder();
			//decode method of NVPDecoder will parse the request and decode the name and value pair			
			resultValues.decode(ppresponse);
	
			//checks for Acknowledgement and redirects accordingly to display error messages					
			String strAck = resultValues.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",resultValues);
				response.sendRedirect("../APIError.jsp?RecurringPage=RecurringPayments.jsp");
				return;
			}
			Map decodedMap=resultValues.getMap();
			Set set=decodedMap.entrySet();
			Iterator itr=set.iterator();
%>


<br>
<center><font size=2 color=black face=Verdana><b>Create Recurring Payments Profile</b></font> 
<br>
<br>

<table width=400>
	<% while(itr.hasNext()){
		Map.Entry  m=(Map.Entry)itr.next(); %>
		<tr>
			<td><%=m.getKey() %>:</td>
			<td><%=m.getValue() %></td>
		</tr>
	<%} %>
</table><br/><br/>
  <a  href="GetRecurringPaymentsProfileDetails.jsp?profileid=<%=resultValues.get("PROFILEID")%>">Get Recurring Payments Details</a>
</center> <br/>
<a id="CallsLink" href="RecurringPayments.jsp">Recurring Payments Home</a>
<%
    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("../Error.jsp");
		return;
	}
    
    %>
</body>
</html>
