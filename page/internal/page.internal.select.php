<!-- BREADCRUMBS START -->
<ul class="breadcrumb">

    <li><a href="index.php"><i class="fa fa-home"></i> Site</a></li>
    <li><a href="index.php"> Application</a></li>
    <li class="active"> Select</li>

</ul>
<!-- BREADCRUMBS END -->

<!-- CONTENT START-->
<div class="row">

    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                <b>I</b>nteractive <b>A</b>pplication for <b>D</b>atabase
            </header>
            <div class="panel-body">
                <div class="col-lg-12 m-bot15" id='div-select'>

                    <!-- FUNCTION LOAD SCHEMA -->
                    <?php serverSchema(); ?>

                </div>
                <div class="col-lg-3 m-bot15" id='div-join' style='display: none;'>
                    <label for='input-label'>Join</label>
                    <select class='form-control m-bot15' id='select-join' onchange='clientJoinSelect(this)'>
                        <option class='option-join' value=''>Choose a Join</option>
                        <option class='option-join' value='inner join'>Inner Join</option>
                        <option class='option-join' value='left join'>Left Join</option>
                        <option class='option-join' value='right join'>Right Join</option>
                        <option class='option-join' value='full join'>Full Join</option>
                    </select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-column' style='display: none;'>
                    <label for='input-label'>Column</label>
                    <select class='form-control m-bot15' id='select-column' onchange='clientSchemaSelect(this)'></select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-where' style='display: none;'>
                    <label for='input-label'>Where</label>
                    <select class='form-control m-bot15' id='select-where' onchange='clientSchemaSelect(this)'></select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-group' style='display: none;'>
                    <label for='input-label'>Group by</label>
                    <select class='form-control m-bot15' id='select-group' onchange='clientSchemaSelect(this)' disabled='true'>
                        <option class='option-group' value=''>Choose a column</option>
                    </select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-having' style='display: none;'>
                    <label for='input-label'>Having</label>
                    <select class='form-control m-bot15' id='select-having' onchange='clientSchemaSelect(this)' disabled='true'>
                        <option class='option-having' value=''>Choose a column</option>
                    </select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-func' style='display: none;'>
                    <label for='input-label'>Functions</label>
                    <select class='form-control m-bot15' id='select-func' onchange='clientSchemaSelect(this)'>
                        <option class='option-func' value=''>Choose a function</option>
                        <option class='option-func' value='count'>COUNT( )</option>
                        <option class='option-func' value='avg'>AVG( )</option>
                        <option class='option-func' value='sum'>SUM( )</option>
                        <option class='option-func' value='max'>MAX( )</option>
                        <option class='option-func' value='min'>MIN( )</option>
                    </select>
                </div>
                <div class="col-lg-3 m-bot15" id='div-order' style='display: none;'>
                    <label for='input-label'>Order By</label>
                    <select class='form-control m-bot15' id='select-order' onchange='clientSchemaSelect(this)' disabled='true'>
                        <option class='option-order' value=''>Choose a column</option>
                    </select>
                </div>
            </div>
            <div class="panel-body" id='section-button' style='display: none;'>
                <div class="col-lg-12 m-bot15">
                    <div class='col-lg-12'>
                        <form class="form-horizontal tasi-form" action="<?php echo $_SERVER['PHP_SELF'] ?>" method='post'>
                            <div class='form-group'></div>
                            <div class='form-group' align='left'>
                                <div class='col-lg-12'>
                                    <button id='confirmar' class='btn btn-info btn-md' onclick='select_a_select.click();' type='button' >Confirm</button>
                                    <button id='executar' class='btn btn-success btn-md' onclick='clientSqlSelect()' style='display: none;' type='submit'>Execute</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>
<!--CONTENT END-->