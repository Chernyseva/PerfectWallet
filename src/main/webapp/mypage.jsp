<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
    <title>Perfect Wallet</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel='stylesheet'>
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="main.js"></script>
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link href="main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/Chart.js"></script>
</head>
<body>
<section class="jumbotron" id="j">
    <div class="container">
        <div class="row text-center">
            <h1>Perfect Wallet</h1>
            <h2>Your personal finance helper</h2>
        </div>
    </div>
</section>
<div class="container field">
    <div class="row">
        <div class="col-sm-8">
            <div class="tab1">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#panel1">Список расходов</a></li>
                    <li><a href="#panel2">График расходов</a></li>
                </ul>
                <div class="tab-content">
                    <div id="panel1" class="tab-pane fade in active">
                        <div class="row" id="buts">
                            <button id="day" class="btn btn-default">Day</button>
                            <button id="week" class="btn btn-default">Week</button>
                            <button id="month" class="btn btn-default">Month</button>
                            <button id="year" class="btn btn-default">Year</button>
                        </div>
                        <div class="row">
                            <div class="col-sm-8">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Sum</th>
                                        <th>Description</th>
                                    </tr>
                                    </thead>
                                    <tbody id="telo">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="panel2" class="tab-pane fade">
                        <div class="row" id="buts">
                            <button id="day1" class="btn btn-default">Day</button>
                            <button id="week1" class="btn btn-default">Week</button>
                            <button id="month1" class="btn btn-default">Month</button>
                            <button id="year1" class="btn btn-default">Year</button>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <canvas id="myChart"></canvas>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">
                                <canvas id="myChart1"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="row" id="rowAdd">
                <div class="col-sm-6"></div>
                <div class="col-sm-6 btnAdd">
                    <button type="submit" class="btn btn-success btn-block" id="add" data-toggle="modal"
                            data-target="#addForm">Add
                    </button>
                </div>
            </div>
            <a href="#" id="up" class="scrollup">Наверх</a>
        </div>
    </div>
</div>
<footer class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <p>&copy Perfect Wallet 2016</p>
            </div>
        </div>
    </div>
</footer>
<form method="post" action="/add" accept-charset="utf-8">
    <div id="addForm" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" id="mContent">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Add a pay</h4>
                </div>
                <div class="modal-body">Заполните форму</div>
                <div class="form-group">
                    <p>Date</p>
                    <input name="date" type="text" class="form-control fR" id="date" data-provide="datepicker"
                           placeholder="Date">
                </div>
                <div class="form-group">
                    <p>Time</p>
                    <input name="time" type="text" class="form-control fR" id="time" data-provide="datepicker"
                           placeholder="Time">
                </div>
                <div class="form-group">
                    <p>Sum</p>
                    <input name="sum" type="text" class="form-control fR" id="sum" placeholder="Sum">
                </div>
                <div class="form-group">
                    <p>Note</p>
                    <input name="note" type="text" class="form-control fR" accept-charset="utf-8" id="note"
                           placeholder="Note">
                </div>
                <p>Category</p>
                <select class="form-control" name="category">
                    <option value="1">Еда</option>
                    <option value="5">Развлечения</option>
                    <option value="2">Коммунальные</option>
                    <option value="3">Здоровье</option>
                    <option value="4">Прочее</option>
                </select>
                <button type="submit" class="btn btn-success btn-block" id="addPhoto">Add Photo</button>
                <div class="buttonStart">
                    <div class="row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-success btn-block" id="add">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
