<%@ page import="com.salesforce.saml.Identity,com.salesforce.util.Bag,java.util.Set,java.util.Iterator,java.util.ArrayList" %>
<%
Identity identity = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("IDENTITY")) {
     identity = new Identity(cookie.getValue(),true);
    }
  }
}

%>

<html>
<head>
<title>Nord Anglia</title>
<link rel="stylesheet" type="text/css" href="/css/theme.css">
<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="container">
		<div id="header">
			<div id="header-inner">
			<div id="header-left">
				<img width="420" height="38.78" src="https://www.nordangliaeducation.com/_cms-site-content/_corporate2/i/corporate-nae-logo-2015.png"/>
			</div>
			<div id="header-right">
				<% if (identity == null ) { %>
				<a href="/_saml?RelayState=%2F"><button>Login</button></a>
				<% } else {  %>
					<a href="/_saml?logout=true"><button>Logout</button></a>
					<% } %>
			</div>
		</div>
			<div class="clear"></div>
			<div id="navmenu">
				<ul>
					<li>HOME</li>
					<li style="background: url('https://www.nordangliaeducation.com/resources/asia/_cms-site-content/_school-master/img/new-brand-2015/navDivot.png') center 0 no-repeat;">ABOUT US</listyle="background: url('https://www.nordangliaeducation.com/resources/asia/_cms-site-content/_school-master/img/new-brand-2015/navDivot.png') center 0 no-repeat;">
					<li>OUR SCHOOLS</li>
					<li>OUR PEOPLE</li>
					<li>TEACHING AND LEARNING</li>
					<li>SUMMER EXPERIENCES</li>
					<li>CAREERS</li>
					<li>NEWS &amp; EVENTS</li>
				</ul>
			</div>
		</div> <!-- end header //-->   
		<div class="clear"></div>
		<div id="middle-outer">         
		<div id="middle">
			<div id="imagebanner"></div>
			<div id="blueline"></div>
			<% if (identity != null ) { %>
				<div id="userdetails">				
					<div id="userdetails-inner">
						<h1>SAML Response</h1>
				<table border="0" cellpadding="5">
					<tr><td><b>Subject:</b></td><td><%= identity.getSubject() %></td></tr>
				<%
					Bag attributes = identity.getAttributes();
					Set keySet = attributes.keySet();
					Iterator iterator = keySet.iterator();
					while (iterator.hasNext()){
						String key = (String)iterator.next();
						%><tr><td><b><%= key %>:</b></td><td><%
						ArrayList<String> values = (ArrayList<String>)attributes.getValues(key);
						for (String value : values) {
							%><%= value %><br/><%
						}
						%></td></tr><%
				
					}
				
				%>
				</table>
				</div>			
				</div>
				<% } %>
			<div id="grid">
				<h1>About Nord Anglia Education</h1>
				<ul>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/de2/f79/145684-cropped-w300-h220-of-1-FFFFFF-about-nae.jpg"/></div>
						<div class="innerblue">
							<span class="heading">About Nord Anglia Education</span>
							<p class="text">
								Nord Anglia offers a world leading education to students aged 2 to 18. We are a global family of more than 64,000 ambitious learne...
							</p>
						</div>
					</li>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/c3d/45b/145685-cropped-w300-h220-of-1-FFFFFF-school-in-action.jpg"/></div>
						<div class="innerblue">
							<span class="heading">Our Schools in Action</span>
							<p class="text">                                    
								Nord Anglia Education schools are hubs of activity. We provide outstanding opportunities for your child to explore their interests...                                                
							</p>
						</div>
					</li>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/dc3/33d/29030-cropped-w300-h220-of-1-FFFFFF-beijing-sanlitun_173_crop.jpg"/></div>
						<div class="innerblue">
							<span class="heading">Why choose a Nord Anglia Education school?</span>
							<p class="text">                                    
								Discover why your child will love a Nord Anglia education                                                 
							</p>
						</div>
					</li>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/fdd/904/28954-cropped-w300-h220-of-1-FFFFFF-about-nord-anglia-education-05.jpg"/></div>
						<div class="innerblue">
							<span class="heading">Why we believe in Being Ambitious</span>
							<p class="text">
								We are ambitious for our students, our people and our family of schools. 
							</p>
						</div>
					</li>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/445/2ee/5491-cropped-w300-h220-of-1-FFFFFF-shunyi_318.JPG"/></div>
						<div class="innerblue">
							<span class="heading">What Parents Say</span>
							<p class="text">
								Parents share their thoughts about our schools.
							</p>
						</div>
					</li>
					<li>
						<div><img width="100%" src="https://img.nordangliaeducation.com/resources/asia/_filecache/add/4c6/4991-cropped-w300-h220-of-1-FFFFFF-prague-_220.JPG"/></div>
						<div class="innerblue">
							<span class="heading">Supporting Our Communities</span>
							<p class="text">
								Our mission is to help others thrive.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div> <!-- end middle //-->
	</div>
		<div id="footer">

		</div> <!-- end footer //-->
	</div> <!-- end container //-->




</body>
</html>