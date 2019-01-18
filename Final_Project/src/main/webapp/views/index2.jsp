<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script>
	function openWin(){  
	    window.open("http://www.naver.net", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}  
</script>
</head>
<body>


<div class="container-fluid">
  <div class="pricing-plan card-group d-flex">
    <div class="card set-price p-1 d-none d-lg-none d-lg-block">
      <div class="card-header text-center pb-4 item">
         <h5 class="pt-3 text-white card-title">Set-priced web design</h5>
        <span class="h1 text-white">Price</span>
        <p class="small text-white">No VAT & No Hidden Costs</p>

      </div>
      <div class="card-body d-flex flex-column">
        <ul class="list-unstyled text-right">
          <li>Custom Design</li>
          </ul>
      </div>
    </div>

    <div class="w-100 d-md-none mt-4"></div>

    <div class="card p-1 starter">
      <div class="card-header text-center pb-4 item">
        <h5 class="pt-3 text-white card-title">Starter Package</h5>
        <span class="h1 text-white">£349</span>
        <p class="small text-white">No VAT & No Hidden Costs</p>
      </div>
      <div class="card-body d-flex flex-column">

        <ul class="list-unstyled text-center">
          <li>1 - 3 Pages</li>
        </ul>
        <a class="btn btn-lg btn-block btn-dark mt-auto" href="#">Get started</a>
      </div>
    </div>

    <div class="w-100 d-md-none mt-4"></div>

    <div class="card advanced p-1">
      <div class="card-header text-center pb-4 item">
        <h5 class="pt-3 text-white card-title">Advanced Package</h5>
        <span class="h1 text-white">£449</span>
        <p class="small text-white">No VAT & No Hidden Costs</p>
      </div>
           <div class="card-body d-flex flex-column">
        <ul class="list-unstyled text-center">
          <li>3 - 6 Pages</li>
        </ul>
        <a class="btn btn-lg btn-block btn-dark mt-auto" href="#">Get started</a>
      </div>
    </div>

    <div class="w-100 d-md-none mt-4"></div>

    <div class="card business p-1">
      <div class="card-header text-center pb-4 item">
        <h5 class="pt-3 text-white card-title">Business Package</h5>
        <span class="h1 text-white">£549</span>
        <p class="small text-white">No VAT & No Hidden Costs</p>
      </div>
      <div class="card-body d-flex flex-column">
        <ul class="list-unstyled text-center">
          <li>6 - 9 Pages</li>
        </ul>
        <a class="btn btn-lg btn-block btn-dark mt-auto" href="#">Get started</a>

      </div>
    </div>
  </div>
</div>

</body>
</html>