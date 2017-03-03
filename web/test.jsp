<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>My page</title>
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <link rel="stylesheet" href="js/chartist-js-develop/dist/chartist.min.css">
        <script src="js/chartist-js-develop/dist/chartist.min.js"></script>
    </head>
    <body>
        <div style="width:30%">
            <div class="ct-chart ct-perfect-fourth"></div>
        </div>
    </body>
    <script>
        new Chartist.Line('.ct-chart', {
            labels: [1, 2, 3, 4, 5, 6, 7, 8],
            series: [
                [5, 9, 7, 8, 5, 3, 5, 4]
            ]
        }, {
            low: 0,
            showArea: true
        });
    </script>
</html>