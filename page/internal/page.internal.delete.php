<!-- BREADCRUMBS START -->
<ul class="breadcrumb">

    <li><a href="index.php"><i class="fa fa-home"></i> Site</a></li>
    <li><a href="index.php"> Application</a></li>
    <li class="active"> Delete</li>

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
                <div class="col-lg-12" id='div-select'>

                    <!-- FUNCTION LOAD SCHEMA -->
                    <?php serverSchema(); ?>

                </div>
                <div class="col-lg-6 m-bot15" id='div-where' style='display: none;'>
                    <label for='input-label'>Where</label>
                    <select class='form-control m-bot15' id='select-where' onchange='clientSchemaDelete(this)'></select>
                </div>
            </div>
            <div class="panel-body" id='section-delete' style='display: none;'>
                <div class="col-lg-12 m-bot15">
                    <form class="form-horizontal tasi-form" action="<?php echo $_SERVER['PHP_SELF'] ?>" method='post'>
                        <div class='form-group'></div>
                        <div class='form-group' align='left'>
                            <div class='col-lg-12'>
                                <button class='btn btn-success btn-md' onclick='clientSqlDelete()' type='submit'>Execute</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>

</div>
<!--CONTENT END-->