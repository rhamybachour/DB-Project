<?php
//START THE SESSION
if (!isset($_SESSION)) {
    session_start();
}
//RUN SOME FUNCTIONS
serverCookie();
serverInfo();
serverRun();
?>