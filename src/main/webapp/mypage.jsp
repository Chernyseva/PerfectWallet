<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Perfect Vallet</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- <link href="main.css" rel="stylesheet" type="text/css">
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">!-->
    <link href="css/bootstrap.min.css" rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="main.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link href="main2.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/Chart.js"></script>
    <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>!-->
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
<!--<img src="http://www.welovesolo.com/wp-content/uploads/2014/08/1d1e197c7c2cf14589e4274f2efd04ec-details1.jpg"/>!-->




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
                            <!--<form id="dateTab">!-->
                                <button id="day" class="btn btn-default" >Day</button>
                                <button id="week" class="btn btn-default" >Week</button>
                                <button id="month" class="btn btn-default" >Month</button>
                                <button id="year" class="btn btn-default" >Year</button>
                           <!-- </form>!-->

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
                            <button id="day1" class="btn btn-default" >Day</button>
                            <button id="week1" class="btn btn-default" >Week</button>
                            <button id="month1" class="btn btn-default" >Month</button>
                            <button id="year1" class="btn btn-default" >Year</button>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <canvas id="myChart"></canvas>
                                <script>

                                </script>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">
                                <canvas id="myChart1"></canvas>
                                <script>
                                    var ctx1 = document.getElementById("myChart1");
                                    var myChart1 = new Chart(ctx1, {
                                        type: 'bar',
                                        data: {
                                            labels: ["Еда", "Коммунальные", "Развлечения", "Прочее"],
                                            datasets: [{
                                                label: 'рублей',
                                                data: [1200, 1900, 300, 500],
                                                backgroundColor: [
                                                    'rgba(255, 99, 132, 1)',
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 206, 86, 1)',
                                                    'rgba(155, 50, 192, 1)',
                                                    'rgba(153, 102, 255, 1)',
                                                    'rgba(255, 159, 64, 1)'
                                                ],
                                                borderColor: [
                                                    'rgba(255,99,132,1)',
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 206, 86, 1)',
                                                    'rgba(75, 192, 192, 1)',
                                                    'rgba(153, 102, 255, 1)',
                                                    'rgba(255, 159, 64, 1)'
                                                ],
                                                borderWidth: 1
                                            }]
                                        },
                                        options: {
                                            scales: {
                                                yAxes: [{
                                                    ticks: {
                                                        beginAtZero: true
                                                    }
                                                }]
                                            }
                                        }
                                    });
                                </script>
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
            <!--<div class="row" id="check">
                <img id="check" src="http://cheki-v-moskve.ru/images/kassovyi-chek-2.jpg" width=300 height=300/>
                <p>Дата: 23.07.2016</p>
                <p>Сумма: 6000р</p>
                <p>Категория: Прочее</p>
                <p>Комментарий: Футболка поло, Lacostte, подарок брату</p>
            </div>!-->
        </div>
        <!--<div class="col-sm-2 btnAdd">
            <button type="submit" class="btn btn-success btn-block" id="add" data-toggle="modal" data-target="#addForm">Add</button>
            <img id="check" class="fade" src="http://vinil59.ru/image/data/catalog05/2023.png"/>
        </div>!-->
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
                    <input name="date" type="text" class="form-control fR" id="date" data-provide="datepicker" placeholder="Date">
                </div>
                <div class="form-group">
                    <p>Time</p>
                    <input name="time" type="text" class="form-control fR" id="time" data-provide="datepicker" placeholder="Time">
                </div>
                <div class="form-group">
                    <p>Sum</p>
                    <input name="sum" type="text" class="form-control fR" id="sum" placeholder="Sum">
                </div>
                <div class="form-group">
                    <p>Note</p>
                    <input name="note" type="text" class="form-control fR" accept-charset="utf-8" id="note" placeholder="Note">
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
<script type="text/javascript">
    $(document).ready(function(){
        var data = {};
        console.log('hhhhiiii!!!!!')
        data = {"name":["aaa"], "password":["passs"]};
        var obj = {
            login: "Yura",
            password: "123",
            sort: "all"
        }
        console.log("obj created");
        var sums;
        var resultAJAX = $.ajax
        ({
            type: "POST",//Метод передачи
            data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
            dataType: 'json',
            contentType: "application/json",
            url: '/AServlet',//Название сервлета
            success:function(serverData)//Если запрос удачен
            {
                console.log("uaaahh");
                console.log(serverData.name);
                var arr = serverData.items[0];
                var rfew = $('#telo');
                rfew.empty();
                //rfew.find('li').remove();
                for (var i = 0; i< arr.length; i++){

                    console.log(i+" "+arr[i].note);
                    rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                }
                sums = serverData.sums[0];
                console.log("Ssssssuuuuummmmssss");
                console.log(sums);
                var ctx = document.getElementById("myChart");

                var i = 0;
                <!--alert('!');!-->

                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                        datasets: [{
                            label: '# of Votes',
                            //data: [1200, 1900, 300, 500,100],
                            data: sums,
                            backgroundColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(155, 50, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(105, 40, 64, 1)'
                            ],
                            borderColor: [
                                'rgba(255,99,132,1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(105, 40, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
                //console.log(JSON.parse(serverData));
            },
            error: function(jqXHR, exception) {

            }
        });

        $("#myTab a").click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $(window).scroll(function(){
            if ($(this).scrollTop() > 200) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        });

        $('.scrollup').click(function(){
            $("html, body").animate({ scrollTop: 150 }, 600);
            return false;
        });
        console.log('hhhhiiii!!!!!1111111111111111111111111')
        $("#day").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "day"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    rfew.empty();
                    //rfew.find('li').remove();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#day1").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "day"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    rfew.empty();
                    //rfew.find('li').remove();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#month").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "month"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#month1").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "month"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#year").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "year"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#year1").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "year"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    //console.log(JSON.parse(serverData));
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#week").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "week"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    //console.log(JSON.parse(serverData));
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
        $("#week1").click(function(){

            var data = {};
            console.log('hhhhiiii!!!!!')
            data = {"name":["aaa"], "password":["passs"]};
            var obj = {
                login: "Yura",
                password: "123",
                sort: "week"
            }
            var resultAJAX = $.ajax
            ({
                type: "POST",//Метод передачи
                data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
                dataType: 'json',
                contentType: "application/json",
                url: '/AServlet',//Название сервлета
                success:function(serverData)//Если запрос удачен
                {

                    console.log(serverData.name);
                    var arr = serverData.items[0];
                    var rfew = $('#telo');
                    //rfew.find('li').remove();
                    rfew.empty();
                    for (var i = 0; i< arr.length; i++){

                        console.log(i+" "+arr[i].note);
                        rfew.append('<tr><td>' + arr[i].date + '</td><td>' + arr[i].sum+ '</td><td>' + arr[i].note + '</td></tr>');
                    }
                    //console.log(JSON.parse(serverData));
                    sums = serverData.sums[0];
                    console.log("Ssssssuuuuummmmssss");
                    console.log(sums);
                    var ctx = document.getElementById("myChart");

                    var i = 0;
                    <!--alert('!');!-->

                    var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                            datasets: [{
                                label: '# of Votes',
                                //data: [1200, 1900, 300, 500,100],
                                data: sums,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(155, 50, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(105, 40, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                },
                error: function(jqXHR, exception) {
                    alert('error happened');
                }
            });

            //alert(resultAJAX.data)
        });
    });
</script>

</body>
</html>
<!--<c:forEach var="num" items="${data}">
    <tr>
    <td>${num.date}</td>
    <td>${num.sum}</td>
    <td>${num.note}</td>
    </tr>
</c:forEach>!-->