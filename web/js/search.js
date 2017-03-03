//            type
$(document).ready(function () {
    $('.search-num').hide();
    $('#type').change(function () {
        if ($(this).val() == 'Name') {
            $('#search-name').show();
            $('.search-num').hide();
        } else {
            $('.search-num').show();
            $('#search-name').hide();
        }
    });
});

//            role
$(document).ready(function () {
    $('#saveMovie_button').show();
    $('#addReview_button').hide();
    $('#addFeature_button').hide();
    $('#role').change(function () {
        if ($(this).val() == 'Movie') {
            $('#Price').show();
            $('#saveMovie_button').show();
            $('#addReview_button').hide();
            $('#addFeature_button').hide();
        } else if ($(this).val() == 'Feature') {
            $('#Price').show();
            $('#saveMovie_button').hide();
            $('#addReview_button').hide();
            $('#addFeature_button').show();
        } else {
            $('#Name').attr('selected', 'selected');
            $('#search-name').show();
            $('.search-num').hide();
            $('#Price').hide();
            $('#saveMovie_button').hide();
            $('#addReview_button').show();
            $('#addFeature_button').hide();
        }
    });
});

//selected
$(document).ready(function () {

    if ($("#type").val() == 'Name') {
        $('#search-name').show();
        $('.search-num').hide();
    } else {
        $('#search-name').hide();
        $('.search-num').show();
    }
});

//selected
$(document).ready(function () {

    if ($('#role').val() == 'Movie') {
        $('#saveMovie_button').show();
        $('#addReview_button').hide();
        $('#addFeature_button').hide();
    } else if ($('#role').val() == 'Feature') {
        $('#saveMovie_button').hide();
        $('#addReview_button').hide();
        $('#addFeature_button').show();
    } else {
        $('#Name').attr('selected', 'selected');
        $('#saveMovie_button').hide();
        $('#addReview_button').show();
        $('#addFeature_button').hide();
    }
});







