<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Register</title>
        <style>
            .warn{
                color : red;
            }
            .hidden{
                display: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="js/jquery.js" type="text/javascript"></script> 
        <script src="js/register.js" type="text/javascript"></script> 

        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-user-plus"></i> Register</h1>
                                </div>
                                <hr>
                                <form class="form-horizontal" role="form" action="Register" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                        </label>
                                        <div class="col-sm-6" style="color: red">
                                            ${msg}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Username
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="username" id="username"/> <br>
                                            <span id="status"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Password
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="password" class="form-control" name="password" id="password"/><br>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Password Again
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="password" class="form-control" name="password-check" id="password-check" /> <br>
                                            <span class="warn hidden checknote">Password do not match!</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Email
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="email" class="form-control" name="email"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            First Name
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="fname"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Last Name
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="lname"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Gender
                                        </label>
                                        <div class="col-sm-6">
                                            <select name="gender" class="form-control">
                                                <option value="M">Male</option>
                                                <option value="F">Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Date of birth
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="date" class="form-control" name="DOB"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Phone
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="phone"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Address Line 1
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="addressline1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Address Line 2
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="addressline2"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            City
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="city"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            State
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="state"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Zip
                                        </label>
                                        <div class="col-sm-6">
                                            <input required type="text" class="form-control" name="zip"/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <div class="center">
                                            <p>
                                                <input type="checkbox" name="termsofuse" id="termsofuse" value="true"> I have read and agreed to the <a href="#term" data-toggle="modal">terms and conditions</a> of Movie Store
                                            </p>
                                            <input type="submit" class="btn btn-success btn-lg hidden" value="Sign Up" id="register_submit">
                                        </div>
                                    </div>
                                </form>
                                <div class="modal fade" id="term">
                                    <div class="modal-content col-lg-6 col-lg-offset-3 div-blog">
                                        <div class="modal-body col-lg-12">
                                            <h1 class="center">Term and Conditions</h1>
                                            <hr>
                                            <div>
                                                <h3><u>1. Accepting Our Terms of Use</u></h3>
                                                <p>These Terms of Use, which include our tremendous Privacy Policy, fabulous End User License Agreement ("EULA") govern your use of Movie Store. By using, visiting, or browsing the Movie Store service, you accept and agree to these Terms of Use. If you do not agree to these Terms of Use, do not use the Movie Store service, do not pass go and unless it’s to take a good hard look at yourself.                   
                                                    The Movie Store service is provided by Movie Store Ltd., or one of its affiliated companies (“Movie Store”).
                                                </p>
                                                <h3><u>2. Us Changing Our Terms of Use</u></h3>
                                                <p>
                                                    Like most people, we like to shake it up sometimes. What this means for you is we may at our discretion make changes to our appearance or the Movie Store Terms of Use, including the Privacy Policy, EULA and Social Terms. When we REALLY shake things up, we’ll let you know through the service or email. All our changes are effective immediately; so by continuing to love us and use us after those changes are made, you are expressing and acknowledging your acceptance of the changes, so we thank you in advance.
                                                </p>
                                                <h3><u>3. Getting In Touch</u></h3>
                                                <p>
                                                    Just by using Movie Store, you are cool with receiving electronic communications from us relating to your account. We might get in touch by sending emails to your email address (which we have because you gave it to us during sign-up), but not emails to your house address because that doesn’t work very often, or posting communications on the Movie Store service, or the "Settings" page, stamps not included, and will include notices about your account (e.g., payment authorizations, change in password or Payment Method, confirmation e-mails and other transactional information) and are part of your relationship with Movie Store. We see your relationship with Movie Store as like holding a bird. We want to hold it just tight enough that it doesn’t fly away, but not so tight that we damage it. You agree that any notices, agreements, disclosures or other communications that we send to you electronically will satisfy any legal communication requirements and are fine even if not void of spelling errors, including that such communications be in writing. You should maintain copies of electronic communications by printing a paper copy or saving an electronic copy. We suggest the latter as we are pro tree. You are also cool with us getting in touch on certain other matters, such as newsletters about new Movie Store features and content, special offers, promotional announcements and customer surveys via email or other methods. If you no longer want to receive certain non-transactional communications, MAKE US STOP! Simply click the "unsubscribe" link in any of the emails you'd like to unsubscribe to. Please review our Privacy Policy for further detail on our marketing communications.
                                                </p>
                                                <h3><u>4. Privacy Stuff</u></h3>
                                                <p>Information that identifies you as YOU is subject to our Privacy Policy, the terms of which are incorporated herein. Please read through our Privacy Policy to understand our practices – like veggies they’re good for you. Please read the news every day, too. It’s a big world out there people, and it pays to be informed.
                                                </p>
                                                <h3><u>5. Member’s Corner and Payment</u></h3>
                                                <p>
                                                <u>5.1 Membership</u>
                                                Ongoing Membership. You must have internet access and provide Movie Store with a current, valid, accepted method of payment (as may be updated from time to time, "Payment Method") to use the Movie Store service. If you don’t have internet access and still wish to pay us money every month, hey that’s OK too, but you won’t enjoy what we do very much. If you choose a monthly membership, your Movie Store membership will continue in effect on a period-to-period basis unless and until you cancel your membership or we terminate it, Arnold. We will bill the membership fee to your Payment Method every 31 days. You must cancel your membership before it renews every 31 days in order to avoid billing of the next period’s membership fees to your Payment Method. #obvi. If you choose an annual membership, your membership will end at the end of the current 365-day period unless you make another payment through a Payment Method before the end of the current period. Should Movie Store not receive a payment before the end of the current period, your membership will end at the end of the current period and will only resume once you make a payment through a Payment Method. In this case, your next period will begin on the day Movie Store receives payment through the Payment Method, not 28 days later in accordance with nature.
                                                Differing Memberships. We may offer a number of membership plans, including special promotional plans or memberships with differing conditions and limitations. We reserve the right to call the membership plan whatever we want and you have the option to subscribe to the "Emperor of the Seven Seas" plan when it is available. You can find specific details regarding your membership with Movie Store by visiting our website and clicking on the "Settings" page. Some promotional memberships are offered by third parties in conjunction with the provision of their own products and services. We are not responsible for the products and services provided by such third parties, but if they are awesome we don’t mind some credit. We reserve the right to modify, terminate or otherwise amend our offered membership plans. We also reserve the right to randomly begin dancing.
                                                </p>
                                                <p>
                                                <u>5.2 Trial Membership</u>
                                                Once in a while, we may offer trials for a certain period without payment (“Trial Membership”). We reserve the right, at our sole discretion, to confirm if you’re suitable for a Trial Membership. We may also withdraw or to modify a Trial Membership at any time without notice to you and with no liability to the widest extent permitted under Local Country Law. If we feel you’re abusing our awesome trial or promotional offer, we may at our discretion decide to charge for them based on the standard fee for in your country. So, don’t abuse it and all will be well.
                                                You may choose to begin subscription to a monthly or annual membership before your Trial Membership expires. In this case, your monthly or annual membership will begin when you make a payment, and you agree to forgo the remaining period of your Trial Membership. You may also choose to begin subscription to a monthly or annual membership precisely when, or after your Trial Membership expires. Your monthly or annual membership will still begin when you make a payment. To view the specific details of your membership, including monthly or annual membership price and end date of your Trial Membership period, visit the "Settings" page. We may authorize your Payment Method through various methods (although we usually don't), including authorizing it up to approximately one month of service as soon as you register. In short, no money, no honey.
                                                </p>
                                                <p>                                    
                                                <u>5.3 Billing</u>
                                                Recurring Billing. By starting your monthly membership and providing or designating a Payment Method, you authorize us to charge you a periodic membership fee at the then current rate of your selected membership, and any other charges you may incur in connection with your use of the Movie Store service to your Payment Method. We will not be permitted to buy gifts for friends using your Payment Method. We may discuss you buying us coffee. You acknowledge that the amount billed for each billing period may vary from period to period for reasons that may include differing amounts due to promotional offers, including promotional code redemption, and/or changing or adding a plan, and you authorize us to charge your Payment Method for such varying amounts, which may be billed per billing period in one or more charges.
                                                Price Changes. We reserve the right to adjust pricing for our service or any components thereof in any manner and at any time as we may determine in our sole and absolute discretion. Except as otherwise expressly provided for in these Terms of Use, any price changes to your service will take effect following notice to you by Movie Store. We will tell you first, don’t stress.
                                                Billing Cycle. The membership fee for our service will be billed at the beginning of the paying portion of your membership and each period (the period may vary depending on your membership plan) thereafter unless and until you cancel your membership. And if you do, we won’t bill you anymore. Cos that’s how it works. We automatically bill your Payment Method every 31 days. Membership fees are fully earned upon payment, which is kinda a legal thing, kinda an accounting thing, and 100% boring. We reserve the right to change the timing of our billing, in particular, as indicated below, if your Payment Method has not successfully settled. Visit our website and click on the "Settings" page to see the expiry date for your current period. We may authorize or notify you of your Payment Method in anticipation of membership or service-related charges. As used in these Terms of Use, "billing" shall indicate a charge, debit or other payment clearance, as applicable, against your Payment Method. Unless otherwise stated differently, period or periodically refers to your billing cycle.
                                                No Refunds. Payments are nonrefundable and Movie Store does not commit to provide refunds or credits for any reason, including partially used periods. However, we have a person on staff called "The Decider" who says we retain the right to provide to provide a refund, discount, or other consideration at any time, and for any reason, to some or all of our members ("credits"), if The Decider wants to. The amount and form of such credits, and the decision to provide them, are at our sole and absolute discretion and may depend on lots of things we aren’t too sure about. The decision by The Decider to provide credits in one instance does not entitle you to credits in the future for similar instances, nor does it obligate us to ask The Decider to provide you credits in the future, under any circumstance. Unless The Decider decides.
                                                Cancellation. Whilst we are sure it is likely to be a source of great regret, feel free to feel free and you can cancel your Movie Store membership at any time. If you regrettably cancel, you’ll still be able to watch our incredible content on Movie Store until the end of your billing period (See! We’re really not that mean!) We don’t provide refunds or credits for any unused partial month membership periods, unwatched movies or TV shows. If you have subscribed to a monthly membership, you will need to cancel your membership on the "Settings" page of our website. If you have subscribed to an annual membership, simply wait for your membership period to expire, like watching paint dry, only with better actors. If you cancel your membership, your account will SHUT DOWN at the end of your current billing period and you won’t be able to access our content anymore. To see when your membership plan will expire, visit the "Settings" page. If you signed up for Movie Store using your account with one of our special third party partners as a Payment Method, and want to cancel your Movie Store membership, you might need to cancel via them, including by visiting your account with that third party and turning off any auto-renew, or unsubscribing from, Movie Store. If you need to check on any billing information, visit your account with the applicable third party and then… LET’S PARTY.
                                                </p>
                                                <h3><u>6. Movie Store!</u></h3>
                                                <p>
                                                    This is the part where, if you’re a minor, you won’t be too happy about. You must be 18 years old and above, or the legal governing age as decided in your province, territory or country, to become a member of Movie Store. Individuals under the age of 18, or applicable age of majority, may access Movie Store only with the involvement of a parent or legal guardian, under that person's account and otherwise subject to these Terms of Use. You also must be this high to ride this entertainment pony.
                                                    Movie Store, and anything viewed on it, is for your personal (and very non-commercial) enjoyment/use only. So long as you’re a member of Movie Store, we grant you a limited, non-exclusive, non-transferable, license to access Movie Store and view movies and TV shows through the service on a streaming-only basis, or where applicable under these Terms of Use, a limited download for that purpose. Other than this limited license, no right, title or interest shall be transferred to you. You agree not to use the service for public performances. So, you may juggle in front of friends and fans with your Movie Store enabled mobile device, but that device can’t be playing Movie Store content while you do it. Capisce?
                                                    You can watch a movie or TV show on Movie Store if we are available in the country in which you’ve registered your account and if we’ve licensed the rights to distribute our content in that country. But that’s super complicated stuff, so we won’t bore you with it. Like food you consume, the content that may be available to watch will vary by geographic location. We will use our top-secret technologies to verify your geographic location, just like in the movies. We authorize you to access content on up to five (5) approved, registered devices and to stream content to two (2) approved, registered devices at any time for personal, non-commercial purposes. The number of devices available for use and the simultaneous streams may change from time to time at our discretion, but we think 5 and 2, like the diet, is pretty effective.
                                                    In some cases, for super-special movies or TV shows, we may at our sole discretion provide you with a time-bound license that allows you to download, temporarily store and access one or more content titles on one (1) approved, registered device for personal, non-commercial purposes for up to seven (7) days. After the seven-day period has lapsed, you will no longer be able to access the content offline. Oh no! But wait! To access the content offline, you will need to download the content from the Movie Store service again. Oh yes! You acknowledge that if during such downloaded period (a) you stop using Movie Store; (b) the distributor from whom Movie Store licenses the content requires Movie Store to withdraw the content (meaning we can’t stream it anymore); you may not be able to continue to access some of the content downloaded as it may self destruct, and, to the full extent permitted by law, in that event Movie Store will not have any liability to you.
                                                    Because we are so hip and happening, we do make it a point to always add stuff into the Movie Store service, including the content library. We totally understand your insatiable appetite for fresh meat/things to watch. On top of that, we continually test different aspects of our service, including our website, user interfaces, service levels, plans, promotional features, availability of content, delivery and pricing. Sometimes these tests are in the form of written examination and often, in multiple answer format. Sometimes we just poke them to see what happens. We reserve the right to, and by using our service you agree that we may, include you in or exclude you from these tests without notice. Please don’t be alarmed if you suddenly get poked. That’s just us doing random testing’s. With that said, we can 100% confirm that there will be no animal testing. We reserve the right in our sole and absolute discretion to make changes from time to time and without notice in how we offer and operate our service.
                                                    Here’s more stuff that you will agree to even though you haven’t read it. In accordance with all applicable laws, rules and regulations, taboos, or other restrictions on use of the service or content therein, you hereby agree to use Movie Store, including all features and functionalities associated with the service in totality. You agree not to archive, download (other than through caching necessary for personal use), reproduce, distribute, modify, display, perform, publish, license, create derivative works from, offer for sale, or use (except as explicitly authorized in these Terms of Use) content and information contained on or obtained from or through the Movie Store service without express written permission from Movie Store and its licensors. You also agree not to: circumvent, remove, alter, deactivate, degrade or thwart any of the content protections in the Movie Store service; use any robot, spider, scraper or other automated means to access the Movie Store service; decompile, reverse engineer, forward engineer or disassemble any software or other products or processes accessible through the Movie Store service; insert any code or product or manipulate the content of the Movie Store service in any way; or, use any data mining, data gathering or extraction method. In addition, you agree not to upload, post, e-mail or otherwise send or transmit any material designed to interrupt, destroy or limit the functionality of any computer software or hardware or telecommunications equipment associated with the Movie Store service, including any software viruses or any other computer code, files or programs. You also agree not to provide your password to any other person or use any other person’s username and password. And we are offering a free annual Movie Store subscription to the next person to successfully count the number of verbs in the above paragraph.
                                                    The awesomeness that is our content will change from time to time, and from country to country. Some will be good and you will enjoy them. Some will not. The quality of the display of the streaming content may vary from PC to PC or device to device (depending on where you’re streaming Movie Store from!), and may be affected by a bunch of factors, such as your location, the bandwidth available and/or speed of your Internet connection. HD availability is subject to your Internet service and device capabilities. Not all content is available in HD. A download speed of at least 5.0 Mbps per stream is recommended to receive HD content, which is defined as 720p or better. That would be really awesome and your Internet connection would have to be really fast. You are solely responsible for all Internet access charges, where applicable. Please check with your Internet provider for information on possible Internet data usage charges. Movie Store will not be held accountable or hold any promises (pinky swears included) for the quality of your watching experience on your display. The time it takes to begin watching a piece of content will vary based on a number of factors, including your location, available bandwidth at the time, the content you have selected, the configuration of your Movie Store -approved device and how nice you are to your device. We try to give compliments to our machines at least once a day here at Movie Store. It works, REALLY.
                                                    The streaming software that we use is developed in a top-secret facility by parties that will not be named and is designed to enable streaming of content from Movie Store through Movie Store-approved devices. Everything from the software to functionalities may vary by device and medium. Meaning, nothing will totally, 100% look similar across the different users. By using Movie Store, you acknowledge and agree to the End User License Agreement and to receive, without further notice or prompting, updated versions of Movie Store and related third-party software. If you do not accept the foregoing terms, do not use our service. Or just accept them and use it. We do not take responsibility or otherwise warrant the performance of these devices, including the continuing compatibility of the device with our service. This is something you’ll need to take up with your device provider. By using our service, you agree to only bug the entity that manufactured and/or sold you the device for any issues related to the device and its compatibility with the Movie Store service. If your Movie Store-approved device is sold, lost or stolen (sorry to hear that), please call the police, tell your friends to re-add you on your instant messenger of choice and deactivate the Movie Store-approved device. If you fail to log out of your device, subsequent users may access and take advantage of the Movie Store service through your account and may be able to access certain of your account information or see just how many romantic movies you watched last weekend. Yup, no questions asked.
                                                    These very legal sounding documents were created for a reason. So please take note that we may terminate or restrict your use of our service, without compensation or notice if you are, or if we suspect that you are (i) in violation of any of these Terms of Use or (ii) engaged in illegal or improper use of the service. But we really don’t like to do so, so please, play nice, okay?
                                                    If you are fearful for the innocence of your younger family members, particularly when it comes to stuff they watch on Movie Store, you may limit the maturity level of content titles viewable (e.g. available for their children) with our Parental Control feature, which is accessible from the "Settings" page on the Movie Store website. We take no responsibility for members’ maturity levels in general.
                                                </p>
                                                <h3><u>7. Accessing And Controlling Your Account</u></h3>
                                                <p>
                                                    The Account Owner AKA the person footing the bill (whose Payment Method is charged) AKA the member who created the Movie Store account has access and control over the Movie Store account… OBVIOUSLY. The way said Account Owner controls the account is exercised through use of the Account Owner's mighty password and therefore to maintain exclusive control, the Account Owner should not reveal the password to anyone, not even your BFFs. In addition, if the Account Owner wishes to prohibit others from contacting Movie Store and potentially altering the Account Owner's control, the Account Owner should not reveal their email address associated with their account, even if it might be easy to guess. You are responsible for updating and maintaining the truth, the whole truth and nothing but the truth and accuracy of the information you provide to us relating to your account.
                                                    Identity theft is a real thing. So you should be mindful of any communication requesting that you submit credit card or other account information. If you’re not sure, get in touch and we’ll tell you if it’s legit or not. Providing your information in response to these types of communications can result in identity theft and has been sometimes called “Phishing”, in what is a decidedly cool sounding name for a decidedly dastardly practice. Always access your sensitive account information by going directly to the Movie Store website and not through a hyperlink in an email or any other electronic communication, even if it looks official. Movie Store reserves the right to self-defense and place any account on hold anytime with or without notification to the member in order to protect itself and its partners from what it believes to be fraudulent activity. Movie Store is not obligated to credit or discount a membership for holds placed on the account by either a representative of Movie Store or by the automated processes of Movie Store.
                                                    Further to the impersonation issue and also in order to make it a breeze for you to access your account as well as to help administer the Movie Store service, Movie Store may implement technology that enables us to recognize you as the Account Owner and provide you with direct access to your account without requiring you to retype any password or other user identification when you revisit the Movie Store service, which may include accessing via Movie Store-approved devices or website. We are experimenting with retina scans, voice identification and secret handshakes. Who knows where we will end up?
                                                </p>
                                                <h3><u>8. Social Terms</u></h3>
                                                <p>
                                                    You may choose to sign up for an Movie Store account using Facebook. To unlink your account from Facebook, please contact support@Movie Store.com. Please be aware that by choosing to connect your Movie Store account to social media sites, including Facebook or to use our social features, you are agreeing to these social terms ("Social Terms") and are consenting to the collection, use and sharing of information about you with us and others, such as your name, location and contact information, birthdate, gender, and other information.
                                                </p>
                                                <h3><u>9. General Disclaimer of Warranties And Limitations.</u></h3>
                                                <p>Covering our butts: We are not perfect. To the fullest extent permitted by applicable law, we endeavor to provide the best service we can. Movie Store and all content and software associated with the service, or any other features or functionalities associated with us, are provided "as is" with all faults and without warranty of any kind. There will be no guarantees to represent, or warrant that your use of Movie Store will be uninterrupted or error-free. Movie Store specifically disclaims liability for the use of applications, Movie Store-approved devices, and Movie Store software (including their continuing compatibility with our service). Phew!!
                                                    To the extent permissible under applicable laws, in no event shall Movie Store, or its subsidiaries or any of their shareholders, directors, officers, employees or licensors be liable (jointly or severally) to you for personal injury or any special, incidental, indirect or consequential damages of any kind, or any damages whatsoever. Double phew!
                                                    Some jurisdictions do not allow the exclusion of certain warranties or the limitation or exclusion of liability for certain types of damages. Therefore, some of the above limitations in this section may not apply to you. In which case, you can ignore everything above, lucky you.
                                                    Nothing in these Agreements removes or limits Movie Store’s liability for fraud, fraudulent misrepresentation, death or personal injury caused by its negligence. If any provision or provisions of these Terms of Use shall be held to be invalid, illegal, or unenforceable, the validity, legality and enforceability of the remaining provisions shall remain in full force and effect. Some aspects of this section may not apply in some jurisdictions.
                                                </p>
                                                <h3><u>10. Promotions</u></h3>
                                                <p>
                                                    From time to time, Movie Store may introduce special offers, rewards, vouchers, gift certificates, payment plans and Trial Memberships, which may be subject to specific terms and conditions. You might get your hands on one of these and that would please us greatly.
                                                </p>
                                                <h3><u>11. Copyright Infringements</u></h3>
                                                <p>
                                                    Copyright. Iflix respects the rights of intellectual property owners. And in this case, OURS. The Movie Store service, including all content provided on the Movie Store service, and all Movie Store interfaces created for devices including text, graphics, logos, designs, photographs, button icons, images, audio/video clips, digital downloads, data compilations and software and its compilation is the property of Movie Store or its suppliers and is protected by copyright, trade secret or other intellectual property laws and treaties.
                                                    Trademarks. Movie Store is a registered trademark of Movie Store Pte Ltd.
                                                    Claims of Copyright Infringement. If for whatever reason you believe your work has been reproduced or distributed in a way that constitutes copyright infringement or are aware of any infringing material available through the Movie Store service, please notify us by sending an email to legal@Movie Store.com.
                                                </p>
                                                <h3><u>12. How We Use The Information You Give Us</u></h3>
                                                <p>
                                                    Bear with us, people, for what is about to happen to this Terms of Use is extremely uncomfortable for anyone who appreciates fun or finds no friends in too many words. But it’s important, so let’s buckle up and get through it as best we can. Movie Store is free as a bird to use anything you’ve submitted to us in the form of comments, complaints, compliments, reviews, information, ideas or techniques or any other material contained in any communication you may send to us (let’s call it "Feedback"), including responses to questionnaires or through postings to the Movie Store service, including the Movie Store website and user interfaces, worldwide and in perpetuity without further compensation, acknowledgement or payment to you for any purpose whatsoever including, but not limited to, developing, manufacturing and marketing products and creating, modifying or improving the Movie Store service. In addition, you agree not to enforce any "moral rights" in and to the Feedback, to the extent permitted by applicable law. You should, however, have the right morals, lest your parents be ashamed. Please note Movie Store does not accept unsolicited materials or ideas for any content whatsoever, and is not responsible for the similarity of any of its content or programming in any media to materials or ideas transmitted to Movie Store. Should you send any unsolicited materials or ideas, you do so with the understanding that no additional consideration of any sort will be provided to you, and you are waiving any claim against Movie Store and its affiliates regarding the use of such materials and ideas, even if material or an idea is used that is substantially similar to the material or idea you sent.
                                                    And that, thankfully, is that.
                                                </p>
                                                <h3><u>13. Choice of Law</u></h3>
                                                <p>These Terms of Use shall be governed by and construed in accordance with the laws of Singapore without regard to conflict of laws or provisions.
                                                    You may also be entitled to certain consumer protection rights under the laws of your local jurisdiction. You may also be entitled to a pat on the back for all your hard work and good looks.
                                                </p>
                                                <h3><u>14. Customer Support</u></h3>
                                                <p>
                                                    Being supportive to our Customers is very important to us. If you need help with your account or anything Movie Store related, please email support@Movie Store.com . In case there are any conflicts arising from miscommunications between these Terms of Use and information provided by Customer Support or other portions of our website, these Terms of Use will reign supreme. Our Customer Support team is like a wily aunt with all the answers and none of the awkward judgment. Feel free to say hi to them at any time.
                                                </p>
                                                <h3><u>15. Links</u></h3>
                                                <p>
                                                    Some of the hyperlinks provided through the Movie Store service may lead to other websites or interfaces that are not controlled by or affiliated with Movie Store. In general, that’s what hyperlinks do. It is a rabbit hole. In addition, other websites or interfaces may link to the Movie Store service, and for that we thank them. But Movie Store has not reviewed such websites or interfaces and is not responsible for their content or privacy policies.
                                                </p>
                                                <h3><u>16. Arbitration Clause</u></h3>
                                                <p>No one wants to fight, but if that happens, you and Movie Store agree that any dispute, claim or controversy arising out of or relating in any way to the Movie Store service, these Terms of Use and this Arbitration Agreement, shall be determined by binding arbitration in Singapore in accordance with the Arbitration Rules of the Singapore International Arbitration Centre (“SAIC Rules”) for the time being in force, which rules are deemed to be incorporated by reference in this Arbitration Agreement, or in small claims court in Singapore. Or, Movie Store may decide in its sole discretion to resolve any disputes by way of dance off in a very public forum. Arbitration is more informal than a lawsuit in court. Dance offs are more informal than Arbitration. Arbitration uses neutral arbitrators instead of a judge or jury, allows for more limited discovery than in court, and is subject to very limited review by courts. Arbitrators can award the same damages and relief that a court can award. Dance offs have no rules but the rules of the groove. You agree that, by agreeing to these Terms of Use, that any dispute arising out of or in connection with these Terms of Use shall be referred to and finally resolved, and that you and Movie Store are each waiving the right to a trial by jury or to participate in a class action. This arbitration provision shall survive termination of this Agreement and the termination of your Movie Store membership. Your reputation may never survive a dance off defeat at our hands. You have been warned.
                                                    If push comes to shove and a standoff is in order, you and Movie Store agree that each may bring claims against the other only in your or its individual capacity, and not as a plaintiff or class member in any purported class or representative proceeding. Further, unless both you and Movie Store agree otherwise, the arbitrator may not consolidate more than one person's claims with your claims, and may not otherwise preside over any form of a representative or class proceeding. If this specific provision is found to be unenforceable, then the entirety of this arbitration provision shall be null and void. The arbitrator may award declaratory or injunctive relief only in favor of the individual party seeking relief and only to the extent necessary to provide relief warranted by that party's individual claim. The arbitrator is almost Optimus Prime.
                                                </p>
                                                <h3><u>17. Entire Agreement</u></h3>
                                                <p>These Terms of Use constitute all the terms and conditions agreed upon between you and Movie Store and supersede any prior agreements in relation to the subject matter of these Terms of Use, whether written or oral. Your preference may be for oral and that’s fine. We understand that preference oh so well. Save as mutually agreed by the parties, any additional or different terms or conditions in relation to the subject matter of the Terms of Use in any written or oral communication from you to Movie Store are void. You represent that you have not accepted the Terms of Use in reliance on any oral or written representations made by Movie Store that are not contained in the Agreements.
                                                    Please note, however, that other aspects of your use of the Movie Store service may be governed by additional agreements
                                                    Occasionally we may offer you the chance to participate in sweepstakes. We believe they come from the 80s. We may also offer you the chance to participate in contests, and surveys (“Special Promotions”) through the Movie Store service. Special Promotions may be governed by terms and conditions that are separate from these Terms. If the provisions of a Special Promotion’s terms and conditions conflict with these Terms, those separate terms and conditions shall prevail.
                                                </p>
                                                <h3><u>18. Severability</u></h3>
                                                <p>
                                                    Should any provision of the Terms be held invalid or unenforceable for any reason or to any extent, such invalidity or enforceability shall not in any manner affect or render the validity, legality and enforceability of the remaining provisions that shall remain in full force and effect. And you thought severability involved a mountaineer, a canyon in Utah, 127 hours and a pocketknife.
                                                </p>
                                                <h3><u>19.	Contacting Us</u></h3>
                                                <p>
                                                    For questions specifically concerning this Terms of Use, please contact us via email at support@Movie Store.com. Alternatively, if you’d like to send us physical mail, you can do so and forward it to The Playground at this address:
                                                    27-7 The Boulevard, Mid Valley City 59200, Kuala Lumpur, Malaysia. Attention: Legal Counsel.
                                                </p>
                                            </div>
                                            <div align="center">
                                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
