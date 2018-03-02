<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/14 0014
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--三级联动插件-->
<!-- 引入bootstrap样式 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
<link href="css/bootstrap-select.css" rel="stylesheet"/>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<link href="css/city-picker.css" rel="stylesheet"/>
<!-- jquery -->
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- bootstrap-table.min.js -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="bootstrap/js/vue.min.js" ></script>

<script src="js/bootstrap-datetimepicker.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="js/city-picker.js"></script>
<script src="js/city-picker.data.js"></script>

<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/location.js"></script>
<script src="js/select2.js"></script>
<script src="js/select2_locale_zh-CN.js"></script>
<link href="css/common.css" rel="stylesheet"/>
<link href="css/select2.css" rel="stylesheet"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

<script type="text/javascript">
    function initTable() {
        //初始化表格,动态从服务器加载数据
        $("#cusTable").bootstrapTable({
            method: "get",  //使用get请求到服务器获取数据
            url: "/doctor/getsecondall.action", //获取数据的Servlet地址
            toolbar: '#toolbar',                //工具按钮用哪个容器
            pagination: true, //启动分页
            pageSize: 10,  //每页显示的记录数
            pageNumber:1, //当前第几页
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表
            search: false,  //是否启用查询
            showColumns: true,  //显示下拉框勾选要显示的列
            showRefresh: true,  //显示刷新按钮
            sidePagination: "server", //表示服务端请求
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "docotr_id",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
            //设置为limit可以获取limit, offset, search, sort, order
            queryParamsType : "undefined",
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize,
                    name : $("#txt_search_name").val(),
                     ksm : $("#txt_search_ks").val(),
                     sex : $("#txt_search_sex").val()
                };
                return param;
            },
            columns: [{
                checkbox: true
            }, {
                field: 'doctor_id',
                title: 'id'
            },{
                field: 'name',
                title: '名称'
            }, {
                field: 'ksm',
                title: '科室名'
            }, {
                field: 'sex',
                title: '性别'
            }, {
                field: 'birthday',
                title: '出生日期'
            }, {
                field: 'address',
                title: '地址'
            }, {
                field: 'sfz',
                title: '身份证'
            }, {
                field: 'phone',
                title: '电话'
            }, {
                field: 'ghfy',
                title: '挂号费用'
            }, {
                field: 'gzl',
                title: '工作量'
            }, {
                field: 'czsj',
                title: '出诊时间'
            }, {
                field: 'hyzt',
                title: '婚姻状态'
            }, {
                field: 'xl',
                title: '学历'
            }, {
                field: 'dqrs',
                title: '当前挂号人数'
            }, {
                field: 'isok',
                title: '是否还能挂号'
            },]

        });
    }

    $(document).ready(function () {
        //调用函数，初始化表格
        initTable();
        getschoolList();

        $("#btn_query1").bind("click", initTable);

    });


    $(function () {

        $("#birthday").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            todayHighlight: true,
            showMeridian: true,
            pickerPosition: "bottom-left",
            language: 'zh-CN',//中文，需要引用zh-CN.js包
            startView: 2,//月视图
            autoclose:true, //选择日期后自动关闭
            minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
        });
        $("#begintime").datetimepicker({
            format: 'hh:ii',
            startView:1,
            autoclose:true //选择日期后自动关闭
        });

        $('#endtime').datetimepicker({
            format: 'hh:ii',
            startView:1,
            autoclose:true //选择日期后自动关闭
        });


    });


    function getschoolList() {//获取下拉学校列表
        $.ajax({
            url: "/keshi/getKeshi.action",//写你自己的方法，返回map，我返回的map包含了两个属性：data：集合，total：集合记录数量，所以后边会有data.data的写法。。。
// 数据发送方式
            type: "get",
// 接受数据格式
            dataType: "json",
// 要传递的数据
            data: 'data',
// 回调函数，接受服务器端返回给客户端的值，即result值
            success: function (data) {
                $.each(data.data, function (i) {
                    $('#ks.selectpicker').append("<option value=" + data.data[i].kname + ">" + data.data[i].kname + "</option>");
                });
                $('#ks').selectpicker('refresh');
            },

        })
        $.ajax({
            url: "/keshi/getKeshi.action",//写你自己的方法，返回map，我返回的map包含了两个属性：data：集合，total：集合记录数量，所以后边会有data.data的写法。。。
// 数据发送方式
            type: "get",
// 接受数据格式
            dataType: "json",
// 要传递的数据
            data: 'data',
// 回调函数，接受服务器端返回给客户端的值，即result值
            success: function (data) {
                $('#txt_search_ks.selectpicker').append("<option value=>" +"请选择"+ "</option>");
                $.each(data.data, function (i) {
                    $('#txt_search_ks.selectpicker').append("<option value=" + data.data[i].kname + ">" + data.data[i].kname + "</option>");
                });
                $('#txt_search_ks').selectpicker('refresh');
            },

        })
    }

    //删除：
    function deldoctor(){
        $("#deleteDataModal").modal("hide");
        //删除
            var row=$.map($("#cusTable").bootstrapTable('getSelections'),function(row){
                return row ;
            });
            var ids=[];
            for (var i = 0; i < row.length; i++) {
                //获取自定义table 的中的checkbox值
                var id=row[i].doctor_id;   //OTRECORDID这个是你要在列表中取的单个id
                ids.push(id); //然后把单个id循环放到ids的数组中
            }
            var str=JSON.stringify(ids);
            //批量删除：
            $.ajax({
                type:"POST",
                url:"/doctor/deldoctor.action",
                data:"str="+str,
                success:function(msg){
                    if(msg==1){
                        $('#cusTable').bootstrapTable('refresh');
                    }else{
                        alert("删除失败！");
                    }
                }
            });
    }


