<%@ page import="com.paypal.sdk.services.*" %>
<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal SDK - API Error</title>
</head>
<body alink=#0000FF vlink=#0000FF>

<%
	NVPDecoder decoder = (NVPDecoder) session.getValue("response");
	ResponseBuilder rb=new ResponseBuilder();
	String header1="PayPal API Error";
	String header2="A PayPal API has returned an error!";
	String resp=rb.BuildResponse(decoder,header1,header2);
	
%>

<%=resp %>
	
<%
  String recurringPage=request.getParameter("RecurringPage"); 
  if(recurringPage != null && recurringPage.equalsIgnoreCase("RecurringPayments.jsp")){
%>
  <a id="CallsLink" href="RecurringPayments/RecurringPayments.jsp">Home</a>
<% }else{%>
  <a id="CallsLink" href="Calls.html">Home</a>
<%} %>  

  
</body>
</html>