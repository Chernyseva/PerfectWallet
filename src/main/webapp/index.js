/**
 * Created by Анастасия on 26.04.2017.
 */
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
            url: '/StartServlet',//Название сервлета

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