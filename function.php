<?php

function serverCookie() {
    //SET COOKIES
    setcookie("insert", "", 0);
    setcookie("delete", "", 0);
    setcookie("update", "", 0);
    setcookie("select", "", 0);
}

function serverProcess($type) {
    //RUN THE FUNCTION
    $function = serverSQL($type);
    //VARIABLES SETTING THE SESSION
    $_SESSION['sql'] = $function[0];
    $_SESSION['result'] = $function[1];
    $_SESSION['time'] = $function[2];
    $_SESSION['array'] = $function[3];
    $_SESSION['row'] = $function[4];
    $_SESSION['field'] = $function[5];
    $_SESSION['error'] = $function[6];
    $_SESSION['option'] = $function[7];
    $_SESSION['page'] = 1;
    //NOW REDIRECTS TO RESULT
    header("Location: /result.php");
    die();
}

function serverCheck() {
    //CHECKING IF STILL ARE THE RESULT PAGE
    $url = $_SERVER['REQUEST_URI'];
    if ($url != "/result.php") {
        $_SESSION['page'] = 0;
    }
}

function serverResult() {
    //TEST IF WE STILL ON RESULT PAGE
    if ($_SESSION['page'] == 1) {
        //CHECK STATUS OF FEEDBACK
        $function = serverFeedback();
        //GETTING FEEDBACK'S VARIABLES
        $sql = $function[0];
        $time = $function[1];
        $type = $function[2];
        $query = $function[3];
        $option = $function[4];
        $row = $function[5];
        $message = $function[6];
        $error = $function[7];
    }
}

function serverRun() {
    //TYPE OF SQL
    $type = [1 => "query", 2 => 'insert', 3 => 'select', 4 => 'update', 5 => 'delete'];
    //TEST FOR ALL POSTS
    for ($i = 1; $i <= count($type); $i++) {
        if (isset($_COOKIE[$type[$i]])) {
            $_POST[$type[$i]] = $_COOKIE[$type[$i]];
        }
        if (!empty($_POST[$type[$i]]) && $_POST[$type[$i]] != "") {
            serverProcess($type[$i]);
        } else {
            serverCheck();
        }
    }
    //RESULT SERVER
    if (isset($_SESSION['page'])) {
        serverResult();
    }
}

function serverSetting() {
    //SET THE CONFIGURATION OF CONNECTION WITH DATABASE
    $host = "localhost";
    $port = "5432";
    $database = "TrabalhoBD";
    $user = "rhamy";
    $password = "1258497";
    return [$host, $port, $database, $user, $password];
}

function serverConnect() {
    //CONNECT WITH DATABASE
    $str = serverSetting();
    $config = "host=" . $str[0] . " port=" . $str[1] . " dbname=" . $str[2] . " user=" . $str[3] . " password=" . $str[4] . "";
    $db = pg_connect($config);
    return $db;
}

function serverSQL($type) {
    //EXECUTE THE QUERY
    $sql = $_POST[$type];
    $db = serverConnect();
    $timei = microtime();
    $result = pg_query($db, $sql);
    $timef = microtime();
    //CALCULATING THE EXECUTION TIME QUERY
    $time = $timef - $timei;
    //GET ALL INFORMATION OF QUERY
    $option = explode(" ", $sql)[0];
    $option = strtolower($option);
    if ($result) {
        if ($option == 'select') {
            $array = pg_fetch_all($result);
            $field = pg_num_fields($result);
        } else {
            $array = [];
            $field = 0;
        }
        $row = pg_affected_rows($result);
        $error = "";
    } else {
        $array = [];
        $row = 0;
        $error = pg_last_error($db);
        $error = explode(':', $error)[1];
        $field = 0;
    }
    return [$sql, $result, $time, $array, $row, $field, $error, $option];
}

