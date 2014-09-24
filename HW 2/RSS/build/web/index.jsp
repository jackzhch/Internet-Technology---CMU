<%-- 
    Document   : index
    Created on : Feb 11, 2014, 10:51:13 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript" src="update.js"></script>
        <title>RSS</title>
    </head>
    <body>
        <h1>Please Select A Topic:</h1>
        <div>
        <select id="source">
            <option value="BBC">BBC</option>
            <option value="NYT">New York Times</option>
            <option value="SMH">Sydney Morning Herald</option>
        </select><br><br>    
        <select id="topic">
            <option value="Business">Business</option>
            <option value="Technology">Technology</option>
            <option value="World News">World News</option>
        </select><br><br>
            <button onclick="submit()">Search</button>
        </div> 
        
        <div id ="contents"></div>
    </body>
</html>
