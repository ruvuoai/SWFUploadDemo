<!DOCTYPE HTML>
<#assign path="${request.getContextPath()}">
<title>SWFUpload Demos - Simple Demo</title>
<link type="text/css" rel="stylesheet" href="${path}/resource2/default.css">
<script src="${path}/resource2/swfupload.js" type="text/javascript"></script>
<script src="${path}/resource2/swfupload.queue.js" type="text/javascript"></script>
<script src="${path}/resource2/fileprogress.js" type="text/javascript"></script>
<script src="${path}/resource2/handlers.js" type="text/javascript"></script>
<script type="text/javascript">
		var swfu;
		
		window.onload = function() {
			var settings = {
				flash_url : "${path}/resource2/swfupload.swf",
				upload_url: "${path}/FileUploadCtrl/doupload.do",
				post_params : {
							"requestid" : "123", 
							"fieldName":"photo"  
						},
				file_types : "*.jpg;*.gif",
				file_types_description : "图片文件",
 				custom_settings : {
					progressTarget : "fsUploadProgress",
					cancelButtonId : "btnCancel",
					divStatus:"divStatus"
				},
		 		
				// Button settings
				button_image_url: "${path}/resource2/TestImageNoText_65x29.png",
				button_width: "65",
				button_height: "29",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '<span class="theFont">上传...</span>',
				button_text_style: ".theFont {width:50px; height:25px; font-size:12px; text-align:center;vertical-align: middle; font-family:'微软雅黑', ''黑体; color:#1c527a; }}",
				button_text_left_padding: 12,
				button_text_top_padding: 3,
				
				// The event handler functions are defined in handlers.js
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
				queue_complete_handler : queueComplete	// Queue plugin event
			};

			swfu = new SWFUpload(settings);
	     };
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