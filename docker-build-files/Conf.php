?php
class Conf {

        var $smtphost;
        var $dbhost;
        var $dbport;
        var $dbname;
        var $dbuser;
        var $version;

        function Conf() {

                $this->dbhost   = getenv('DBHOST');
                $this->dbport   = getenv('DBPORT');
                if(defined('ENVIRNOMENT') && ENVIRNOMENT == 'test'){
                $this->dbname    = 'test_test_db';
                }else {
                $this->dbname    = getenv('DBNAME');
                }
                $this->dbuser    = getenv('DBUSERNAME');
                $this->dbpass   = getenv('DBPASSWD');
                $this->version = '3.3.2';
                
                $this->emailConfiguration = dirname(__FILE__).'/mailConf.php';
                $this->errorLog =  realpath(dirname(__FILE__).'/../logs/').'/';
        }
}
