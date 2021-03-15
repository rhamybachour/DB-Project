<!-- BREADCRUMBS START -->
<ul class="breadcrumb">

    <li><a href="index.php"><i class="fa fa-home"></i> Site</a></li>
    <li><a href="index.php"> Application</a></li>
    <li class="active"> Insert</li>

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
                <div class="col-lg-12">

                    <!-- FUNCTION LOAD SCHEMA -->
                    <?php serverSchema(); ?>

                </div>
            </div>
            <div class="panel-body" id='section-insert' style='display: none;'>
                <div class="col-lg-12 m-bot15">
                    <div class='col-lg-12'>
                        <form class="form-horizontal tasi-form" action="<?php echo $_SERVER['PHP_SELF'] ?>" method='post'>
                            <div class="form-group" id='div-input'></div>
                            <div class='form-group' align='left'>
                                <div class='col-lg-12'>
                                    <button class='btn btn-danger btn-md' type='reset'>Limpar</button>
                                    <button class='btn btn-success btn-md' onclick='clientSqlInsert()' type='submit'>Execute</button>
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