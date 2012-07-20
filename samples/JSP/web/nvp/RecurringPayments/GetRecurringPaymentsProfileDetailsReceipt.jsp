<%@ page import="com.paypal.sdk.services.NVPCallerServices"%>
<%@ page import="com.paypal.sdk.util.*"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder"%>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder"%>
<%@ page import="java.util.*"%>
<%@ page language="java"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>Recurring Payments Profile Details</title>
<LINK href="..\sdk.css" type="text/css" rel="stylesheet"></LINK>
</HEAD>
<body>
<%
    //NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

  	try {
		//NVPEncoder object is created and all the name value pairs are loaded into it.				
		NVPEncoder encoder = new NVPEncoder();
		
		encoder.add("METHOD","GetRecurringPaymentsProfileDetails");
        encoder.add("PROFILEID",request.getParameter("profileId"));
        //encode method will encode the name and value and form NVP string for the request		
		String NVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = (String) caller.call(NVPString);
		
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
<center><font size="2" color="black" face="Verdana"><b>Recurring Payments Profile Details</b></font> <br>
<br>

<table width="400">
	<% while(itr.hasNext()){
		Map.Entry  m=(Map.Entry)itr.next(); %>
	<tr>
		<td><%=m.getKey() %>:</td>
		<td><%=m.getValue() %></td>
	</tr>
	<%} %>
</table>
</center><br/>
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