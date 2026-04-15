<?php 
    $qtrSales = array(4500, 5488, 3200, 6400); 
    $total = 0;
   
?>

<html>
    <head>
        <title>Embedded PHP into HTML</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <table border width="300px">
            <th align='center'>Quarters</th>
            <th align='center'>Sale</th>

            <!--The code inside "<?php ?>" is executed as PHP, while the code outside is treated as HTML.-->
            <!--We can also switch between PHP and HTML as many times as we want.-->
            <?php for($i = 0; $i < count($qtrSales); $i++) { ?>       
            <?php   $total += $qtrSales[$i]; ?>
                    <tr>
                        <td align="center">Q<?= ($i + 1) ?></td>
                        <td align='center'>MYR <?= $qtrSales[$i] ?></td> <!--We can access variables in PHP directly between "<?= $variable; ?>"-->
                    </tr>
            <?php } ?>

            <tr>
                <td align='center'><b>TOTAL</b></td>
                <td align='center'><b>MYR <?= $total ?></b></td>
            </tr>
        </table>
    </body>
</html>