function serverFeedback() {
    //GET INFORMATION OF SESSION
    $sql = $_SESSION['sql'];
    //TEST FOR TIME
    if ($_SESSION['time'] < 0) {
        $time = $_SESSION['time'] * (-1);
    } else {
        $time = $_SESSION['time'];
    }
    $type = "";
    //TEST IF ERROR OCCURRED AND DEFINE SOME VARIABLES
    if ($_SESSION['error'] != "") {
        $type = 'alert alert-danger fade in';
        $query = "Error";
    } else {
        if ($_SESSION['row'] == 0) {
            $type = 'alert alert-warning fade in';
        } else {
            $type = 'alert alert-info fade in';
        }
        $query = "Sucess";
    }
    //DEFINE OPTION OF SQL
    $option = explode(" ", $_SESSION['sql'])[0];
    $option = strtolower($option);
    if ($option == "SELECT") {
        $option = 'select';
    }
    //GET MORE INFORMATION OF SESSION
    $row = $_SESSION['row'];
    $error = $_SESSION['error'];
    //DEFINE WHAT MESSAGE WILL APPEAR
    if ($option != "select" || $_SESSION['row'] == 0) {
        $message = "Nothing to show";
    } else {
        $message = "See table below";
    }
    //SET THE SESSION
    $_SESSION['feed'] = [$sql, $time, $query, $row, $message, $type];
    return [$sql, $time, $type, $query, $option, $row, $message, $error];
}

function serverError() {
    //DISPLAY WHAT ERROR OCCURRED
    if ($_SESSION['error'] != "") {
        return "<strong>Error: </strong>" . $_SESSION['error'];
    } else {
        return "";
    }
}

function serverRestart() {
    //RENEW SESSION
    session_start();
    session_unset();
    session_destroy();
    session_write_close();
    setcookie(session_name(), '', 0, '/');
    session_regenerate_id(true);
}

function serverTable() {
    //FILL THE RESULT TABLE
    if (isset($_SESSION['option']) && $_SESSION['error'] == "") {
        if ($_SESSION['option'] == "select" && $_SESSION['row'] != 0) {
            //SET TOP OF TABLE
            $html = "<section class='panel'>";
            $html .= "<header class='panel-heading'><b>R</b>esult of <b>L</b>ast <b>Q</b>uery</header>";
            $html .= "<div class='panel-body'>";
            $html .= "<div class='adv-table'>";
            $html .= "<table class='display table table-bordered table-striped' id='table-result'>";
            $html .= "<thead>";
            //RUN THE SQL AND GET RESULT
            $db = serverConnect();
            $result = pg_query($db, $_SESSION['sql']);
            $i = pg_num_fields($result);
            //FILL TABLE WITH RESULTS
            $html .= "<tr>";
            for ($j = 0; $j < $i; $j++) {
                $fieldname = pg_field_name($result, $j);
                $html .= "<th> $fieldname </th>";
            }
            $html .= "</tr>";
            $html .= "</thead>";
            $html .= "<tbody>";
            //LOOKING FOR ERROS
            if ($_SESSION['error'] != "") {
                $html .= "<tr>";
                $html .= "<td>" . $_SESSION['error'] . "</td>";
                $html .= "</tr>";
            } elseif ($_SESSION['row'] == 0) {
                $html .= "<tr>";
                $html .= "<td colspan='$i'>No result found</td>";
                $html .= "</tr>";
            } else {
                if (isset($_SESSION['array'])) {
                    //CHECKING IF TABLE WILL BE EMPTY
                    $array = $_SESSION['array'];
                    if (count($array) == 0) {
                        $html .= "<tr>";
                        $html .= "<td>Nothing to show</td>";
                        $html .= "</tr>";
                    } else {
                        //GET REST OF ALL INFORMATION
                        $result = pg_query($db, $_SESSION['sql']);
                        while ($row = pg_fetch_row($result)) {
                            $html .= "<tr>";
                            for ($j = 0; $j < count($row); $j++) {
                                $html .= "<td align='center'>" . $row[$j] . "</td>";
                            }
                            $html .= "</tr>";
                        }
                    }
                }
            }
            //END CONSTRUCTION OF TABLE
            $html .= "<tbody>";
            $html .= "</table>";
            $html .= "</div>";
            $html .= "</div>";
            $html .= "</section>";
            //PRINT THE TABLE
            echo $html;
        }
    }
}

