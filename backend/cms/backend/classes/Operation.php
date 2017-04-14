<?php
      class Operation{
            public $sql;
            public $connection;

            public function __construct($sql, $connection){
                  $this->sql = $sql;
                  $this->connection = $connection;
            }

            public function fetch_all(){

                  $run = $this->connection->query($this->sql);

                  if ($run !== false) {
                        $resultArray = array();
                        while ($result = $run->fetch_assoc()) {
                              $resultArray[] = $result;
                        }

                        // returns the results
                        return $resultArray;

                        // close connection
                        mysqli_close($this->connection);
                  } else {
                        return 0;
                  }
            }

            public function fetch_one(){
                  // standard prepare PDO
                  $run = $this->connection->query($this->sql);
                  if ($run !== false) {
                        if ($run->num_rows == 1) {
                              $resultArray = array();

                              while ($result = $run->fetch_assoc()) {
                                    $resultArray[] = $result;
                              }

                              // returns the results
                              return $resultArray;

                              // close connection
                              mysqli_close($this->connection);
                        } else {
                              return 0;
                        }
                  } else {
                        return 0;
                  }
                  
            }
			
            public function process(){
                  $run = $this->connection->query($this->sql);
                  
                  if ($run !== false) {
                        return 1;
                        // close connection
                        mysqli_close($this->connection);
                  } else {
                        return 0;
                  }
            }
      }
?>