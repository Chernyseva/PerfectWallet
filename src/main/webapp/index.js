/**
 * Created by Анастасия on 26.04.2017.
 */
/*$(document).ready(function(){
    alert("ready")
    $("#auth").click(function(){
        var data = {};
        alert("auth");
        data = {"login":$("#email").val(), "password":$("#pass").val()};
//
        $.ajax
        ({
            type: "POST",//Метод передачи
            data: data,//Передаваемые данные в JSON - формате
            url: 's',//Название сервлета
            success:function(serverData)//Если запрос удачен
            {
                alert("sucess")
                $("#auth-info").css({"background-color":serverData.backgroundColor, "height": "50px", "color":"white"});
                $("#auth-info").html(serverData.serverInfo);
            },
            error: function(e)//Если запрос не удачен
            {
                alert("error")
                $("#auth-info").css({"background-color":"#CC6666", "height": "50px", "color":"white"});
                $("#auth-info").html("Запрос не удался!");
            }
        });
    });
});*/