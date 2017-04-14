<?php
      class DatabaseConnector {
            public $host;
            public $dbname;
            public $username;
            public $password;

            public function __construct($host, $dbname, $username, $password){
                  $this->host = $host;
                  $this->dbname = $dbname;
                  $this->username = $username;
                  $this->password = $password;
            }

            public function connect(){
                  return new mysqli($this->host, $this->username, $this->password, $this->dbname);
            }
      }
?>