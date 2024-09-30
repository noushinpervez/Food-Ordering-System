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
		mysqli_query($con,"update user set status='$status' where id='$id'");
		redirect('user.php');
	}

}

$sql="select * from user order by id desc";
$res=mysqli_query($con,$sql);

?>
<div class="container">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h1 class="h4 m-0">User</h1>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table id="order-listing" class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">S.No #</th>
                  <th scope="col">Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Mobile</th>
                  <th scope="col">Added On</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  if(mysqli_num_rows($res) > 0){
                    $i = 1;
                    while($row = mysqli_fetch_assoc($res)){
                ?>
                <tr>
                  <td><?php echo $i ?></td>
                  <td><?php echo $row['name'] ?></td>
                  <td><?php echo $row['email'] ?></td>
                  <td><?php echo $row['mobile'] ?></td>
                  <td>
                    <?php 
                      $dateStr = strtotime($row['added_on']);
                      echo date('d-m-Y', $dateStr);
                    ?>
                  </td>
                  <td>
                    <div class="btn-group" role="group">
                      <?php
                        if($row['status'] == 1){
                      ?>
                        <a href="?id=<?php echo $row['id'] ?>&type=deactive" class="btn btn-outline-danger"><i class="bi bi-eye-slash"></i> Active</a>
                      <?php 
                        } else { 
                      ?>
                        <a href="?id=<?php echo $row['id'] ?>&type=active" class="btn btn-outline-success"><i class="bi bi-eye"></i> Deactive</a>
                      <?php 
                        } 
                      ?>
                    </div>
                  </td>
                </tr>
                <?php 
                    $i++;
                    } 
                  } else { 
                ?>
                <tr>
                  <td colspan="6">No data found</td>
                </tr>
                <?php 
                  } 
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

        
<?php include('footer.php');?>