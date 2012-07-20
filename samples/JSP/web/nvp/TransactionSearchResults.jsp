
<html>

<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page language="java" %>
<head>
    <title>PayPal PHP SDK: Transaction Search Results</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<span id=apiheader>Transaction Search Results</span> </br> </br>
<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");
		
	try {
		
		if(request.getParameter("startDate")!=null && !request.getParameter("startDate").toString().equals(""))
		{
			DateFormat dfRead = new SimpleDateFormat("MM/dd/yyyy");
			Calendar startDateObj = Calendar.getInstance();
			startDateObj.setTime(dfRead.parse((String)request.getParameter("startDate")));
		}

		//NVPEncoder object is created and all the name value pairs are loaded into it.		
		NVPEncoder encoder = new NVPEncoder();

		encoder.add("METHOD","TransactionSearch");
		encoder.add("TRXTYPE","Q");
		DateFormat dfRead = new SimpleDateFormat("MM/dd/yyyy");
		if(request.getParameter("startDate")!=null && !request.getParameter("startDate").toString().equals(""))
		{
			Calendar startDateObj = Calendar.getInstance();
			startDateObj.setTime(dfRead.parse((String)request.getParameter("startDate")));
			encoder.add("STARTDATE",startDateObj.get(Calendar.YEAR)+"-"+(startDateObj.get(Calendar.MONTH)+1)+"-"+startDateObj.get(Calendar.DAY_OF_MONTH)+"T00:00:00Z");
		}
		
		if(request.getParameter("endDate")!=null && !request.getParameter("endDate").toString().equals(""))
		{
			Calendar endDateObj = Calendar.getInstance();
			endDateObj.setTime(dfRead.parse((String)request.getParameter("endDate")));
			encoder.add("ENDDATE",endDateObj.get(Calendar.YEAR)+"-"+(endDateObj.get(Calendar.MONTH)+1)+"-"+endDateObj.get(Calendar.DAY_OF_MONTH)+"T24:00:00Z");
		}
		
		encoder.add("TRANSACTIONID",(String)request.getParameter("transactionID"));

		//encode method will encode the name and value and form NVP string for the request
		String strNVPRequest = encoder.encode(); 

		//call method will send the request to the server and return the response NVPString
		String strNVPResponse =
			(String) caller.call( strNVPRequest);

		//NVPDecoder object is created
		NVPDecoder decoder = new NVPDecoder();

		//decode method of NVPDecoder will parse the request and decode the name and value pair
		decoder.decode(strNVPResponse);

		//checks for Acknowledgement and redirects accordingly to display error messages			
		String strAck = decoder.get("ACK"); 
		if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
		{
			session.setAttribute("response",decoder);
			response.sendRedirect("APIError.jsp");
			return;
		}

		if (decoder.get("L_TRANSACTIONID0") != null && !decoder.get("L_TRANSACTIONID0").equals("") ){
%>
    <center>
    <table class="api">
        <tr>
            <td colspan="6" align=right>
           <% int intRecordCount = 0;
			while(decoder.get("L_TRANSACTIONID"+intRecordCount)!=null && decoder.get("L_TRANSACTIONID"+intRecordCount).length()>0 )
			{
				intRecordCount++;
			}
			%>
                Results 1 - <%=intRecordCount%>
            </td>
        </tr>
        <tr>
            <td >
            </td>
            <td >
                <b>ID</b></td>
            <td>
                <b>Time </b></td>
            <td >
                <b>Status<b></td>
            <td >
                <b>Payer Name</b></td>
            <td >
                <b>Gross Amount</b></td>
        </tr>
        
     <%
			DateFormat df = new SimpleDateFormat();
			int intCount = 0;
			while(decoder.get("L_TRANSACTIONID"+intCount)!=null && decoder.get("L_TRANSACTIONID"+intCount).length()>0 )
			{
	%>	   
        <tr>
            <td>
                <%=intCount+1%>
            </td>
            <td>
                <a id="TransactionDetailsLink0" href='TransactionDetails.jsp?transactionID=<%=decoder.get("L_TRANSACTIONID"+intCount)%>'><%=decoder.get("L_TRANSACTIONID"+intCount) %> </a>
            </td>
            <td>
                <%=(decoder.get("L_TIMESTAMP"+intCount) != null)?decoder.get("L_TIMESTAMP"+intCount):"" %></td>
            <td>
                <%=(decoder.get("L_STATUS"+intCount) != null)?decoder.get("L_STATUS"+intCount):"" %></td></td>
            <td>
                <%=(decoder.get("L_NAME"+intCount) != null)?decoder.get("L_NAME"+intCount):"" %></td></td>            
            </td>
            <td>
                USD<%=(decoder.get("L_AMT"+intCount) != null)?decoder.get("L_AMT"+intCount):"" %></td>
            </td>
        </tr>
    <%
    		intCount++;
			}
	%>
        
    </table>
    </center>
    <%
		} else {
%>
		<br>Found 0 transactions
<%
		}
	} catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
%>
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>
