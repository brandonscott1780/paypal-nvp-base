README for PayPal Java SDK Boarding Sample
==========================================

Steps to run the Java SDK for PayPal NVP API Boarding Sample:

1. Download and install the following required software.

   Software:          Version:          Download from:
   =========          ========          ==============
   J2SE SDK            1.6.x      http://java.sun.com/javase/downloads/index.jsp
   Apache Tomcat     5.x or higher      http://tomcat.apache.org/

2. Copy the <PayPal SDK ROOT>\samples\JSP\dist\paypaljsp.war file to your Tomcat 
   webapps folder (<TOMCAT ROOT>\webapps\).

3. Restart Apache Tomcat.

4. Using Tomcat's default configuration running on your local machine, to access the 
   PayPal Java SDK Sample homepage, open the following URL:

   http://localhost:8080/paypaljsp/nvp
   The web sample is a simplified version of reference implementation of PayPal APIs 
   using the wrapper APIs supplied by the SDK you have downloaded.
   
   Instant Update API was launched with PayPal 57.0 product release.  This feature is an enhancement to the Express Checkout flow.  It allows merchants to display shipping options, insurance options and tax amount on the PayPal Review Page.  By consolidating all the information in the PayPal Review Page merchants can eliminate their shipping options page, thus shortening the buying experience.  This in turn will increase the number of completed transactions.    
   
   The sample also includes features related to Instant Update API :
   
   1) The order line item details: how you can display line items in carts on the PayPal Review page. 
   2) Parameters used in SetExpressCheckout and GetExpressCheckoutDetails APIs. 


5. Select the default API Sandbox account, or enter your own API credentials.

6. The PayPal log file (paypaljsp.log) will be created under <TOMCAT ROOT>\logs\.

Steps to build the PayPal Java SDK JSP Sample:

1. Download and install the following required software.

   Software:          Version:       Download from:
   =========          ========       ==============
   Apache Ant         1.6.5          http://ant.apache.org/bindownload.cgi

2. Run ant in the <PayPal SDK ROOT>\samples\JSP\ folder.