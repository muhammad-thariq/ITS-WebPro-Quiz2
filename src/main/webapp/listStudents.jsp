<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Students</title>
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
                        <div class="flex mt-4">
                            <div>
                                <img src="bit.png" alt="no image" class="h-18">
                            </div>
                            <p class="ml-0.5 mt-2 font-extrabold">
                                Student Database.
                            </p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <svg xmlns="http://www.w3.org/2000/svg" id="visual" version="1.1" viewBox="0 0 1080 38" class="absolute left-0 w-full z-10 pb-8 mb-8">
        <path d="M0 34L60 38L120 1L180 23L240 30L300 12L360 24L420 12L480 19L540 37L600 10L660 21L720 23L780 1L840 24L900 3L960 19L1020 5L1080 15L1080 0L1020 0L960 0L900 0L840 0L780 0L720 0L660 0L600 0L540 0L480 0L420 0L360 0L300 0L240 0L180 0L120 0L60 0L0 0Z" fill="#ffffff" stroke-linecap="square" stroke-linejoin="bevel"/>
    </svg>

    <div class="mt-12"></div>
	<div class="mt-12"></div>
	<div class="mt-12"></div>

    <br>
    <br>
    <br>
    <br>


    <div class="container">
		<a href="downloadLog" class="btn btn-primary">Download Activity Log</a>
        <!-- Table with Bootstrap 'table-sm' for compact layout and rounded corners, and Tailwind's 'table-fixed' class for evenly spaced columns -->
        <table class="table table-striped bg-white rounded-md ">
			<thead>
				<tr>
					<th class="text-center">Student ID</th>
					<th class="text-center">First Name</th>
					<th class="text-center">Last Name</th>
					<th class="text-center">Course</th>
					<th class="text-center">Year</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${students}" var="student">
					<tr>
						<td class="text-center"><c:out value="${student.studentId}" /></td>
						<td class="text-center"><c:out value="${student.firstName}" /></td>
						<td class="text-center"><c:out value="${student.lastName}" /></td>
						<td class="text-center"><c:out value="${student.course}" /></td>
						<td class="text-center"><c:out value="${student.year}" /></td>
						<td class="flex justify-center space-x-2">
							<a class="btn bg-green-500 text-white text-semibold hover:text-white hover:ring-2 hover:ring-green-500 hover:ring-offset-2 transition ease-in-out duration-150 w-1/2" role="button" href="StudentServlet.do?action=edit&studentId=<c:out value="${student.studentId }"/>">Edit</a>
							<a class="btn bg-red-500 text-white text-semibold hover:text-white hover:ring-2 hover:ring-red-500 hover:ring-offset-2 transition ease-in-out duration-150 w-1/2" role="button" href="StudentServlet.do?action=delete&studentId=<c:out value="${student.studentId }"/>">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
    </div>

    <div class="container">
        
		<!-- <a href="StudentServlet.do?action=insert" class="w-full">
			<button class="bg-white px-2 py-2 w-full rounded-md font-semibold hover:bg-black hover:text-white  hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150">
				+ Add Student
			</button>
		</a> -->
		<a href="StudentServlet.do?action=insert" class="w-full">
			<button class="bg-white px-2 py-2 w-full rounded-md font-semibold hover:bg-black hover:text-white  hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150">
				+ Add Student
			</button>
		</a>
        
    </div>
</body>
</html>
