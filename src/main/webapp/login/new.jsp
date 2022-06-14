<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<!--  contact us + sign up -->
    <section class="site-section bg-light" id="contact-section" data-aos="fade">
      <div class="container">
      
      <!-- signUp -->
        <div class="row">
          <div class="col-md-12 mb-5">
	
            <form action="../login/join.do" class="p-5 bg-white">
              
              <h2 class="h4 text-black mb-5">Sign Up Form</h2> 
			
			<div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Name</label>
                  <input type="text" id="fname" class="form-control">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Phone</label>
                  <input type="text" id="lname" class="form-control">
                </div>
             </div>
              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">ID</label>
                  <input type="text" id="fname" class="form-control">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Pass Word</label>
                  <input type="text" id="lname" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label> 
                  <input type="email" id="email" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="subject">Address</label> 
                  <input type="subject" id="subject" class="form-control">
                </div>
              </div>
	<!-- 
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Message</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>
	 -->
              <div class="row form-group">
                <span style="margin-left: 13px;">
                  <input type="submit" value="Sign up" class="btn btn-primary btn-md text-white">
                </span>
                <span style="margin-left: 790px;">
                  <input type="reset" value="Cancel" class="btn btn-outline-primary btn-md">
                </span>
              </div>
  
            </form>
          </div>
          
        </div>
      </div>
    </section>
</body>

</html>