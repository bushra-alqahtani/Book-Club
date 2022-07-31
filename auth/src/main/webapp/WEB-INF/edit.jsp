 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  	<div class="container m-5">

			<div class="row g-0 ">
				<div class="col-sm-6 col-md-8">
					<h1>edit your shelf!</h1>
				</div>  	
				<div class="col-6 col-md-4">
			  	  	
		        		<a href="/logout">Logout</a><br>
		        		<a href="/books"> back to all shelves</a>
		  </div> 
 
 		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		</div>
<div class="container m-5 ">

<form:form action="/books/${book.id}" method="post" modelAttribute="book">
<input type="hidden" name="_method" value="put">
    <p>
        <form:label path="title">Title :</form:label><br>
        <form:input path="title" />
        <form:errors path="title"/>
    </p>
    <p>
        <form:label path="author"> Author :</form:label><br>
        <form:input path="author" />
        <form:errors path="author"/>
    </p>    
    <p>
        <form:label path="myth">My Thoughts :</form:label><br>
        <form:textarea path="myth" />
        <form:errors path="myth"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>
</div>

</div>
</body>
</html>

  