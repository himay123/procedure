
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <title>Document</title>
    <style>
       .errors {
      color: red;
   }
    </style>
    <script>
    $(document).ready(function(){
        $.validator.addMethod("alpha", function(value, element) {
        return this.optional(element) || /^[a-zA-Z ]*$/.test(value);
        });
        $.validator.addMethod("digit", function(value, element) {
        return this.optional(element) || /^[0-9]*$/.test(value);
        });
        $.validator.addMethod("p_match", function(value, element) {
        return this.optional(element) || /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/.test(value);
        });
        $("form[name='register']").validate({
            errorClass: 'errors',
            rules:{
                first:{
                    required:true,
                    alpha:true
                },
                last:{
                    required:true,
                    alpha:true
                },
                email:{
                    required:true,
                    email:true,
                   /* remote:{
                      url:'check.php',
                      type:'post'
                    }*/
                },
                mobile:{
                    required:true,
                    digit:true,
                    minlength:10,
                    maxlength:10
                   /* remote:{
                      url:'mobile_check.php',
                      type:'post'
                    }*/
                }
            },
            messages:{
               first:{
                    required:"please enter first name",
                    alpha:"Only alpha alow"
               },
               last:{
                    required:"please enter last name",
                    alpha:"Only alpha alow"
               },
               email:{
                    required:"Please Enter Email Address",
                    email:"Enter Valid Email Address",
                   // remote:"email already exist"
               },
               mobile:{
                   required:"Please Enter Mobile Number",
                   digit:"Enter valid mobile Number",
                   //remote:"mobile number alredy exist"
               }
            },
            highlight: function (element) {
                $(element).parent().addClass('error')
            },
            unhighlight: function (element) {
                $(element).parent().removeClass('error')
            },
            submitHandler: function(form) {
               form.submit();
           }
        });
    });
    </script>
</head>
<body>

    <form method="POST" id="register" name="register" action="insert.php">
     <h1 class="text-center">Sing Up</h1>
    <div class="container">
     <div class="jumbotron" style="width:50%;margin-left:300px">
       <div class="form-group">
         <label for="first">First Name:</label>
         <input type="text" name="first" id="first" class="form-control" placeholder="Enter first name">
         
       </div>
       
       <div class="form-group">
         <label for="last">Last Name:</label>
         <input type="text" name="last" id="last" class="form-control" placeholder="Enter last name">
       </div>
       <div class="form-group">
         <label for="email">Email:</label>
         <input type="text" name="email" id="email" class="form-control" placeholder="Enter Email Id">
       </div>
       <div class="form-group">
         <label for="mobile">Mobile Number:</label>
         <input type="text" name="mobile" id="mobile" class="form-control" placeholder="Enter mobile Number">
       </div>
    
       <input type="submit" name="submit" value="Sing Up" class="btn btn-success btn-block btn-lg">
    </div>
    
    </div>
    </form>

</body>
</html>