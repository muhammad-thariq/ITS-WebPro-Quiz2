<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link href="output.css" rel="stylesheet"> -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="font-sans antialiased bg-black">
        <!-- Navbar -->
        <nav x-data="{ open: false }" class="bg-white relative z-50">
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

                    <!-- Hamburger -->
                    <div class="-me-2 flex items-center sm:hidden">
                        <button @click="open = ! open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                            <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                                <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                                <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </nav>

        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="visual" version="1.1" viewBox="0 0 1080 38" class="absolute left-0 w-full z-10 ">
            <path d="M0 34L60 38L120 1L180 23L240 30L300 12L360 24L420 12L480 19L540 37L600 10L660 21L720 23L780 1L840 24L900 3L960 19L1020 5L1080 15L1080 0L1020 0L960 0L900 0L840 0L780 0L720 0L660 0L600 0L540 0L480 0L420 0L360 0L300 0L240 0L180 0L120 0L60 0L0 0Z" fill="#ffffff" stroke-linecap="square" stroke-linejoin="bevel"/>
        </svg>

        <!-- Content -->
        <h1 class="text-3xl font-bold underline">
            Hello world
        </h1>
    </body>
</html>

<!-- npx tailwindcss -i ./src/main/webapp/input.css -o ./src/main/webapp/output.css --watch -->
<!-- mvn clean install -->
