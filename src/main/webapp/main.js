$(function () {
    console.log('hello!')
    $('#date').datetimepicker({
        defaultDate: $(new Date())[0],
        format: 'DD/MM/YYYY',
    });
    $('#time').datetimepicker({
        format: 'LT',
    });

    $("#telo").hover(function () {
        $("#check").removeClass('fade')
    }, function () {
        $("#check").addClass('fade')
    });

});

    $(document).ready(function () {
        $("#myTab a").click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
    });


    $(document).ready(function(){

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

    });

function hello(str) {
    //alert("Hello Everybody!"+str)
    var data = {};
    console.log('hhhhiiii!!!!!')
    data = {"name":["aaa"], "password":["passs"]};
    var obj = {
        login: "Yura",
        password: "123",
        sort: str.toString()
    }
    var resultAJAX = $.ajax
    ({
        type: "POST",//Метод передачи
        data: JSON.stringify(obj),//Передаваемые данные в JSON - формате
        dataType: 'json',
        contentType: "application/json",
        url: '/MainServlet',//Название сервлета
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
            var sums = serverData.sums[0];
            var dates = serverData.dates[0];
            var labels = serverData.labels[0];
            console.log("Ssssssuuuuummmmssss");
            console.log(sums);
            var ctx = document.getElementById("myChart");

            var myChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ["Еда", "Коммунальные", "Здоровье", "Прочее","Развлечение"],
                    datasets: [{
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

            var ctx1 = document.getElementById("myChart1");


            //myChart1.clear();
            var myChart1 = new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '',
                        //data: [1200, 1900, 300, 500,100],
                        data: dates,

                        borderWidth: 1
                    }]
                },
                options: {
                    barPercentage : 0.5,
                    scales: {
                        yAxes: [{
                            barPercentage : 0.5,
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

}
