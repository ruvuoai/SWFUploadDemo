<!DOCTYPE HTML>
<#assign path="${request.getContextPath()}">
<title>SWFUpload Demos - Simple Demo</title>
<link type="text/css" rel="stylesheet" href="${path}/resource3/default.css">
<script src="${path}/resource3/swfupload.js" ></script>
<script src="${path}/resource3/swfupload.queue.js" ></script>
<script src="${path}/resource3/fileprogress.js" ></script>
<script src="${path}/resource3/handlers.js" ></script>
<script type="text/javascript">
		var swfu;
		
		window.onload = function() {
			var settings = {
				flash_url : "${path}/resource3/swfupload.swf",
				upload_url: "${path}/FileUploadCtrl/doupload.do",
				post_params : {
							"requestid" : "123", 
							"fieldName":"photo"  
				},
				file_types : "*.*",
				file_types_description : "所有文件",
 				custom_settings : {
					progressTarget : "fsUploadProgress",
					cancelButtonId : "btnCancel",
					divStatus:"divStatus"
				},
		 		
				// Button settings
				button_image_url: "${path}/resource3/TestImageNoText_65x29.png",
				button_width: "65",
				button_height: "29",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '<span class="theFont">上传...</span>',
				button_text_style: ".theFont {width:50px; height:25px; font-size:12px; text-align:center;vertical-align: middle; font-family:'微软雅黑', ''黑体; color:#1c527a; }}",
				button_text_left_padding: 12,
				button_text_top_padding: 3,
				
				//触发事件
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart_, //单个文件上传开始
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete_,//单个文件上传over
				queue_complete_handler : queueComplete	// 队列上传over
				
			};
			swfu = new SWFUpload(settings);
};


//开始上传[这里只是开始上传的一个提示，真正处理在其他地方]
function uploadStart_(file) {
	alert(file.name+"文件开始上传");
	
	//try {
		//var progress = new FileProgress(file, this.customSettings.progressTarget);
		//progress.setStatus("Uploading...");
		//progress.toggleCancel(true, this);
	//}
	//catch (ex) {}
	return true;
}

//上传完成 
function uploadComplete_(file) {
	alert(file.name+"文件上传完成");
	
	//待上传队列是否为0,[是否已经全部上传完毕]
	if (this.getStats().files_queued === 0) 
	{
		alert("全部完成了");
		//document.getElementById(this.customSettings.cancelButtonId).disabled = true;
		//上传完成后，再次点击上传可以如果参数变化，可以通过下面的方法更改需要传递的新参数。
		//this.setPostParams({"requestid" : "000","fieldName":"111"});
	}
}

//整个队列全部全部的时候
//function queueComplete_(numFilesUploaded) {
	//alert("上传完成数量:"+numFilesUploaded);
	//var status = document.getElementById("divStatus");
	//status.innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
//} 

</script>
</head>
<body>
 
<div id="content">
	<h2>Simple Demo</h2>
	<form enctype="multipart/form-data" method="post" action="${path}/FileUploadCtrl/doupload.do" id="form1">
		<p>This page demonstrates a simple usage of SWFUpload.  It uses the Queue Plugin to simplify uploading or cancelling all queued files.</p>
			<div class="fieldset flash" id="fsUploadProgress">
			<span class="legend">Upload Queue</span>
			</div>
		<div id="divStatus">0 Files Uploaded</div>
			<div>
				<span id="spanButtonPlaceHolder"></span>
				<input id="btnCancel" type="button" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;" />
			</div>
	</form>
</div>

</body>
	
</html>