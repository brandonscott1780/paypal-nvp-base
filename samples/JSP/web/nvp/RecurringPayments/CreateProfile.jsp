<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>PayPal JAVA SDK - CreateProfile API</title>
<LINK href="sdk.css" type="text/css" rel="stylesheet"></LINK>
</HEAD>
<body vLink="#0000ff" aLink="#0000ff">
<br>
<center><font face="Verdana" color="black" size="2"><b>Create
Profile</b></font> <br>
<br>

<form name="CreateProfileForm" method="post" action="CreateProfileReceipt.jsp"
	id="CreateProfileForm">

<script language="javascript" type="text/javascript">
  function generateCC(){
	var cc_number = new Array(16);
	var cc_len = 16;
	var start = 0;
	var rand_number = Math.random();
	
	switch(document.CreateProfileForm.creditCardType.value)
    {
		case "Visa":
			cc_number[start++] = 4;
			break;
		case "Discover":
			cc_number[start++] = 6;
			cc_number[start++] = 0;
			cc_number[start++] = 1;
			cc_number[start++] = 1;
			break;
		case "MasterCard":
			cc_number[start++] = 5;
			cc_number[start++] = Math.floor(Math.random() * 5) + 1;
			break;
		case "Amex":
			cc_number[start++] = 3;
			cc_number[start++] = Math.round(Math.random()) ? 7 : 4 ;
			cc_len = 15;
			break;
    }
    
    for (var i = start; i < (cc_len - 1); i++) {
		cc_number[i] = Math.floor(Math.random() * 10);
    }
	
	var sum = 0;
	for (var j = 0; j < (cc_len - 1); j++) {
		var digit = cc_number[j];
		if ((j & 1) == (cc_len & 1)) digit *= 2;
		if (digit > 9) digit -= 9;
		sum += digit;
	}
	
	var check_digit = new Array(0, 9, 8, 7, 6, 5, 4, 3, 2, 1);
	cc_number[cc_len - 1] = check_digit[sum % 10];
	
	document.CreateProfileForm.creditCardNumber.value = "";
	for (var k = 0; k < cc_len; k++) {
		document.CreateProfileForm.creditCardNumber.value += cc_number[k];
	}
}
</script>

