<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/26 0026
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/area.js"></script>
    <script type="text/javascript" src="js/location.js"></script>
    <script src="js/select2.js"></script>
    <script src="js/select2_locale_zh-CN.js"></script>
    <link href="css/common.css" rel="stylesheet"/>
    <link href="css/select2.css" rel="stylesheet"/>
</head>
<body>
<script type="text/javascript">

    function mya() {

       // alert($('#loc_province').select2('data').text + ' - ' + $('#loc_city').select2('data').text + ' - ' +  $('#loc_town').select2('data').text)

        var a=$('#loc_province').select2('data').text;
        var b= $('#loc_city').select2('data').text;
        var c=$('#loc_town').select2('data').text;

        alert(a+","+b+","+c);

    }

</script>

        <select id="loc_province" style="width:120px;">
        </select>
        <select id="loc_city" style="width:120px; margin-left: 10px">
        </select>
        <select id="loc_town" style="width:120px;margin-left: 10px">
        </select>
        <br>
        <input type="button" onclick="mya()" value="得到值">

</body>
</html>
