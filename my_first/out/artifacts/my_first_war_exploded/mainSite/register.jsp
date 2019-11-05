
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JavaEE作业</title>
    <link href="static/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-grid.css" rel="stylesheet">
    <link href="static/css/bootstrap-grid.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-grid.min.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.css" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.min.css.map" rel="stylesheet">
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/bootstrap.css.map" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css.map" rel="stylesheet">

    <style>
        tr{
            border:0px#ccc;
        }
        td{
            overflow: hidden;
            height: 5px;
        }
        h6{
            font-size: 10px;
            color:#F40004;
        }
    </style>
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap-grid.min.js"></script>
    <script>
        $('.dropdown-toggle').dropdown();

        var rg_status = false;
        function checkAll(){
            var str = document.getElementById('name').value;
            showResult(str);
            checkPwd();
            checkPassword();
            checkEmail();

        }

        function showResult(str){
            var check1 = document.getElementById('check1');
            if(str != ""){
                document.getElementById('icheck1').innerHTML="";
                var check = new Array();
                check ="" ;
                var rst = check.indexOf(str);
                if (rst > -1){
                    check1.src="static/img/wrong.png";
                    check1.style.display="block";
                    document.getElementById('icheck1').innerHTML="用户名重复！";
                    rg_status=false;

                }else{
                    check1.style.display="block";
                    check1.src="static/img/correct.png";
                    document.getElementById('icheck1').innerHTML="";
                    rg_status=true;
                }
            }else{
                document.getElementById('icheck1').innerHTML="不能为空!";
                check1.src="static/img/wrong.png";
                check1.style.display="block";
                rg_status=false;
            }

        }

        function checkPwd(){
            var newPwd = document.getElementById('newPwd').value;
            var oldPwd = document.getElementById('oldPwd').value;
            var check3 = document.getElementById('check3');
            if (newPwd != ""){
                if (oldPwd != newPwd){
                    check3.src="static/img/wrong.png";
                    document.getElementById('icheck3').innerHTML="两次密码不一致";
                    check3.style.display="block";
                    rg_status=false;
                }
                if (oldPwd == newPwd){
                    check3.style.display="block";
                    document.getElementById('icheck3').innerHTML="";
                    check3.src="static/img/correct.png";
                    rg_status=true;
                }
            }else{
                check3.src="static/img/wrong.png";
                document.getElementById('icheck3').innerHTML="不能为空!";
                check3.style.display="block";
                rg_status=false;

            }


        }

        function checkPassword(){
            var check2 = document.getElementById('check2');
            var password=document.getElementById('oldPwd').value;
            var reg=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{8,15}$/;
            var f = reg.test(password);
            if(password != ""){
                if(f==false){
                    check2.src="static/img/wrong.png";
                    check2.style.display="block";
                    document.getElementById('icheck2').innerHTML="密码必须拥有大小写字符并且为8位！";
                    rg_status=false;
                }else{
                    check2.style.display="block";
                    check2.src="static/img/correct.png";
                    document.getElementById('icheck2').innerHTML="";
                    rg_status=true;
                }
            }else{
                check2.src="static/img/wrong.png";
                check2.style.display="block";
                document.getElementById('icheck2').innerHTML="不能为空!";
                rg_status=false;
            }
        }

        function checkEmail(){
            var check4 = document.getElementById('check4');
            var emailVal=document.getElementById('emailVal').value;
            var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            var f = reg.test(emailVal);
            if(emailVal != ""){
                if(f==false){
                    check4.src="static/img/wrong.png";
                    check4.style.display="block";
                    document.getElementById('icheck4').innerHTML="请输入合法的邮箱地址!";
                    rg_status=false;
                }else{
                    check4.style.display="block";
                    check4.src="static/img/correct.png";
                    document.getElementById('icheck4').innerHTML="";
                    rg_status=true;
                }
            }else{
                check4.src="static/img/wrong.png";
                check4.style.display="block";
                document.getElementById('icheck4').innerHTML="不能为空!";
                rg_status=false;
            }
        }


        function doSubmitForm(){
            var form = document.getElementById('login_form');
            checkAll();
            if(rg_status == true){
                form.submit();
            }else{
                alert('信息有误请重新填写！');
            }
        }
    </script>

</head>

