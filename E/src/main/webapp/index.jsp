<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bootstrap布局</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.addtabs.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.addtabs.js"></script>
<%----%>
	<link rel="icon" type="image/png" href="assets/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="assets/css/admin.css">

</head>
<body>
<%--导航栏--%>
   <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid " style="background:#F8F8F8">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" style="color:#000000">北京协和医院系统</a>
    </div>
    <div class="collapse navbar-collapse "  id="example-navbar-collapse"  style="float: right">
		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
			<li class="am-dropdown" data-am-dropdown>
				<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
					<span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
				</a>
				<ul class="am-dropdown-content">
					<li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
					<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
					<li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
		</ul>
    </div>
    </div>
</nav>

	<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-2 column">
			<div class="panel-group" id="panel-48530">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-136855"><span class="glyphicon glyphicon-folder-open"></span>  门诊管理</a>
					</div>
					
					<div id="panel-element-136855" class="panel-collapse collapse in">
						 <ul class="list-group">                                       
                                <a class="list-group-item" data-addtab="caidan"  data-url="doctor.jsp">
                                    <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            医师信息管理
                                </a>
                                <a class="list-group-item" data-addtab="user" data-content="Custonize the conten" data-url="example/ajax/mailbox.txt">
                                     <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            用户管理
                                </a>
                                <a class="list-group-item" data-addtab="juese" data-content="Custonize the conten" data-url="example/ajax/mailbox.txt">
                                     <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            角色管理
                                </a>
                                <a class="list-group-item" data-addtab="shuju" data-content="Custonize the conten" data-url="example/ajax/mailbox.txt">
                                     <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            数据字典
                                </a>
                                <a class="list-group-item" data-addtab="canshu" data-content="Custonize the conten" data-url="example/ajax/mailbox.txt">
                                     <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            系统参数
                                </a>
                                <a class="list-group-item" data-addtab="caozuo" data-content="Custonize the conten" data-url="example/ajax/mailbox.txt">
                                     <i class="glyphicon glyphicon-bullhorn"></i>
                                                                                            操作日志
                                </a>        
                         </ul>
					
					</div>
					
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element"><span class="glyphicon glyphicon-folder-open"></span>  内容管理</a>
					</div>
					<div id="panel-element" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-6"><span class="glyphicon glyphicon-folder-open"></span>  商品管理</a>
					</div>
					<div id="panel-element-6" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-62"><span class="glyphicon glyphicon-folder-open"></span>  订单管理</a>
					</div>
					<div id="panel-element-62" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-624"><span class="glyphicon glyphicon-folder-open"></span>  广告管理</a>
					</div>
					<div id="panel-element-624" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-6247"><span class="glyphicon glyphicon-folder-open"></span>  报表中心</a>
					</div>
					<div id="panel-element-6247" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-48530" href="#panel-element-62472"><span class="glyphicon glyphicon-folder-open"></span>  系统设置</a>
					</div>
					<div id="panel-element-62472" class="panel-collapse collapse">
						<div class="panel-body"></div>
					</div>
				</div>
				
				
				
				
			</div>
		</div>
		
		<div class="col-md-10 column">
			 <div class="tabbable" id="tabs-825455">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a class="active" data-toggle="tab">首页</a>
					</li>
					
				</ul>
				<div class="tab-content">
					
				</div>
			</div>

			
			
			
			
		</div>
		
	</div>
</div>

<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>

</body>
</html>