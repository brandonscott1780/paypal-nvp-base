

<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>

<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>


<html>
<head>
    <title>Transaction details</title>
    <link href="sdk.css" rel="stylesheet" type="text/css" />
</head>
<body>


<%
	//NVPCallerServiced object is taken from the session
	NVPCallerServices caller = (NVPCallerServices) session.getValue("caller");

	try {

		//NVPEncoder object is created and all the name value pairs are loaded into it.				
		NVPEncoder encoder = new NVPEncoder();
		encoder.add("METHOD","GetTransactionDetails");
		encoder.add("TRANSACTIONID",request.getParameter("transactionID"));
		
		//encode method will encode the name and value and form NVP string for the request		
		String strNVPString = encoder.encode();
		
		//call method will send the request to the server and return the response NVPString		
		String ppresponse = 
			(String) caller.call(strNVPString);
		
			//NVPDecoder object is created		
			NVPDecoder resultValues = new NVPDecoder();
			
			//decode method of NVPDecoder will parse the request and decode the name and value pair			
			resultValues.decode(ppresponse);
		    
			ResponseBuilder rb=new ResponseBuilder();
		    String header1="Transaction Details";
		    String header2=null;
		    String resp=rb.BuildResponse(resultValues,header1,header2);
		    
            String payer=(String)resultValues.get("RECEIVERBUSINESS");
			String payerID=(String)resultValues.get("PAYERID");				
			String firstName=(String)resultValues.get("FIRSTNAME");
			String lastName=(String)resultValues.get("LASTNAME");
			String transactionID=(String)resultValues.get("TRANSACTIONID");
			String parentTransactionID=(String)resultValues.get("PARENTTRANSACTIONID");
			String grossAmount=(String)resultValues.get("AMT");
			String paymentStatus=resultValues.get("PAYMENTSTATUS");
			String protectionEligibility = (String)resultValues.get("PROTECTIONELIGIBILITY");
			String pendingreason = (String)resultValues.get("PENDINGREASON");
	
			//checks for Acknowledgement and redirects accordingly to display error messages			
			String strAck = resultValues.get("ACK"); 
			if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))
			{
				session.setAttribute("response",resultValues);
				response.sendRedirect("APIError.jsp");
				return;
			}
%>

    
    <center>
    <table>
        <tr>
           <td><%=resp %></td>
        </tr>
        <tr>
			   <td align="center" colspan="3">
                <a id="DoVoidLink" href="DoVoid.jsp?transactionID=<%=transactionID%>"></br>Void</a> <a id="DoCaptureLink" href="DoCapture.jsp?transactionID=<%=transactionID%>&currency=<%=resultValues.get("CURRENCYCODE") %>&amount=<%=grossAmount %>">
                Capture</a> <a id="RefundTransactionLink" href="RefundTransaction.jsp?transactionID=<%=transactionID%>&currency=<%=resultValues.get("CURRENCYCODE") %>&amount=<%=grossAmount %>">
                    Refund</a> <a href="javascript:history.back()">Back</a>
            </td>
        </tr>
    </table>
    
    <%
    
    } catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
		return;
	}
    
    %>
    </center>
    <a class="home" id="CallsLink" href="Calls.html">Home</a>
</body>
</html>