</script>



<div class="panel-body" style="padding-bottom:0px;">

    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="txt_search_name">姓名</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_name">
                    </div>
                    <label class="control-label col-sm-1" for="txt_search_sex">性别</label>
                    <div class="col-sm-3">
                        <select id="txt_search_sex"  name="txt_search_sex" style="width:100px;">
                            <option value="">请选择</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <label class="control-label col-sm-1" for="txt_search_ks">科室</label>
                    <div class="col-sm-3">
                        <select style="width:150px" id="txt_search_ks"  name="txt_search_ks" class="selectpicker" ></select>
                    </div>km
                </div>
            </form>
        </div>
    </div>

<table class="table table-hover" id="cusTable">
</table>
</div>

<div class="container">

    <button type="button" class="btn btn-primary" v-on:click="addmodalshow">添加</button>
    <button type="button" class="btn btn-primary" v-on:click="deletemodeshow">删除</button>
    <button type="button" class="btn btn-primary" v-on:click="updatemodalshow">修改</button>  <br/>
    <!-- 删除模态框 -->
    <div class="modal fade" id="deleteDataModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">删除数据</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    您确定要删除这一条数据吗？
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="deldoctor()">删除</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

<!--增加模态框 -->
<div class="modal fade" id="DataModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">{{ titleName }}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
                <div style="padding-top:10px;padding-right:20px;padding-left: 20px">
                    医师姓名&nbsp;&nbsp;&nbsp;&nbsp;：<input  style="width: 100px" id="name" name="name" />
                    <div style="float:right ">
                        所属科室： &nbsp;<select style="width:150px" id="ks" name="ks" class="selectpicker" ></select>
                    </div>
                </div><br>

                <div style="padding-right:20px;margin-top:20px;padding-left: 20px">
                    性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<select id="sex"  name="sex" style="width:100px;">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                    <div style="float:right ">
                        身份证：&nbsp; <input id="sfz" name="sfz"  style="width:150px"/>
                    </div>
                </div><br>

                <div  style="padding-right:20px;margin-top20:px; padding-left: 20px">
                   出生日期： <input id="birthday"  style="width: 100px" >
                    <div style="float:right ">
                        电话：&nbsp; <input id="phone" name="phone"  style="width:150px"/>
                    </div>
                </div><br>

                <div  style="padding-right:20px;margin-top20:px; padding-left: 20px">
                    省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<select id="loc_province" style="width:150px;">
                </select>
                    <div style="float:right ">
                       市&nbsp;&nbsp;： <select id="loc_city" style="width:150px; margin-left: 10px">
                        </select>
                    </div>
                </div><br>

                <div style="padding-right:20px;margin-top20:px; padding-left: 20px">
                    区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;： <select id="loc_town" style="width:150px;margin-left: 10px">
                </select>
                    <div style="float:right ">
                        详细地址：&nbsp; <input id="xiangxi" name="xiangxi"  style="width:150px"/>
                    </div>
                </div><br>
                <div style="padding-right:20px;margin-top:20px; padding-left: 20px">
                    挂号费用&nbsp;&nbsp;&nbsp;&nbsp;：<input id="ghfy" name="ghfy"  style="width:150px"/>
                    <div style="float:right ">
                        工作量/天：&nbsp; <input id="gzl" name="gzl"  style="width:150px"/>
                    </div>
                </div><br>

                <div style="padding-right:20px;margin-top:20px; padding-left: 20px">
                    出诊时间开始： <input id="begintime"  style="width: 150px" >
                    <div style="float:right ">
                        出诊结束时间：&nbsp; <input id="endtime" name="endtime"  style="width:150px"/>
                    </div>
                </div><br>

                <div style="padding-right:20px;margin-top:20px; padding-left: 20px">
                    婚姻状态&nbsp;&nbsp;&nbsp;&nbsp;：<select id="hyzt"  name="hyzt" style="width:100px;">
                    <option value="已婚">已婚</option>
                    <option value="未婚">未婚</option>
                </select>
                    <div style="float:right ">
                        学历：&nbsp;<select id="xl"  name="xl" style="width:100px;">
                        <option value="中专">中专</option>
                        <option value="大专">大专</option>
                        <option value="本科">本科</option>
                        <option value="研究生">研究生</option>
                        <option value="博士及以上">博士及以上</option>
                    </select>
                    </div>
                </div><br>
                <div style="padding-right:20px;margin-top:20px; padding-left: 20px">
                    当前挂号人数：<input id="dqrs" name="dqrs"  style="width:150px"/>
                    <div style="float:right ">
                        是否可继续挂号：&nbsp;<select id="isok"  name="isok" style="width:100px;">
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                    </div>
                </div><br>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button"  v-on:click="addandupdateuser">确定</button>
                <button type="button"  data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>












    　　　
