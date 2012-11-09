<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign path="${request.getContextPath()}">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目中正在使用的例子</title>

<link href="${path}/resource6/upload.css" rel="stylesheet" type="text/css" />
<script src="${path}/resource6/jquery-1.7.2.min.js"></script>
<script src="${path}/resource6/swfupload.js"></script>
<script src="${path}/resource6/swfupload.queue.js"></script>
<script src="${path}/resource6/fileprogress.js"></script>
<script src="${path}/resource6/handlers.js"></script>
<script src="${path}/resource6/hz_upload.js"></script>

<script type="text/javascript">

	var swfu_bizLicense; //bizLicense  营业执照副本
	$(document).ready(function(){
		
		createSwfFun();
				
	});
	function createSwfFun()
	{
		var fieldId = "${fileId}";
	   swfu_bizLicense = createSwf(fieldId, "bizLicense", "上传营业执照副本", $("#fileList_bizLicense"), "${path}", 120);
	}
	
	
</script>

</head>
<body>
	
		<div style="margin: 50px;">
		
		 <table>
			<tr><td colspan="2">测试</td></tr>
			<tr>
				<td>
					<!-- 上传营业执照副本   字段名是: bizLicense  -->
			        <div id="outdiv_bizLicense" class="divUpload">
					</div>
				</td>
				<td>
					<div id="fileList_bizLicense" class="divFileList">
					</div>
					<div id="porgress_bizLicense"></div>
				</td>
				
			</tr>
		</table>
			
		</div>
		
</body>
</html>