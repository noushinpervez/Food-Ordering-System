<?php
session_start();

include('../database.inc.php');
include('../function.inc.php');
$msg="";

// Checks submit button has been clicked and retrieves the username and password
if(isset($_POST['submit'])){
	$username=get_safe_value($_POST['username']);
	$password=get_safe_value($_POST['password']);
	
	$sql="select * from admin where username='$username' and password='$password'";
	$res=mysqli_query($con,$sql);
	
	// Queries the database and redirects
	if(mysqli_num_rows($res)>0){
		$row=mysqli_fetch_assoc($res);
		$_SESSION['IS_LOGIN']='yes';
		redirect('index.php');
	}else{
		$msg="Please enter valid login details";
	}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Online Food Order Admin Login</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="assets/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">
  <style>
      html, body {
        height: 100vh;
      }
      .container {
        min-height: 100%;
      }
    </style>
</head>
<body>
  <div class="container-fluid p-0">
    <div class="row no-gutters">
      <div class="col-md-8 d-none d-md-block">
        <img src="assets/images/f5.jpg" class="img-fluid h-100 w-100 object-fit-cover" />
      </div>
      <div class="col-md-4 bg-white p-5 d-flex align-items-center">
	    <div class="col-lg-12 mx-auto">
          <div class="auth-form-light text-left p-5 mx-auto">
          <div class="brand-logo text-center">
            <h2>Admin Login Form</h2>
			<img src="assets/images/i2.png" class="img-fluid h-50 w-50 object-fit-cover">
          </div>
          <h6 class="font-weight-light">Sign in to continue.</h6>
          <form class="pt-3" method="post">
            <div class="form-group">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="mdi mdi-account"></i></span>
                </div>
                <input type="textbox" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username" name="username" required>
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="mdi mdi-lock"></i></span>
                </div>
                <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password"  name="password" required>
              </div>
            </div>
            <div class="mt-3">
              <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="SIGN IN" name="submit"/>
            </div>
          </form>
          <div class="login_msg"><?php echo $msg?></div>
        </div>
      </div>
    </div>
  </div>

  <!-- plugins:js -->
  <script src="assets/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="assets/js/Chart.min.js"></script>
  <script src="assets/js/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="assets/js/off-canvas.js"></script>
  <script src="assets/js/hoverable-collapse.js"></script>
  <script src="assets/js/template.js"></script>
  <script src="assets/js/settings.js"></script>
  <script src="assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="assets/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
</html>