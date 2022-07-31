 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
 <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  	<div class="container m-5">
  	
  		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		
			<div class="row g-0 text-center">
				<div class="col-sm-6 col-md-8">
					<h1 style="color:orange;"> welcome <c:out value="${username}"/> </h1>
					<p>Books from every one shelves</p>
				</div>  	
				<div class="col-6 col-md-4">
			  	  	
		        		<a href="/logout">Logout</a><br>
		        		<a href="/books/new">+ Create your shelf</a>
		  </div>
		  <div class ="container m-5">
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">id</th>
					      <th scope="col">title</th>
					      <th scope="col">author name</th>
					      <th scope="col">posted by</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="i" items="${books}">
					    <tr>
					      <th scope="row"><c:out value="${i.id}" /></th>
					      <td><a href="/books/${i.id}"><c:out value="${i.title}" /></a></td>
					      <td><c:out value="${i.author}" /></td>
					      <td><c:out value="${i.user.username}" /></td>
					    </tr>
					 </c:forEach>
					  </tbody>
					</table>
				
				</div>
				
				
				
				
			</div>	
</div>
</body>
</html>


  