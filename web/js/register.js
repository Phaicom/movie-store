
//check username
$(document).ready(function () {
    $("#username").change(function () {
        var username = $(this).val();
        if (username.length >= 4) {
            $("#status").html("<img src='img/loading.gif'><font color=gray> Checking availability...</font>");
            $.ajax({
                type: "POST",
                url: "Check",
                data: "username=" + username,
                success: function (msg) {

                    $("#status").ajaxComplete(function (event, request, settings) {

                        $("#status").html(msg);

                    });
                }
            });
        }
        else {

            $("#status").html("<font color=red>Username should be <b>4</b> character long.</font>");
        }

    });
});

//check password-check
$(document).ready(function () {
    $('#password-check').keyup(function () {
        if ($(this).val() == $('#password').val()) {
            $('.checknote').addClass('hidden');
            $('#termsofuse').click(function () {
                $('#register_submit').removeClass('hidden');
            });

        } else {
            $('.checknote').removeClass('hidden');
            $('#register_submit').addClass('hidden');
        }
    });
});

//check password
$(document).ready(function () {
    $('#password').keyup(function () {
        if ($(this).val() == $('#password-check').val()) {
            $('.checknote').addClass('hidden');
            $('#termsofuse').click(function () {
                $('#register_submit').removeClass('hidden');
            });

        } else {
            $('.checknote').removeClass('hidden');
            $('#register_submit').addClass('hidden');
        }
    });
});

//check submit
$(document).ready(function () {
    $('#termsofuse').click(function () {
        $("#register_submit").toggle(this.checked);
    });
});

      