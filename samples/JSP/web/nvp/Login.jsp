<%@ include file='constants.jsp' %>  
<%@ page import="com.paypal.sdk.profiles.APIProfile" %>
<%@ page import="com.paypal.sdk.profiles.ProfileFactory" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="caller" scope="session" class="com.paypal.sdk.services.NVPCallerServices" />

<%	
	
	
	try {
		APIProfile profile = null;
				
		Hashtable pars = new Hashtable();
		if (FileUpload.isMultipartContent(request)) {
			DiskFileUpload upload = new DiskFileUpload();

			// Parse the request
			List items = upload.parseRequest(request);
	
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (item.isFormField()) {
					pars.put(item.getFieldName(), item.getString());
					
				} else {
					if ((item.getName() != null) && (item.getName().length() > 0)) {
						File cfile = new File(item.getName()); 
						File tosave = new File(getServletContext().getRealPath("/cert/"),cfile.getName());
						item.write(tosave);
						pars.put("certificateFile", tosave.getAbsolutePath());
					}
				}
			}
		}
		
	        String unipay = (String)pars.get("subjectEmail");
	        
		if (pars.containsKey("DefaultButton")) {
			/*
			 WARNING: Do not embed plaintext credentials in your application code.
 			 Doing so is insecure and against best practices.
			 Your API credentials must be handled securely. Please consider 
			 encrypting them for use in any production environment, and ensure
			 that only authorized individuals may view or modify them.
			 */
			//profile = ProfileFactory.createSignatureAPIProfile();
			//profile.setAPIUsername(DEFAULT_USER_NAME);
			//profile.setAPIPassword(DEFAULT_PASSWORD);
			//profile.setSignature(DEFAULT_SIGNATURE);
			//profile.setEnvironment(testEnv);
			//session.setAttribute("environment", testEnv);
			
			profile = ProfileFactory.createSSLAPIProfile();
			profile.setAPIUsername("sdk-seller_api1.sdk.com");
			profile.setAPIPassword("12345678");
			profile.setCertificateFile(getServletContext().getRealPath("WEB-INF/cert/sdk-seller.p12"));
			profile.setPrivateKeyPassword("password");
			profile.setEnvironment((String)pars.get("defaultenvironment"));
			session.setAttribute("environment",(String)pars.get("defaultenvironment"));
		} else if (pars.containsKey("certificateFile") && !pars.containsKey("oauthSignature")) {
			profile = ProfileFactory.createSSLAPIProfile();
			profile.setAPIUsername((String) pars.get("apiUsername"));
			profile.setAPIPassword((String) pars.get("apiPassword"));
			profile.setCertificateFile((String) pars.get("certificateFile"));
			profile.setPrivateKeyPassword((String) pars.get("privateKeyPassword"));
			profile.setEnvironment((String)pars.get("environment"));
			profile.setSubject((String) pars.get("subjectEmail"));
			session.setAttribute("environment",(String)pars.get("environment"));
		} else if(pars.containsKey("signature")){
			profile = ProfileFactory.createSignatureAPIProfile();
			profile.setAPIUsername((String) pars.get("apiUsername"));
			profile.setAPIPassword((String) pars.get("apiPassword"));
			profile.setSignature((String) pars.get("signature"));
			profile.setEnvironment((String)pars.get("environment"));
			profile.setSubject((String) pars.get("subjectEmail"));
			session.setAttribute("environment",(String)pars.get("environment"));
		}else if(pars.containsKey("oauthSignature")){
			profile = ProfileFactory.createPermissionAPIProfile();
			profile.setOauth_Signature((String)pars.get("oauthSignature"));
			profile.setOauth_Token((String)pars.get("oauthToken"));
			profile.setOauth_Timestamp((String)pars.get("oauthTimesStamp"));
			profile.setCertificateFile((String) pars.get("certificateFile"));
			profile.setPrivateKeyPassword((String) pars.get("privateKeyPassword"));
			profile.setEnvironment((String)pars.get("environment"));
			session.setAttribute("environment",(String)pars.get("environment"));
		}else if ( unipay != null && unipay.length() > 6 ) {
			profile = ProfileFactory.createUniPayAPIProfile();
			profile.setFirstPartyEmail((String) pars.get("subjectEmail"));
			session.setAttribute("environment",(String)pars.get("environment"));
			profile.setEnvironment((String)pars.get("environment"));
		}
		
	caller.setAPIProfile(profile);
    	session.setAttribute("caller", caller);
    	response.sendRedirect("Calls.html");
	} catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
	}
%>
