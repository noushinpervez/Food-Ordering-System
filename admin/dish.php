<?php 
include('top.php');

if(isset($_GET['type']) && $_GET['type']!=='' && isset($_GET['id']) && $_GET['id']>0){
	$type=get_safe_value($_GET['type']);
	$id=get_safe_value($_GET['id']);
	if($type=='active' || $type=='deactive'){
		$status=1;
		if($type=='deactive'){
			$status=0;
		}
		mysqli_query($con,"update dish set status='$status' where id='$id'");
		redirect('dish.php');
	}

}

$sql="select dish.*,category.category from dish,category where dish.category_id=category.id order by dish.id desc";
$res=mysqli_query($con,$sql);

?>
  <div class="container">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h1 class="h4 m-0">Dish</h1>
					<a href="manage_dish.php" class="btn btn-primary">Add Dish</a>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped">
						<table id="order-listing" class="table">
							<thead>
								<tr>
									<th scope="col">S.No #</th>
									<th scope="col">Category</th>
									<th scope="col">Dish</th>
									<th scope="col">Image</th>
									<th scope="col">Added On</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
                        <?php if(mysqli_num_rows($res)>0){
						$i=1;
						while($row=mysqli_fetch_assoc($res)){
						?>
						<tr>
                            <td><?php echo $i?></td>
                            <td><?php echo $row['category']?></td>
							<td><?php echo $row['dish']?> (<?php echo strtoupper($row['type'])?>)</td>
							<td><a target="_blank" href="<?php echo SITE_DISH_IMAGE.$row['image']?>"><img src="<?php echo SITE_DISH_IMAGE.$row['image']?>"/></a></td>
							<td>
							<?php 
							$dateStr=strtotime($row['added_on']);
							echo date('d-m-Y',$dateStr);
							?>
							</td>
							<td>
								<div class="btn-group" role="group">
									<a href="manage_dish.php?id=<?php echo $row['id']?>" class="btn btn-outline-primary"><i class="bi bi-pencil"></i> Edit</a>
									  <?php if($row['status']==1){ ?>
										<a href="?id=<?php echo $row['id']?>&type=deactive" class="btn btn-outline-danger"><i class="bi bi-eye-slash"></i> Active</a>
									  <?php } else { ?>
										<a href="?id=<?php echo $row['id']?>&type=active" class="btn btn-outline-success"><i class="bi bi-eye"></i> Deactive</a>
									  <?php } ?>
									</div>
							</td>
                        </tr>
                        <?php 
						$i++;
						} } else { ?>
						<tr>
							<td colspan="6">No data found</td>
						</tr>
						<?php } ?>
                      </tbody>
                    </table>
                  </div>
				</div>
              </div>
            </div>
          </div>
		 </div>
        
<?php include('footer.php');?>