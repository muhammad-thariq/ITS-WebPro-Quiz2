<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add/Edit New Student</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="font-sans antialiased bg-black">

	<!-- Navbar -->
	<nav class="bg-white relative z-50">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="flex justify-center h-16">

				<div class="flex">
					<!-- Logo -->
					<a href="index.jsp">
						<div class="shrink-0 flex items-center mt-4">
							<div>
								<img src="bit.png" alt="no image" class="h-18">
							</div>
							
							<p class="ml-0.5 font-extrabold">
								Student Database.
							</p>
						</div>
					</a>
				</div>

			</div>
		</div>
	</nav>

	<svg xmlns="http://www.w3.org/2000/svg" id="visual" version="1.1" viewBox="0 0 1080 38" class="absolute left-0 w-full z-10 ">
		<path d="M0 34L60 38L120 1L180 23L240 30L300 12L360 24L420 12L480 19L540 37L600 10L660 21L720 23L780 1L840 24L900 3L960 19L1020 5L1080 15L1080 0L1020 0L960 0L900 0L840 0L780 0L720 0L660 0L600 0L540 0L480 0L420 0L360 0L300 0L240 0L180 0L120 0L60 0L0 0Z" fill="#ffffff" stroke-linecap="square" stroke-linejoin="bevel"/>
	</svg>

	<br>
	<br>
	<br>
	
   <div class="container container-default">
   		<div class="well">
			<form action="StudentServlet.do" method="post">	
				 <div class="form-group row">
	                <label for="studentId" class="col-2 col-form-label">Student ID</label> 
	                <div class="col-10">
		                <input type="text" class="form-control"
		                    name="studentId" value="<c:out value="${student.studentId}" />"
		                    readonly="readonly" placeholder="Read only field" />
	                </div>
	            </div>
				<div class="form-group row">
					<label for="firstName" class="col-2 col-form-label">First
						Name</label>
					<div class="col-10">
						<input class="form-control" type="text" name="firstName"
							value="<c:out value="${student.firstName}"/>" id="firstName"
							placeholder="First Name">
					</div>
				</div>
				<div class="form-group row">
					<label for="lastName" class="col-2 col-form-label">Major</label>
					<div class="col-10">
						<input class="form-control" type="text" name="lastName"
							value="<c:out value="${student.lastName}"/>" id="lastName"
							placeholder="Last Name">
					</div>
				</div>
		
				<div class="form-group row">
					<label for="course" class="col-2 col-form-label">Course</label>
					<div class="col-10">
						<input class="form-control" type="text" name="course"
							value="<c:out value="${student.course}"/>" id="course"
							placeholder="Course">
					</div>
				</div>
				<div class="form-group row">
					<label for="year" class="col-2 col-form-label">Year</label>
					<div class="col-10">
						<input class="form-control" type="text" name="year"
							value="<c:out value="${student.year}"/>" id="year"
							placeholder="Year">
					</div>
				</div>
		
				<div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
		
			</form>
		</div>
	</div>
</body>
</html>
