<%--
  Created by IntelliJ IDEA.
  User: Анастасия
  Date: 26.12.2016
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perfect Vallet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="index.css" rel="stylesheet" type="text/css">
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">!-->
    <link href="css/bootstrap.min.css" rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="index.js"></script>
</head>
<body>
<section class="jumbotron">
    <div class="container">
        <div class="row text-center">

            <h1>Welcome to Perfect Wallet!</h1>
        </div>
    </div>
</section>
<!--<img src="http://www.welovesolo.com/wp-content/uploads/2014/08/1d1e197c7c2cf14589e4274f2efd04ec-details1.jpg"/>!-->
<section class="container">
    <div class="vallet">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <form role="form" method="post" action="/s">
                    <div class="form-group">
                        <input name="email" type="email" class="form-control" id="email" placeholder="E-mail">
                    </div>
                    <div class="form-group">
                        <input name="pass" type="password" class="form-control" id="pass" placeholder="Password">
                    </div>
                    <!--<div class="row">
                        <div id="auth-info"></div>
                    </div>!-->
                    <div class="row">
                        <!--<div class="checkbox">
                            <div class="col-sm-6"><label><input type="checkbox"> Remember me</label></div>
                        </div>!-->
                        <div class="info">
                            <div class="col-sm-6">
                                <div id="infoA">

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-link " data-toggle="modal" data-target="#regForm"
                                    id="signup">Sign up
                            </button>
                        </div>
                    </div>


                </form>
                <div class="buttonStart">
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">
                            <!--<button type="submit" class="btn btn-success btn-block" id="start" onclick="location.href='main.html'">Start</button>!-->
                            <!--<form>
                                <!--<button type="submit" class="btn btn-success btn-block" id="auth">Start</button>!-->
                            <!--<input type="button" value="Start" class="btn btn-success btn-block" id="start"
                                   onclick="location.href='mypage.jsp'">!-->
                            <!-- <button id="auth1" class="btn btn-success btn-block" >Start</button>
                         </form>!-->
                            <button id="auth1" class="btn btn-success btn-block" >Start</button>
                        </div>
                    </div>
                </div>
                <form method="post" action="/reg">

                    <div id="regForm" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" type="button" data-dismiss="modal">×</button>
                                    <h4 class="modal-title">Registration</h4>
                                </div>
                                <div class="modal-body">Fill the form</div>
                                <div class="form-group">
                                    <input name="name" type="name" class="form-control fR" id="name" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input name="email" type="email" class="form-control fR" id="email"
                                           placeholder="E-mail">
                                </div>
                                <div class="form-group">
                                    <input name="pass" type="password" class="form-control fR" id="pass"
                                           placeholder="Password">
                                </div>
                                <div class="buttonStart" id="btnStart">
                                    <div class="row">
                                        <div class="col-sm-6"></div>
                                        <div class="col-sm-5">
                                            <button type="submit" class="btn btn-success btn-block" id="reg2">Do it
                                            </button>
                                            <!--<button type="button" class="btn btn-success btn-block" id="reg"
                                                    data-dismiss="modal" onclick="addUser()">Do it
                                            </button>!-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
    <div class="row text-center">
        <h2>With us you can:</h2>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <h3>Control your spending</h3>
        </div>
        <div class="col-sm-4">
            <h3>Get informative graphs</h3>
        </div>
        <div class="col-sm-4">
            <h3>Set own categories</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <img src="http://vinil59.ru/image/data/catalog05/2023.png"/>
        </div>
        <div class="col-sm-4">
            <img src="http://abali.ru/wp-content/uploads/2011/10/pie-chart.png"/>
        </div>
        <div class="col-sm-4">
            <img src="http://wsile.ru/uploads/pullups/Igralnya-kubiki.png"/>
        </div>
    </div>
</section>
<footer class="jumbotron">
    <div class="fc container">
        <div class="row">
            <div class="col-sm-4">
                <p>&copy Perfect Wallet 2016</p>
            </div>
        </div>
    </div>
</footer>
<script>
    $(document).ready(function(){
        //alert("script")
        $("#auth1").click(function () {
            //alert("auth");
            data = {"login": $("#email").val(), "password": $("#pass").val()};
            var obj = {
                login: $("#email").val(),
                password: $("#pass").val()
            }
//
            //alert("begin ajax")
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/BServlet',//Название сервлета

                success: function (serverData)//Если запрос удачен
                {
                    //alert("sucess")
                    console.log("b sucess");
                    if (serverData.id=="correct"){
                        //alert("correct")
                        window.location.href="/site"
                    }else{
                        //alert("uncorret")
                        $("#infoA").css({"background-color":"#CC6666", "height": "20px", "color":"white"});
                        $("#infoA").html("Wrong email or password");
                    }


                },
                error: function (jqXHR, exception) {
                   // alert("error")
                }
            });

        });
    });

</script>
</body>
</html>
