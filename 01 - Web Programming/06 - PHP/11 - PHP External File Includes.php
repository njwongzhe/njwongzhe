<html>
  <head>
    <title>PHP External File Includes</title>
  </head>

  <body>
    <?php include '11 - PHP External File Includes - Header.php' // "include" is used to include the content of another file. ?>     
    <?php require_once '11 - PHP External File Includes - Model.php' // "require_once" is used to include the content of another file, but it will only include it once. ?> 
    <table border="1" width="300px">  
      <tr>
        <th>Fruit</th>
        <th>Calories</th>
      </tr>
      <?php 
        foreach ($fruits as $idx => $item) { 
          $item->printRow();
        } 
      ?>
    </table>
    <?php include '11 - PHP External File Includes - Footer.php' ?>
  </body>
</html>