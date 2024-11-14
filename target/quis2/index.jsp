<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="font-sans antialiased bg-black">
        <!-- Navbar -->
        <nav class="bg-white relative z-50">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex">
                        <!-- Logo -->
                        <div class="shrink-0 flex items-center">
                            <a href="">
                                <div>
                                    <img src="bit.png" alt="no image" class="h-9">
                                </div>
                            </a>
                            <a href="">
                                <p class="ml-0.5 font-extrabold">
                                    Store.
                                </p>
                            </a>
                        </div>
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
        <!-- Content Section -->
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 pt-8">
            
            <!-- Success Alert -->
            <!-- <%
                String successMessage = (String) session.getAttribute("success");
                if (successMessage != null) {
            %>
                <div class="bg-green-500 text-white p-4 rounded-md">
                    <%= successMessage %>
                </div>
            <%
                    session.removeAttribute("success");
                }
            %> -->

            <!-- Export Buttons -->
            <div class="flex flex-col md:flex-row my-9 items-start md:items-center justify-between px-6">
                <h2 class="text-white text-3xl font-semibold mb-4 md:mb-0">List Products</h2>

                <div class="flex flex-col md:flex-row gap-4 w-full md:w-auto">
                    <a href="" class="bg-white px-10 py-2 rounded-md font-semibold hover:bg-black hover:text-white hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150 w-full md:w-auto text-center">
                        Download Activity Log
                    </a>
                    <a href="" class="bg-white px-10 py-2 rounded-md font-semibold hover:bg-black hover:text-white hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150 w-full md:w-auto text-center">
                        Export List as Excel
                    </a>
                    <a href="" class="w-full md:w-auto">
                        <button class="bg-white px-10 py-2 rounded-md font-semibold hover:bg-black hover:text-white hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150 w-full md:w-auto text-center">
                            + Add
                        </button>
                    </a>
                </div>
            </div>

            <!-- Product Listing -->
            <div class="grid md:grid-cols-3 grid-cols-1 mt-4 gap-6 px-6">
                <c:forEach var="" items="">
                    <div>
                        <img src="" class="rounded-md w-[390px] h-[390px] object-cover">

                        <div class="my-2">
                            <p class="text-xl text-white font-semibold">
                                product.Name
                            </p>
                            <p class="text-gray-400">
                                product.Price
                            </p>
                        </div>
                        <a href="">
                            <button class="bg-white px-10 py-2 w-full rounded-md font-semibold my-4 hover:bg-black hover:text-white  hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150">
                                Edit
                            </button>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
