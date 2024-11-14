<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link href="output.css" rel="stylesheet"> -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="font-sans font-semibold antialiased bg-black">
        <!-- Navbar -->
        <nav class="bg-white relative z-50">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">

                    <div class="flex">
                        <!-- Logo -->
                        <a href="index.jsp">
                            <div class="shrink-0 flex items-center mt-4">
                                <div>
                                    <img src="bit.png" alt="no image" class="h-9">
                                </div>
                                
                                <p class="ml-0.5 font-extrabold">
                                    Store.
                                </p>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </nav>

        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="visual" version="1.1" viewBox="0 0 1080 38" class="absolute left-0 w-full z-10">
            <path d="M0 34L60 38L120 1L180 23L240 30L300 12L360 24L420 12L480 19L540 37L600 10L660 21L720 23L780 1L840 24L900 3L960 19L1020 5L1080 15L1080 0L1020 0L960 0L900 0L840 0L780 0L720 0L660 0L600 0L540 0L480 0L420 0L360 0L300 0L240 0L180 0L120 0L60 0L0 0Z" fill="#ffffff" stroke-linecap="square" stroke-linejoin="bevel"/>
        </svg>

        <!-- Content -->
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 pt-8 pb-2 mt-8 px-4">
            <div class="flex mt-6 justify-between items-center">
                <h2 class="font-semibold text-xl text-white">Create Product</h2>
                <!-- Delete Product Partial (This would need to be handled separately) -->
            </div>

            <div class="mt-4" id="product-form">
                <form enctype="multipart/form-data" method="POST" action="" class="flex flex-col sm:flex-row gap-8">
                    <input type="hidden" name="_csrf" value="">
                    <input type="hidden" name="_method" value="PUT">

                    <div class="sm:w-1/2">
                        <img id="productImage" src="<" class="rounded-md w-[592] h-[592] object-cover" alt="Product Image">
                    </div>

                    <div class="w-full sm:w-1/2">
                        <div class="mt-4">
                            <p class="text-white">Create Photo</p>
                            <input type="file" id="Photo" class="block mt-4 w-full border p-2 bg-white rounded-md" accept="image/*" name="Photo" onchange="updateImage(event)">
                            
                        </div>

                        <div class="mt-4">
                            <p class="text-white">Create Name</p>
                            <input id="Name" class="block p-2 mt-4 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm" type="text" name="Name" value="" required>
                            <
                        </div>

                        <div class="mb-4">
                            <p class="text-white">Create Price</p>
                            <input id="Price" class="block p-2 mt-4 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm" type="text" name="Price" value="" required>
                            
                        </div>

                        <button style="background-color: #EF4444;" class="px-10 py-2 w-full text-white rounded-md font-semibold my-4 hover:bg-black hover:text-white hover:outline-none hover:ring-2 hover:ring-red-500 hover:ring-offset-2 transition ease-in-out duration-150">
                            Delete Product
                        </button>

                        <button type="submit" class="bg-white px-10 py-2 w-full rounded-md font-semibold my-4 hover:bg-black hover:text-white  hover:outline-none hover:ring-2 hover:ring-white hover:ring-offset-2 transition ease-in-out duration-150">
                            Submit
                        </button>

                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
