//check password-check
$(document).ready(function () {
    $('#password-check').keyup(function () {
        if ($(this).val() == $('#password').val()) {
            $('.checknote').addClass('hidden');
            $('#register_submit').removeClass('hidden');

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
            $('#register_submit').removeClass('hidden');

        } else {
            $('.checknote').removeClass('hidden');
            $('#register_submit').addClass('hidden');
        }
    });
});