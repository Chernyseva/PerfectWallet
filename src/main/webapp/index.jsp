<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perfect Wallet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="index.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel='stylesheet'>
    <script src="js/jquery.min.js"></script>
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
                    <div class="row">
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
</body>
</html>