</div>






<script>
   var submiturl;
    // 声明vue对象
    var vm = new Vue({
        el:'.container',
        data:{
            person:"",
            users:[],
            titleName:"",
            pid : "",
            url1:""
        },
        methods:{
            //删除
            deletemodeshow : function (id) {
                this.pid=id;
                $("#deleteDataModal").modal("show");
            },
            //增加
            addmodalshow : function () {
                var _this = this ;
                _this.titleName="增加";
                submiturl = "/doctor/addone.action";
                $("#DataModal").modal("show");
            },
            //修改
            updatemodalshow : function () {
                var row=$.map($("#cusTable").bootstrapTable('getSelections'),function(row){
                    return row ;
                });
                if(row.length==1){
                    for (var i = 0; i < row.length; i++) {
                        //打开弹出框：
                        var _this = this ;
                        _this.titleName="修改";
                        $('#ksm').val(row[i].ksm);
                        $('#name').val(row[i].name);
                        $('#sex').val(row[i].sex);
                        $('#sfz').val(row[i].sfz);
                        $('#birthday').val(row[i].birthday);
                        $('#phone').val(row[i].phone);
                        //地址：省市区：
                        var citys=[];
                        citys=row[i].address.split("-");
                        $('#loc_province').val(citys[0]);
                        $('#loc_city').val(citys[1]);
                        $('#loc_town').val(citys[2]);
                        $('#xiangxi').val(citys[3]);

                        $('#ghfy').val(row[i].ghfy);
                        $('#gzl').val(row[i].gzl);
                        //开始时间 结束时间
                        var times=[];
                        citys=row[i].czsj.split("-");
                        $('#begintime').val(citys[0]);
                        $('#endtime').val(citys[1]);
                        $('#hyzt').val(row[i].hyzt);
                        $('#xl').val(row[i].xl);
                        $('#dqrs').val(row[i].dqrs);
                        $('#isko').val(row[i].isok);

                        submiturl="/doctor/updateone.action?doctor_id="+row[i].doctor_id;
                        $("#DataModal").modal("show");
                    }
                }
            },
            addandupdateuser : function () {
                var name=$('#name').val();
                var ks=$('#ks').val();
                var sex=$('#sex').val();
                var sfz=$('#sfz').val();
                var birthday=$('#birthday').val();
                var phone=$('#phone').val();
                //省市区：
                var a=$('#loc_province').select2('data').text;
                var b= $('#loc_city').select2('data').text;
                var c=$('#loc_town').select2('data').text;
                //详细地址：
                var xiangxi=$('#xiangxi').val();
                var address=a+"-"+b+"-"+c+"-"+xiangxi;
                var ghfy=$('#ghfy').val();
                var gzl=$('#gzl').val();
                //开始时间与结束时间
                var begintime=$('#begintime').val();
                var endtime=$('#endtime').val();
                var czsj=begintime+"-"+endtime;
                var hyzt=$('#hyzt').val();
                var xl=$('#xl').val();
                var dqrs=$('#dqrs').val();
                var isok=$('#isok').val();
                //实例化一个对象：
                var doctor={"name":name,"ksm":ks,"sex":sex,"sfz":sfz,"phone":phone,"birthday":birthday,"address":address,"ghfy":ghfy,"gzl":gzl,"czsj":czsj,"hyzt":hyzt,"xl":xl,"dqrs":dqrs,"isok":isok};
                //将对象转换成字符串
                var str=JSON.stringify(doctor);
               // alert(str);
                console.info(submiturl);
                $.ajax({
                    type:"POST",
                    url:submiturl,
                    data:"str="+str,
                    success:function(msg){
                        if(msg==1){
                            $("#DataModal").modal("hide");
                            $('#cusTable').bootstrapTable('refresh');
                        }else{
                            alert('失败');
                        }
                    }

                });


            }
        }
    });

</script>


</body>
</html>
