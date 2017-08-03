<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 1.默认主题文件 -->
<link rel="stylesheet" type="text/css"
	href="/exam_xubingbing/css/themes/black/easyui.css" />

<!-- 2.图标的样式文件 -->
<link rel="stylesheet" type="text/css"
	href="/exam_xubingbing/css/themes/icon.css" />

<!-- 第二部分：JavaScript库文件 -->
<!-- 1.jQuery的库文件——一定要比EasyUI的库文件先引入 -->
<script type="text/javascript" src="/exam_xubingbing/jQuery/jquery.min.js"></script>

<!-- 2.EasyUI的主体库文件 -->
<script type="text/javascript"
	src="/exam_xubingbing/jQuery/jquery.easyui.min.js"></script>

<!-- 3.本地化文件 -->
<script type="text/javascript"
	src="/exam_xubingbing/jQuery/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function() {
		
		$("#formWindow").window({
			onClose:function(){
				$("#phoneform").form("clear");
			}
		});

		$('#dg').datagrid({
			url : '/exam_xubingbing/pagelist',
			fitColumns : true,
			pagination:true,
			columns : [ [ {
				field : 'phoneId',
				title : '手机ID',
				width : 100
			}, {
				field : 'phoneName',
				title : '手机名称',
				width : 100
			},  {
				field : 'phonePrice',
				title : '手机价格',
				width : 100
			}, {
				field : 'phoneColor',
				title : '手机颜色',
				width : 100
			}] ],
			toolbar : [ {
				text : "编辑手机",
				iconCls : 'icon-edit',
				handler : function() {
					var selectedRow = $("#dg").datagrid("getSelected");
					
						if(selectedRow == null) {
		    			$.messager.alert("提示","请选中要编辑的手机？","info");
		    			} else{
		    				$("#formwindow").window("open");
				    		$("#phoneform").form({url:"/exam_xubingbing/update"}).form("load",selectedRow);
		    			}
				}
			}, '-', {
				text : "删除手机",
				iconCls : 'icon-remove',
				handler : function() {
					var selectedRow = $("#dg").datagrid("getSelected");
		    		console.log(selectedRow);
		    		
		    		if(selectedRow == null) {
		    			
		    			$.messager.alert("提示","请选中要删除的手机？","info");
		    			
		    		}else{
		    			
		    			$.messager.confirm("CRUD练习","你确定要删除这条信息吗！",function(result){
		    				if(result) {
		    					
		    					var phoneId = selectedRow.phoneId;
		    					
		    					$.post("/exam_xubingbing/delete/"+phoneId,function(){
		    						$("#dg").datagrid("reload");
		    						$.messager.show({
			    						title:'CRUD练习',
			    						msg:'再见，下辈子再续情缘！',
			    						timeout:2000,
			    						showType:'slide'
			    					});
		    					});
		    					
		    				}else{
		    					$.messager.show({
		    						title:'提示',
		    						msg:'谢谢不杀之恩！',
		    						timeout:3000,
		    						showType:'slide'
		    					});
		    				}
		    			});
		    			
		    		}
				}
			}, '-', {
				text : "添加手机",
				iconCls : 'icon-add',
				handler : function() {
					$("#formwindow").window("open");
					$("#phoneform").form({url:"/exam_xubingbing/save"});
					
				}
			} ],
			fit : true,
			singleSelect : true
		});
		
		$("#phonebtn").linkbutton({
			onClick : function() {

				$("#phoneform").form("submit", {
					onSubmit : function() {
						var isValid = $(this).form('validate');
						console.log(isValid)
						
						return isValid; // 返回false终止表单提交
					},
					success : function() {
						$("#formwindow").window("close");
						$.messager.alert('我的消息', '操作成功！', 'info');
						$("#phoneform").form("clear");
						$("#dg").datagrid("load")
					}
				});
			}
		});

	});
</script>
<title>SSM 增删改查</title>
</head>
<body>
	<table id="dg"></table>
	<div id="formwindow" class="easyui-window" data-options="closed:true"
		style="width: 300px; height: 200px; text-align: center;padding: 20px;">
		<form method="post" class="easyui-form" id="phoneform">
			<div>
			<input  type="hidden" name="phoneId" data-options="required:true" />
			</div>
			<div>
				<label for="name">手机名称:</label> <input class="easyui-validatebox"
					type="text" name="phoneName" data-options="required:true" />
			</div>
			
			<br />
			<div>
				<label for="name">手机价格:</label> <input class="easyui-validatebox"
					type="text" name="phonePrice" data-options="required:true" />
			</div>
			
			<br />
			<div>
				<label for="name">手机颜色:</label> <input class="easyui-validatebox"
					type="text" name="phoneColor" data-options="required:true" />
			</div>
			
			<a id="phonebtn" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'">保存</a>
		</form>
	</div>
</body>

</html>