<%-- 
    Document   : registration
    Created on : Nov 22, 2021, 11:04:54 PM
    Author     : kenan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        <title>Registration</title>
        <style>
            body{
                background-color: #dee9ff;
            }

            .registration-form{
                    padding: 50px 0;
            }

            .registration-form form{
                background-color: #fff;
                max-width: 600px;
                margin: auto;
                padding: 50px 70px;
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            }

            .registration-form .form-icon{
                    text-align: center;
                background-color: #5891ff;
                border-radius: 50%;
                font-size: 40px;
                color: white;
                width: 100px;
                height: 100px;
                margin: auto;
                margin-bottom: 50px;
                line-height: 100px;
            }

            .registration-form .item{
                    border-radius: 20px;
                margin-bottom: 25px;
                padding: 10px 20px;
            }

            .registration-form .create-account{
                border-radius: 30px;
                padding: 10px 20px;
                font-size: 18px;
                font-weight: bold;
                background-color: #5791ff;
                border: none;
                color: white;
                margin-top: 20px;
            }

            @media (max-width: 576px) {
                .registration-form form{
                    padding: 50px 20px;
                }

                .registration-form .form-icon{
                    width: 70px;
                    height: 70px;
                    font-size: 30px;
                    line-height: 70px;
                }
            }
        </style>
    </head>
    <body>
        
        <div class="registration-form">
            <form action="Registration" method="POST">
                <div class="form-icon">
                    <span><i class="icon icon-user"></i></span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" name="username" id="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control item" name="password" id="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control item" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" name="address" id="address" placeholder="Address">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block create-account">Create Account</button>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>




    
