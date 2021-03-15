<!-- BREADCRUMBS START -->
<ul class="breadcrumb">

  <li><a href="index.php"><i class="fa fa-home"></i> Site</a></li>
  <li class="active"> Result</li>

</ul>
<!-- BREADCRUMBS END -->

<!-- CONTENT START -->
<div class="row">
    <div class="col-lg-12">
        <div class="<?php echo $_SESSION['feed'][5]; ?>">
            <button data-dismiss="alert" class="close close-sm" type="button">
                <i class="fa fa-times"></i>
            </button>
            <strong>Query Status: </strong><?php echo $_SESSION['feed'][2]; ?> 
			</br>
		    <strong>Row<?php if($_SESSION['feed'][3] > 1) echo 's'; ?> Affected: </strong><?php echo $_SESSION['feed'][3]; ?>
			</br>
		    <strong>Time of Execution: </strong><?php echo $_SESSION['feed'][1]; ?> ms
		    </br>
		    <strong>SQL: </strong><?php echo $_SESSION['feed'][0]; ?>
			</br>
			<strong>Status: </strong><?php echo $_SESSION['feed'][4]; ?>
            </br>
			<?php echo serverError(); ?>
        </div>

        <!-- FUNCTION RESULT TABLE -->
        <?php serverTable(); ?>
    
    </div>

</div>
<!-- CONTENT END-->