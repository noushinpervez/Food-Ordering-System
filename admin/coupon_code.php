<?php 
include('top.php');

if(isset($_GET['type']) && $_GET['type']!=='' && isset($_GET['id']) && $_GET['id']>0){
	$type=get_safe_value($_GET['type']);
	$id=get_safe_value($_GET['id']);
	if($type=='delete'){
		mysqli_query($con,"delete from coupon_code where id='$id'");
		redirect('coupon_code.php');
	}
	if($type=='active' || $type=='deactive'){
		$status=1;
		if($type=='deactive'){
			$status=0;
		}
		mysqli_query($con,"update coupon_code set status='$status' where id='$id'");
		redirect('coupon_code.php');
	}

}

$sql="select * from coupon_code order by id desc";
$res=mysqli_query($con,$sql);

?>
<div class="container">
	<div class="row">
		<div class="col-12">
  <div class="card">
  <div class="card-header d-flex justify-content-between align-items-center">
    <h1 class="h4 m-0">Coupon Codes</h1>
    <a href="manage_coupon_code.php" class="btn btn-primary">Add Coupon Code</a>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Code</th>
            <th scope="col">Type</th>
			<th scope="col">Value</th>
            <th scope="col">Minimum Cart Value</th>
            <th scope="col">Expires On</th>
            <th scope="col">Added On</th>
			<th scope="col" style="white-space: nowrap;">Actions</th>
          </tr>
        </thead>
        <tbody>
          <?php if(mysqli_num_rows($res)>0){
            $i=1;
            while($row=mysqli_fetch_assoc($res)){
          ?>
          <tr>
            <th scope="row"><?php echo $i?></th>
            <td><?php echo $row['coupon_code']?><br/>
			<td><?php echo $row['coupon_type']?></td>
            <td><?php echo $row['coupon_value']?></td>
            <td><?php echo $row['cart_min_value']?></td>
            <td>
              <?php 
              if($row['expired_on']=='0000-00-00'){
                
              }else{
                echo $row['expired_on'];
              }
              ?>
            </td>
            <td>
              <?php 
              $dateStr=strtotime($row['added_on']);
              echo date('d-m-Y',$dateStr);
              ?>
            </td>
			<td>
			<div class="btn-group" role="group">
			  <a href="manage_coupon_code.php?id=<?php echo $row['id']?>" class="btn btn-outline-primary"><i class="bi bi-pencil"></i> Edit</a>
			  <?php if($row['status']==1){ ?>
				<a href="?id=<?php echo $row['id']?>&type=deactive" class="btn btn-outline-danger"><i class="bi bi-eye-slash"></i> Active</a>
			  <?php } else { ?>
				<a href="?id=<?php echo $row['id']?>&type=active" class="btn btn-outline-success"><i class="bi bi-eye"></i> Deactive</a>
			  <?php } ?>
			  <a href="?id=<?php echo $row['id']?>&type=delete" class="btn btn-outline-danger delete_red"><i class="bi bi-trash"></i> Delete</a>
			</div>
			</td>
			<td colspan="1"></td>

          </tr>
          <?php 
            $i++;
            } 
          } else { ?>
          <tr>
            <td colspan="8">No data found</td>
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