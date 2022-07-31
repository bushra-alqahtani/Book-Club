<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
 <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>book details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  	<div class="container m-5">
			<div class="row g-0 ">
				<div class="col-sm-6 col-md-8">
					<h1> <c:out value="${book.title}"/> </h1>
				</div>  	
				<div class="col-6 col-md-4">
		        		<a href="/books"> back to the shelves </a>
		  		</div>
		  <div class ="container m-5">
				<h3><span style="color:red;"><c:out value="${book.user.username}" /></span> read <span style="color:purple;"><c:out value="${book.title}" /></span> by <span style="color:green;"><c:out value="${book.author}" /></span></h3>
				<br>
				<h4>here are <c:out value="${book.user.username}" />'s thoghts</h4><br><br>
				
				<hr><br><br>
						
				<p><c:out value="${book.myth}" /></p>
	
				<br><br><hr>	
				<c:if test="${user_id == book.user.id}">
					<div class="container">
						<form class="justify-content-end" action='/books/<c:out value="${book.id}"/>/edit' method="post">
							<input type="hidden" name="_method" value="put">
							<input type="submit"  value="Edit">
						</form>
					</div>
				</c:if>
				</div>
			</div>	
</div>
</body>
</html>


  