#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="${package}.util.Version"%><html>
<%
	/*
	 Just so I don't forget : when doing old school JSPs on JBoss AS7 (skip AS 7.1.1 as it ignores the following config), 
	 one need to enable JSP hot reloading in <jbossas.home>/standalone/configuration/standalone.xml.
	 See https://issues.jboss.org/browse/AS7-659

	 <subsystem xmlns="urn:jboss:domain:web:1.0" default-virtual-server="default-host">
	 <connector name="http" protocol="HTTP/1.1" socket-binding="http" scheme="http"/>
	 <configuration>
	 <jsp-configuration development="true" />
	 </configuration>
	 <virtual-server name="default-host" enable-welcome-root="true">
	 <alias name="localhost"/>
	 <alias name="example.com"/>
	 </virtual-server>
	 </subsystem>
	 */
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${parentArtifactId} <%=Version.VALUE%></title>
</head>
  <!-- Make this boostrap-based page stand out : using the slate theme from http://bootswatch.com/ (based off bootstrap 2.0.3) -->
  <link rel="stylesheet" 	href="resources/css/bootswatch-slate/bootstrap.min.css" />
  <style type="text/css">
    body {
      padding-top: 60px;
    }
  </style>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
        	<div class="container">
				<a class="brand" href="${symbol_dollar}{pageContext.request.contextPath}">${parentArtifactId}</a>
			</div>
		</div>
	</div>
	<div class="container">
		<form action="greeting" class="well form-inline">
			<div class="clearfix">
				<label for="name">What is your name?</label>
				<div class="input">
					<input type="text" name="name" id="name" class="input-small" /> 
					<input type="submit" class="btn btn-primary btn-medium" name="go" value="go" />
				</div>
			</div>
		</form>
		<c:if test="${symbol_dollar}{not empty requestScope.greeting}">
			<div class="alert alert-success fade in">
				<a class="close" data-dismiss="alert" href="#">×</a>
				<strong>Success</strong>
				<p>${symbol_dollar}{requestScope.greeting}</p>
			</div>
		</c:if>
	</div>
	<!-- Use jQuery to enable bootstrap-alert (adding closing functionality to alert messages)-->
	<!-- Using a CDN to get jQuery, as eclipse doesn't like it very much 
	     and finds some JavaScript validation errors -->
	<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script src="resources/js/bootstrap-alert.js"></script>
</body>
</html>