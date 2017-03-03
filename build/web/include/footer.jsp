<a href="#" class="back-to-top">Back to Top</a>
<footer>
    <div class="container">
        <div class="row">
            <div align="left">
                <span>Project JSP</span>
            </div>
            <div align="right">
                <ul class="list-inline">
                    <li><a href="#">Privacy Policy</a>
                    </li>
                    <li><a href="#">Terms of Use</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<script type="text/javascript">
    var amountScrolled = 300;

    $(window).scroll(function () {
        if ($(window).scrollTop() > amountScrolled) {
            $('a.back-to-top').fadeIn('slow');
        } else {
            $('a.back-to-top').fadeOut('slow');
        }
    });
    
    $('a.back-to-top').click(function() {
	$('body, html').animate({
		scrollTop: 0
	}, 700);
	return false;
});
</script>