<table width="600">
	<tr>
		<td align="right">First Name:</td>
		<td align="left"><input name="firstName" id="firstName"
			type="text" maxlength="32" size="30" value="John" /></td>
	</tr>
	<tr>
		<td align="right">Last Name:</td>
		<td align="left"><input name="lastName" id="lastName" type="text"
			maxlength="32" size="30" value="Doe" /></td>
	</tr>
	<tr>
		<td align="right">Card Type:</td>
		<td align="left"><select name="creditCardType"
			onchange="generateCC();" language="javascript"
			id="creditCardType">
			<option selected="selected" value="Visa">Visa</option>
			<option value="MasterCard">MasterCard</option>
			<option value="Discover">Discover</option>
			<option value="Amex">American Express</option>
		</select></td>
	</tr>
	<tr>
		<td align="right">Card Number:</td>
		<td align="left"><input name="creditCardNumber"
			id="creditCardNumber" type="text" maxlength="19" size="19"
			value="4955403118506255" /></td>
	</tr>
	<tr>
		<td align="right">Expiration Date:</td>
		<td align="left">
		<p><select name="expDateMonth" id="expDateMonth">
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select> <select name="expDateYear" id="expDateYear">
			<option value="2005">2005</option>
			<option value="2006">2006</option>
			<option value="2007">2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option selected="selected" value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>

		</select></p>
		</td>
	</tr>
	<tr>
		<td align="right">Card Verification Number:</td>
		<td align="left"><input name="cvv2Number" id="cvv2Number"
			type="text" maxlength="4" size="3" value="962" /></td>
	</tr>
	<tr>
		<td align="right"><br>
		<b>Profile Details:</b></td>
	</tr>
	<tr>
		<td align="right">Profile Description:</td>
		<td align="left"><input name="ProfileDescription"
			id="ProfileDescription" type="text" maxlength="100" size="50"
			value="Welcome to the world of shipping where you get anything" /></td>
	</tr>
	<tr>
		<td align="right">Billing Period:</td>
		<td align="left"><select name="BillingPeriod" id="BillingPeriod">
			<option value="Day">Day</option>
			<option value="Week">Week</option>
			<option value="SemiMonth">SemiMonth</option>
			<option value="Month">Month</option>
			<option value="Year">Year</option>

		</select></td>
	</tr>
	<tr>
		<td align="right">Billing Frequency:</td>
		<td align="left"><input name="BillingFrequency"
			id="BillingFrequency" type="text" maxlength="100" size="50" value="4" /></td>
	</tr>
	&nbsp;
	<TR>
		<td align="right">Total Billing Cycles:</td>
		<td align="left"><input name="BillingCycles" id="BillingCycles"
			type="text" maxlength="100" size="50" /></td>
	</TR>
	<tr>
		<td class="field">Profile Start Date:</td>
		<td align="left"><select name="pDate" id="pDate">
			<option value="1">01</option>
			<option value="2">02</option>
			<option value="3">03</option>
			<option value="4">04</option>
			<option value="5">05</option>
			<option value="6">06</option>
			<option value="7">07</option>
			<option value="8">08</option>
			<option value="9">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option selected="selected" value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select> <select name="pMonth" id="pMonth">
			<option value="1">01</option>
			<option value="2">02</option>
			<option value="3">03</option>
			<option value="4">04</option>
			<option value="5">05</option>
			<option value="6">06</option>
			<option value="7">07</option>
			<option value="8">08</option>
			<option value="9">09</option>
			<option value="10">10</option>
			<option selected="selected" value="11">11</option>
			<option value="12">12</option>
		</select> <select name="pYear" id="pYear">
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option selected="selected" value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
		</select></td>
	</tr>
	<tr>
		<td align="right"><br>
		<b>Billing Address:</b></td>
	</tr>
	<tr>
		<td align="right">Address 1:</td>
		<td align="left"><input name="address1" id="address1" type="text"
			maxlength="100" size="25" value="1 Main St" /></td>
	</tr>
	<tr>
		<td align="right">Address 2:</td>
		<td align="left"><input name="address2" id="address2" type="text"
			maxlength="100" size="25" />(optional)</td>
	</tr>
	<tr>
		<td align="right">City:</td>
		<td align="left"><input name="city" id="city" type="text"
			maxlength="40" size="25" value="San Jose" /></td>
	</tr>
	<tr>
		<td align="right">State:</td>
		<td align="left"><select name="state" id="state">
			<option value=""></option>
			<option value="AK">AK</option>
			<option value="AL">AL</option>
			<option value="AR">AR</option>
			<option value="AZ">AZ</option>
			<option selected="selected" value="CA">CA</option>
			<option value="CO">CO</option>
			<option value="CT">CT</option>
			<option value="DC">DC</option>
			<option value="DE">DE</option>
			<option value="FL">FL</option>
			<option value="GA">GA</option>
			<option value="HI">HI</option>
			<option value="IA">IA</option>
			<option value="ID">ID</option>
			<option value="IL">IL</option>
			<option value="IN">IN</option>
			<option value="KS">KS</option>
			<option value="KY">KY</option>
			<option value="LA">LA</option>
			<option value="MA">MA</option>
			<option value="MD">MD</option>
			<option value="ME">ME</option>
			<option value="MI">MI</option>
			<option value="MN">MN</option>
			<option value="MO">MO</option>
			<option value="MS">MS</option>
			<option value="MT">MT</option>
			<option value="NC">NC</option>
			<option value="ND">ND</option>
			<option value="NE">NE</option>
			<option value="NH">NH</option>
			<option value="NJ">NJ</option>
			<option value="NM">NM</option>
			<option value="NV">NV</option>
			<option value="NY">NY</option>
			<option value="OH">OH</option>
			<option value="OK">OK</option>
			<option value="OR">OR</option>
			<option value="PA">PA</option>
			<option value="RI">RI</option>
			<option value="SC">SC</option>
			<option value="SD">SD</option>
			<option value="TN">TN</option>
			<option value="TX">TX</option>
			<option value="UT">UT</option>
			<option value="VA">VA</option>
			<option value="VT">VT</option>
			<option value="WA">WA</option>
			<option value="WI">WI</option>
			<option value="WV">WV</option>
			<option value="WY">WY</option>
			<option value="AA">AA</option>
			<option value="AE">AE</option>
			<option value="AP">AP</option>
			<option value="AS">AS</option>
			<option value="FM">FM</option>
			<option value="GU">GU</option>
			<option value="MH">MH</option>
			<option value="MP">MP</option>
			<option value="PR">PR</option>
			<option value="PW">PW</option>
			<option value="VI">VI</option>
		</select></td>
	</tr>
	<tr>
		<td align="right">ZIP Code:</td>
		<td align="left"><input name="zip" id="zip" type="text"
			maxlength="10" size="10" value="95131" />(5 or 9 digits)</td>
	</tr>
	<tr>
		<td align="right">Country:</td>
		<td align="left">United States</td>
	</tr>
	<tr>
		<td align="right"><br>
		Amount:</td>
		<td align="left"><br>
		<input name="amount" id="amount" type="text" maxlength="7" size="4"
			value="1.00" /> USD</td>
	</tr>
	<tr>
		<td>
		<td><input type="submit" name="PayButton" value="Submit"
			id="PayButton" /></td>
	</tr>
</table>
</form>
</center>
<A id="RecurringPayments" href="RecurringPayments.jsp">Recurring
Payments Home</A>
</body>
</HTML>
