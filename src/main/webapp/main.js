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


function addUser() {
    var jsonData = new Object();
    jsonData.command = "1";
    jsonData.name = $('#name').val();
    jsonData.email = $('#email').val();
    jsonData.pass = $('#pass').val();


    serverConnectFunc(serverPath+"//reg", JSON.stringify(jsonData));

}