function serverButton() {
    //CLEAN VARIABLE
    $button = "";
    //CHECK IF BUTTON WILL MUST APPEAR
    if ($_SESSION['page'] == 1) {
        $button = "<li id='result'>";
        $button .= "<a class='active' href='result.php' >";
        $button .= "<i class='fa fa-file-text-o'></i>";
        $button .= "<span>Result </span>";
        $button .= "</a>";
        $button .= "</li>";
    }
    //PRINT THE BUTTON
    echo $button;
}

function serverSchema() {
    //CONNECT AND GET ALL TABLE OF DATABASE
    $db = serverConnect();
    $result = pg_query($db, "SELECT table_name FROM information_schema.tables WHERE table_schema='public'");
    $array = pg_fetch_all($result);
    $mode = $_SERVER ['REQUEST_URI'];
    $mode = substr(explode(".", $mode)[0], 1);
    $func = ucfirst($mode);
    //CONSTRUCT TABLE'S SELECT
    $html = "<label for='input-label'>Table</label>";
    $html .= "<select class='form-control m-bot15' id='select-table' onchange='clientSchema$func(this)'>";
    $html .= "<option class='option-table' value=''>Choose a table</option>";
    foreach ($array as $obj) {
        $name = $obj['table_name'];
        $html .= "<option class='option-table' value='$name'>$name</option>";
    }
    $html .= "</select>";
    //PRINT TABLE'S SELECT
    echo $html;
}

function serverInfo() {
    //CONNECT TO THE DATABASE
    $db = serverConnect();
    $result = pg_query($db, "SELECT table_name FROM information_schema.tables WHERE table_schema='public'");
    $tables = pg_fetch_all($result);
    //OPEN THE FILE
    $handle = fopen("dictionary.js", "w");
    //WRITE ON FILE THE TOP OF FUNCTION
    fwrite($handle, "function clientDictionary(str, obj) {");
    fwrite($handle, "\n\t");
    fwrite($handle, "\n\tvar i = 0;");
    fwrite($handle, "\n\tvar dict = {");
    fwrite($handle, "\n");
    //PREPARE VARIABLE TO LOOP
    $i = 1;
    //FOR EACH TABLE ON DATABASE MAKE ONE LSIT OF DICTIONARYS
    foreach ($tables as $table) {
        $result = pg_query($db, "SELECT column_name, data_type FROM information_schema.columns WHERE table_name='" . $table['table_name'] . "'");
        $columns = pg_fetch_all($result);
        $n = count($tables);
        fwrite($handle, "\t\t'" . $table['table_name'] . "' : [\n");
        //PREPARE VARIABLE TO ANOTHER LOOP
        $j = 1;
        //FOR EACH COLMUN ON EACH TABLE FILL THE DICTIONARY
        foreach ($columns as $column) {
            $m = count($columns);
            fwrite($handle, "\t\t\t{key: ");
            fwrite($handle, "'" . $column['column_name'] . "'");
            fwrite($handle, ", value: ");
            fwrite($handle, "'" . strtoupper($column['data_type']) . "'");
            fwrite($handle, "}");
            if ($j != $m) {
                fwrite($handle, ",");
            }
            fwrite($handle, "\n");
            $j += 1;
        }
        fwrite($handle, "\t\t]");
        if ($i != $n) {
            fwrite($handle, ",\n");
        }
        $i += 1;
    }
    fwrite($handle, "\n\t};");
    //WRITE THE CODE OF SEARCH
    fwrite($handle, "\n");
    fwrite($handle, "\n\tif(obj == 'all'){");
    fwrite($handle, "\n\t\treturn dict[str];");
    fwrite($handle, "\n\t}else{");
    fwrite($handle, "\n\t\tfor (i = 0; i < dict[str].length; i++) {");
    fwrite($handle, "\n\t\t\tif (dict[str][i].key == obj) {");
    fwrite($handle, "\n\t\t\t\treturn dict[str][i].value;");
    fwrite($handle, "\n\t\t\t}");
    fwrite($handle, "\n\t\t}");
    fwrite($handle, "\n\t}");
    fwrite($handle, "\n}");
    //CLOSE THE FILE
    fclose($handle);
}

?>