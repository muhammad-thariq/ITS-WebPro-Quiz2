<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport for responsive design -->
    <title>All Students</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Add custom CSS for responsive table -->
    <style>
        /* Default layout - show all columns */
        .hide-on-small-screen {
            display: table-cell;
        }

        /* For smaller screens (max-width: 768px), hide the last three columns */
        @media (max-width: 768px) {
            .hide-on-small-screen {
                display: none;
            }
        }

        /* Add custom button layout for small devices */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem; /* Space between the buttons */
        }

        @media (max-width: 768px) {
            .action-buttons {
                flex-direction: column;
                gap: 0.5rem;
            }
        }

        .action-buttons a {
            width: 100%;
        }
    </style>
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

    <br><br>

    <!-- Search Bar -->
    <div class="container mb-4">
        <input
            type="text"
            id="searchInput"
            class="form-control"
            placeholder="Search by any field (ID, Name, Major, Course, Year)..."
            onkeyup="filterTable()"
        />
    </div>

    <div class="container">
        <!-- Students Table -->
        <div class="table-responsive"> <!-- Table made responsive with horizontal scrolling -->
            <table class="table table-striped bg-white rounded-md table-sm table-fixed" id="studentsTable">
                <thead>
                    <tr>
                        <th class="text-center">Student ID</th>
                        <th class="text-center">First Name</th>
                        <th class="text-center hide-on-small-screen">Major</th>
                        <th class="text-center hide-on-small-screen">Course</th>
                        <th class="text-center hide-on-small-screen">Year</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${students}" var="student">
                        <tr class="studentRow">
                            <td class="text-center"><c:out value="${student.studentId}" /></td>
                            <td class="text-center"><c:out value="${student.firstName}" /></td>
                            <td class="text-center hide-on-small-screen"><c:out value="${student.lastName}" /></td>
                            <td class="text-center hide-on-small-screen"><c:out value="${student.course}" /></td>
                            <td class="text-center hide-on-small-screen"><c:out value="${student.year}" /></td>
                            <td class="action-buttons">
                                <!-- Edit Button -->
                                <a class="btn bg-green-500 text-white text-semibold hover:text-white hover:ring-2 hover:ring-green-500 hover:ring-offset-2 transition ease-in-out duration-150" role="button" href="StudentServlet.do?action=edit&studentId=<c:out value="${student.studentId }"/>">Edit</a>
                                <!-- Delete Button -->
                                <a class="btn bg-red-500 text-white text-semibold hover:text-white hover:ring-2 hover:ring-red-500 hover:ring-offset-2 transition ease-in-out duration-150" role="button" href="StudentServlet.do?action=delete&studentId=<c:out value="${student.studentId }"/>">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Add Student Button -->
    <div class="container mt-4">
        <a href="StudentServlet.do?action=insert" class="w-full">
            <button class="bg-white px-2 py-2 w-full rounded-md font-semibold hover:bg-black hover:text-white hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150">
                + Add Student
            </button>
        </a>
    </div>
    
    <!-- Pagination Controls -->
    <div class="container mt-4">
        <div class="pagination">
            <button id="prevPage" class="btn btn-secondary bg-white" disabled>Previous</button>
            <button id="nextPage" class="btn btn-secondary bg-white">Next</button>
        </div>
    </div>
    
    <div class="container mt-4">
        <button id="exportCSV" class="btn btn-success">Export to CSV</button>
    </div>

    <script>
        let currentPage = 1;
        const rowsPerPage = 5;
    
        function displayTablePage(page) {
            let rows = document.querySelectorAll('#studentsTable tbody .studentRow');
            let start = (page - 1) * rowsPerPage;
            let end = start + rowsPerPage;
    
            // Hide all rows initially
            rows.forEach((row, index) => {
                if (index >= start && index < end) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
    
            // Disable the "Previous" button if on the first page
            document.getElementById('prevPage').disabled = page === 1;
    
            // Disable the "Next" button if on the last page
            document.getElementById('nextPage').disabled = end >= rows.length;
        }
    
        document.getElementById('nextPage').addEventListener('click', () => {
            currentPage++;
            displayTablePage(currentPage);
        });
    
        document.getElementById('prevPage').addEventListener('click', () => {
            currentPage--;
            displayTablePage(currentPage);
        });
    
        // Initial call to display the first page
        displayTablePage(currentPage);
    
        document.getElementById('exportCSV').addEventListener('click', function () {
            const table = document.getElementById('studentsTable');
            let csvContent = '';
    
            const rows = table.querySelectorAll('tr');
            rows.forEach((row, rowIndex) => {
                const cols = row.querySelectorAll('td, th');
                const rowData = [];
    
                cols.forEach((col, colIndex) => {
                    // Skip the "Action" column (last column)
                    if (colIndex !== cols.length - 1) {
                        rowData.push(col.innerText.trim()); // Trim whitespace
                    }
                });
    
                csvContent += rowData.join(',') + '\n';
            });
    
            const hiddenElement = document.createElement('a');
            hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvContent);
            hiddenElement.target = '_blank';
            hiddenElement.download = 'students.csv';
            hiddenElement.click();
        });

        // Search bar filter functionality
        function filterTable() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('#studentsTable tbody .studentRow');
    
            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                const rowText = Array.from(cells)
                    .slice(0, cells.length - 1) // Exclude "Action" column
                    .map(cell => cell.innerText.toLowerCase())
                    .join(' ');
    
                // Show row if it matches the search, otherwise hide it
                row.style.display = rowText.includes(input) ? '' : 'none';
            });
        }
    </script>
</body>
</html>
