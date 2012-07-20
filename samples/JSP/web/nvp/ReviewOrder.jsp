<%@ include file='constants.jsp' %>
<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page language="java" %>

<html>
<head>
<title>PayPal NVP SDK - ExpressCheckout- Instant API</title>
</head> 
<body alink=#0000FF vlink=#0000FF>
<br>
<center>
<font size=2 color=black face=Verdana><b>SetExpressCheckout</b></font>
<br><br>
<%
try {
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");		
    
	StringBuffer url = new StringBuffer();
	url.append("http://");
	url.append(request.getServerName());
	url.append(":");
	url.append(request.getServerPort());
	url.append(request.getContextPath());
	
	String returnURL = url.toString() + "/nvp/GetExpressCheckoutDetails.jsp?=" + "&currencyCodeType=" + request.getParameter("currencyCodeType");
	String cancelURL = url.toString() + "/nvp/SetExpressCheckout.jsp?"+"paymentType=" + request.getParameter("paymentType") ;
	
	String strNVPRequest = "";
	StringBuffer sbErrorMessages= new StringBuffer("");

	//NVPEncoder object is created and all the name value pairs are loaded into it.
	NVPEncoder encoder = new NVPEncoder();

	encoder.add("METHOD","SetExpressCheckout");
	encoder.add("RETURNURL",returnURL + "?paymentAmount=" + request.getParameter("paymentAmount") + "&currencyCodeType=" + request.getParameter("currencyCodeType"));
	encoder.add("CANCELURL",cancelURL);
	
	//encoder.add("AMT",request.getParameter("paymentAmount"));
	encoder.add("PAYMENTACTION",request.getParameter("paymentType"));
	encoder.add("CURRENCYCODE",request.getParameter("currencyCodeType"));	
	
	
	encoder.add("SHIPTONAME",request.getParameter("NAME"));
	encoder.add("SHIPTOSTREET",request.getParameter("SHIPTOSTREET"));
	encoder.add("SHIPTOCITY",request.getParameter("SHIPTOCITY"));
	encoder.add("SHIPTOSTATE",request.getParameter("SHIPTOSTATE"));
	encoder.add("SHIPTOCOUNTRY",request.getParameter("SHIPTOCOUNTRYCODE"));
	encoder.add("SHIPTOZIP",request.getParameter("SHIPTOZIP"));
	encoder.add("L_NAME0",request.getParameter("L_NAME0"));
	encoder.add("L_NUMBER0","1000");
	encoder.add("L_DESC0","Size: 8.8-oz");
	encoder.add("L_AMT0",request.getParameter("L_AMT0"));
	encoder.add("L_QTY0",request.getParameter("L_QTY0"));
	encoder.add("L_NAME1",request.getParameter("L_NAME1"));
	encoder.add("L_NUMBER1","10001");
	encoder.add("L_DESC1","Size: Two 24-piece boxes");
	encoder.add("L_AMT1",request.getParameter("L_AMT1"));
	encoder.add("L_QTY1",request.getParameter("L_QTY1"));
	encoder.add("L_ITEMWEIGHTVALUE1","0.5");
	encoder.add("L_ITEMWEIGHTUNIT1","lbs");
	encoder.add("ADDROVERRIDE","1");
	// add up all line amount, L_AMTns 
	//String L_QTY0=(request.getParameter("L_QTY0").trim()=="")? "0" : request.getParameter("L_QTY0").trim();
	//String L_AMT0=(request.getParameter("L_AMT0").trim()=="")? "0" : request.getParameter("L_AMT0").trim();
	//String L_QTY1=(request.getParameter("L_QTY1").trim()=="")? "0" : request.getParameter("L_QTY1").trim();
	//String L_AMT1=(request.getParameter("L_AMT1").trim()=="")? "0" : request.getParameter("L_AMT1").trim();
	
	//float ft = Float.valueOf(L_QTY0).floatValue()*Float.valueOf(L_AMT0).floatValue()+
	//Float.valueOf(L_QTY1).floatValue()*Float.valueOf(L_AMT1).floatValue();
	
	float ft = Float.valueOf(request.getParameter("L_QTY0").trim()).floatValue()*Float.valueOf(request.getParameter("L_AMT0").trim()).floatValue()+
	Float.valueOf(request.getParameter("L_QTY1").trim()).floatValue()*Float.valueOf(request.getParameter("L_AMT1").trim()).floatValue();
	
	encoder.add("ITEMAMT",String.valueOf(ft));
	encoder.add("TAXAMT","2.00");
	//amount = itemamount+ shippingamt+shippingdisc+taxamt+insuranceamount;
	float amt = Util.round(ft + 5.00f+ 2.00f+1.00f,2);	
	float maxamt = Util.round(amt+25.00f,2);
	encoder.add("SHIPDISCAMT","-3.00");
	encoder.add("AMT",String.valueOf(amt));
	encoder.add("SHIPPINGAMT","8.00");
	encoder.add("MAXAMT",String.valueOf(maxamt));
	encoder.add("CALLBACK","https://www.ppcallback.com/callback.pl");
	encoder.add("INSURANCEOPTIONOFFERED","true");
	encoder.add("INSURANCEAMT","1.00");
	encoder.add("L_SHIPPINGOPTIONISDEFAULT0","false");
	encoder.add("L_SHIPPINGOPTIONNAME0","Ground");
	encoder.add("L_SHIPPINGOPTIONLABEL0","UPS Ground 7 Days");
	encoder.add("L_SHIPPINGOPTIONAMOUNT0","3.00");
	encoder.add("L_SHIPPINGOPTIONISDEFAULT1","true");
	encoder.add("L_SHIPPINGOPTIONNAME1","UPS Air");
	encoder.add("L_SHIPPINGOPTIONlABEL1","UPS Next Day Air");
	encoder.add("L_SHIPPINGOPTIONAMOUNT1","8.00");
	encoder.add("CALLBACKTIMEOUT","4");
	
	session.setAttribute("paymentType", request.getParameter("paymentType"));
	session.setAttribute("currencyCodeType", request.getParameter("currencyCodeType"));
	String testEnv = (String)session.getAttribute("environment");
	
		//encode method will encode the name and value and form NVP string for the request	
		strNVPRequest = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String ppresponse =
			(String) caller.call( strNVPRequest);

		//NVPDecoder object is created
		NVPDecoder resultValues = new NVPDecoder();
		
		//decode method of NVPDecoder will parse the request and decode the name and value pair			
		resultValues.decode(ppresponse);
		
			//checks for Acknowledgement and redirects accordingly to display error messages		
		String strAck = resultValues.get("ACK"); 
		if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
		{
			session.setAttribute("response",resultValues);
			response.sendRedirect("APIError.jsp");
			return;
		}else {
				
			response.sendRedirect("https://www."+testEnv+".paypal.com/cgi-bin/webscr?cmd=_express-checkout&token="+resultValues.get("TOKEN"));
					
		}
	} catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>
</center>
<a id="CallsLink" href="Calls.html">Home</a>
</body>
</html>