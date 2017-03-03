<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Edit Profile</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-pencil-square-o"></i> Edit Profile : </h1>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12 div-blog">
                                                    <div class="div-header">
                                                        <h2><i class="fa fa-bars"></i> Menu</h2>
                                                    </div>
                                                    <ul class="nav nav-pills nav-stacked" style="background-color: #F7F7F7">
                                                        <li role="presentation">
                                                            <a href="userPanel">
                                                                <i class="fa fa-user"></i> My Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="active">
                                                            <a href="updateProfile">
                                                                <i class="fa fa-pencil-square-o"></i> Edit Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="editPassword">
                                                                <i class="fa fa-lock"></i> Change Password
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="myMovie">
                                                                <i class="fa fa-film"></i> My Movie
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="wishList">
                                                                <i class="fa fa-heart"></i> Wish list
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <form class="form-horizontal" role="form" action="updateProfile" method="post">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                    </label>
                                                    <div class="col-sm-6" style="color: red">
                                                        ${msg}
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        First Name
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="fname" placeholder="${user.getFname()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Last Name
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="lname" placeholder="${user.getLname()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Gender
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <select name="gender" class="form-control">
                                                            <option value="M" ${user.getGender()=='M'?"selected":""}>Male</option>
                                                            <option value="F" ${user.getGender()=='F'?"selected":""}>Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Email
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="email" class="form-control" name="email"  placeholder="${user.getEmail()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Date of birth
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" onfocus="(this.type = 'date')" class="form-control" name="DOB"  placeholder="${user.getDOB()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Phone
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="phone"  placeholder="${user.getPhone()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Address Line 1
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="addressline1"  placeholder="${user.getAddressline1()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Address Line 2
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="addressline2" placeholder="${user.getAddressline2()}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        City
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="city" placeholder="${user.getCity()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        State
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="state" placeholder="${user.getState()}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Zip
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input  type="text" class="form-control" name="zip" placeholder="${user.getZip()}" />
                                                    </div>
                                                </div>
                                                <hr>
                                                <h2>Confirm Password : </h2>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Password
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input type="password" class="form-control" name="password"/>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="form-group">
                                                    <div class="center">
                                                        <input type="submit" class="btn btn-danger btn-lg" value="Edit">
                                                    </div>
                                                </div>
                                            </form>
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