<body style="background:#E9ECEF">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 8%">
    <a class="navbar-brand" href="#">中国乐游</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="main.jsp">主页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">联系我们</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    更多
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">加入我们</a>
                    <a class="dropdown-item" href="#">联系方式</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">开发者鸣谢</a>
                </div>
            </li>
            <!--
                         <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                         </li>
            -->
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="输入内容..." aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>
<div class="jumbotron jumbotron-fluid text-center">
    <img src="static/img/correct.png" style="display: none"/>
    <img src="static/img/wrong.png" style="display: none"/>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_CN/sdk.js#xfbml=1&version=v4.0"></script>
    <div class="jumbotron jumbotron-fluid text-center" style="height: 100%">
        <div class="container">
            <div class="row" style="position: relative;top:20px;">
                <div class="col-12">
                    <h2 class="tm-question-header" align="center">请注册一个用户</h2>
                    <div class="row">
                        <div class="col-12">
                        </div>
                    </div>

                    <form method="post" action="register-user.jsp" id="login_form">
                        <div align="center" height="75%">
                            <table width="19%" height="242" border="0">
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" placeholder="账号..." aria-describedby="basic-addon1" name="userId" id="id" onkeyup="">
                                    </td>
                                    <td>
                                        <img alt="" width="20" height="20" id="check0" style="display: none"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td  colspan="3" style="font-size: 5px"><h6></h6></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" placeholder="用户名..." aria-describedby="basic-addon1" name="userName" id="name" onkeyup="showResult(this.value)">
                                    </td>
                                    <td>
                                        <img alt="" width="20" height="20" id="check1" style="display: none"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td  colspan="3" style="font-size: 5px"><h6 id="icheck1"></h6></td>
                                </tr>
                                <tr>
                                    <td style="width: 93%">
                                        <input type="password" class="form-control" placeholder="密码..." aria-describedby="basic-addon1" name="userPwd" id="oldPwd" onkeyup="checkPassword()">
                                    </td>
                                    <td style="width: 7%">
                                        <img  width="20" height="20" id="check2" style="display: none"/>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="3" style="font-size: 5px;border:none; "><h6 id="icheck2"></h6></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" class="form-control" placeholder="确认密码..." aria-describedby="basic-addon1" id="newPwd" onkeyup="checkPwd()">
                                    </td>
                                    <td><img  width="20" height="20" id="check3" style="display:none"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-size: 5px"><h6 id="icheck3"></h6></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" placeholder="邮箱地址..." aria-describedby="basic-addon1" id="emailVal" onkeyup="checkEmail()" name="userEmail">
                                    </td>
                                    <td><img width="20" height="20" id="check4" style="display: none"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-size: 5px"><h6 id="icheck4"></h6></td>
                                </tr>
                            </table>
                        </div>
                    </form>

                    <br>

                    <div class="row">
                        <div class="col-12 text-center tm-submit-container col-xl-12">
                            <button type="button" class="btn btn-primary tm-btn-submit" onClick="doSubmitForm()">提交</button>

                        </div>
                    </div>
                </div>
            </div>

            <script src="static/js/jquery-3.3.1.min.js"></script>
            <script src="static/js/materialize.min.js"></script>
            <script>

                // Parallax function
                // https://codepen.io/roborich/pen/wpAsm
                var background_image_parallax = function ($object, multiplier) {
                    multiplier = typeof multiplier !== 'undefined' ? multiplier : 0.5;
                    multiplier = 1 - multiplier;
                    var $doc = $(document);
                    $object.css({ "background-attatchment": "fixed" });
                    $(window).scroll(function () {
                        var from_top = $doc.scrollTop(),
                            bg_css = 'center ' + (multiplier * from_top - 200) + 'px';
                        $object.css({ "background-position": bg_css });
                    });
                };

                /**
                 * detect IE
                 * returns version of IE or false, if browser is not Internet Explorer
                 */
                function detectIE() {
                    var ua = window.navigator.userAgent;

                    var msie = ua.indexOf('MSIE ');
                    if (msie > 0) {
                        // IE 10 or older => return version number
                        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
                    }

                    var trident = ua.indexOf('Trident/');
                    if (trident > 0) {
                        // IE 11 => return version number
                        var rv = ua.indexOf('rv:');
                        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
                    }

                    // var edge = ua.indexOf('Edge/');
                    // if (edge > 0) {
                    //     // Edge (IE 12+) => return version number
                    //     return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
                    // }

                    // other browser
                    return false;
                }

                $(document).ready(function () {

                    // Detect IE
                    if (detectIE()) {
                        alert('Please use the latest version of Chrome, Firefox, or Edge for best browsing experience.');
                    }

                    $('select').formSelect();
                    // Parallax image background
                    background_image_parallax($(".tm-parallax"), 0.40);

                    // Darken image when its radio button is selected
                    $(".tm-radio-group-1").click(function () {
                        $('.tm-radio-group-1').parent().siblings("img").removeClass("darken");
                        $(this).parent().siblings("img").addClass("darken");
                    });

                    $(".tm-radio-group-2").click(function () {
                        $('.tm-radio-group-2').parent().siblings("img").removeClass("darken");
                        $(this).parent().siblings("img").addClass("darken");
                    });

                    $(".tm-checkbox").click(function () {
                        $(this).parent().siblings("img").toggleClass("darken");
                    })
                });

                function getValue(){


                }
            </script>
        </div>
    </div>

</div>

</body>

</html>

