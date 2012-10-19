<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign path="${request.getContextPath()}">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>logon</title>
		
		<style type="text/css">
			div{
				margin: 10px;
				padding:10px;
				border:1px solid red;
			}
		</style>
		
	</head>
	<body>
		
		
		${path}
		<br>
			登录页面 
			<br />
			<div>
				<a href="${path}/FileUploadCtrl/showFileUploadCtrl.do">文件上传测试</a>
			</div>
			
			
			<div>
				<a href="${path}/FileUploadCtrl/showFileUploadCtrl2.do">文件上传测试2--更改按钮上的文字</a>
			</div>
			
			<div>
				<a href="${path}/FileUploadCtrl/showFileUploadCtrl3.do">文件上传测试3--精简配置-自定义触发事件</a>
			</div>
			
			<div>
				<a href="${path}/FileUploadCtrl/showFileUploadCtrl4.do">文件上传测试3--精简上一个-去掉进度提示</a>
			</div>
						
			
	</body>
</html>
