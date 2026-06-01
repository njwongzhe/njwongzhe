<html>
  <head>
    <title>PHP External File Includes</title>
  </head>

  <body>
    <?php include '02 - PHP External File Includes - Header.php' // "include" is used to include the content of another file. ?>     
    <!--There is also "include_once" which is similar to "include" but it will include the file only once.-->

    <?php require_once '02 - PHP External File Includes - Model.php' // "require_once" is used to include the content of another file, but it will only include it once. ?> 
    <!--There is also "require" which is similar to "require_once" but it will include the file every time it is called.-->

    <!--The difference between "include" and "require" is that "include" will only produce a warning if the file is not found, while "require" will produce a fatal error.-->
    <!--Which means when using "include", the script will continue to execute even if the file is not found, while when using "require", the script will stop executing if the file is not found.-->

    <!--The "once" version of the include and require statements is used to prevent multiple inclusions of the same file, which can cause errors in some case.-->

    <table border="1" width="300px">  
      <tr>
        <th>Fruit</th>
        <th>Calories</th>
      </tr>
      <?php 
        $fruits = array(new Fruit("Apple", 52), new Fruit("Banana", 89));

        foreach ($fruits as $idx => $item) { 
          $item->printRow();
        } 
      ?>
    </table>
    <?php include '02 - PHP External File Includes - Footer.php' ?>
  </body>
</html>