<%-- 
    Document   : addItem
    Created on : Nov 25, 2021, 4:03:35 PM
    Author     : kenan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        <title>Add Item</title>
       
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
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
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
            .registration-form .social-media{
                max-width: 600px;
                background-color: #fff;
                margin: auto;
                padding: 35px 0;
                text-align: center;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
                color: #9fadca;
                border-top: 1px solid #dee9ff;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            }
            .registration-form .social-icons{
                margin-top: 30px;
                margin-bottom: 16px;
            }
            .registration-form .social-icons a{
                font-size: 23px;
                margin: 0 3px;
                color: #5691ff;
                border: 1px solid;
                border-radius: 50%;
                width: 45px;
                display: inline-block;
                height: 45px;
                text-align: center;
                background-color: #fff;
                line-height: 45px;
            }
            .registration-form .social-icons a:hover{
                text-decoration: none;
                opacity: 0.6;
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
        
        <jsp:include page="navbar.jsp"></jsp:include>
        
       <div class="container-fluid d-flex justify-content-center pt-3">
            <small class="text-muted fw-bold">ADMIN PANEL - ADD ITEM</small>
       </div>
        
       <hr>
        
       <div class="registration-form">
            <form action="addItem" method="POST" autocomplete="off">
                <div class="form-text">
                    <h3 class="fw-bold pb-3" style="margin-top:-25px">Add an item</h3>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="itemName" name="itemName" placeholder="Item Name" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="itemDescription" name="itemDescription" placeholder="Item Description" required="required">
                </div>
                <div class="form-group">
                    <input type="number" min="0.1" step="any" class="form-control item" id="itemPrice" name="itemPrice" placeholder="Item Price" required="required">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block create-account">Add Item</button>
                </div>
                <hr>
            </form>
        </div>
    </body>
</html>
