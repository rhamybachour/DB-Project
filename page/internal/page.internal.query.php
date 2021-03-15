<!-- BREADCRUMBS START -->
<ul class="breadcrumb">

  <li><a href="index.php"><i class="fa fa-home"></i> Site</a></li>
  <li class="active"> Query</li>

</ul>
<!-- BREADCRUMBS END -->

<!-- CONTENT START-->
<div class="row">

	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
			  <b>S</b>tructured <b>Q</b>uery <b>L</b>anguage
			</header>
			<div class="panel-body">
			  	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method='post' class="form-horizontal tasi-form">
			      	<div class="form-group">
			            <div class="col-md-12">
			                <textarea style="resize: none;" name='query' class="wysihtml5 form-control" rows="13"></textarea>
			            </div>
			        </div>
			        <div class="form-group" align="left">
			            <div class="col-lg-12">
                            <button class="btn btn-danger btn-md" type="reset">Limpar</button>
                            <button class="btn btn-success btn-md" id='button-query' type="submit">Execute</button>
                        </div>
			        </div>
			    </form>
			</div>
		</section>
	</div>

</div>
<!--CONTENT END-->