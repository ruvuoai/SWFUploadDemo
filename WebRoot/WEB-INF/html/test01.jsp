<!DOCTYPE HTML>
<#assign path="${request.getContextPath()}">
<title>SWFUpload Demos - Simple Demo</title>
<link type="text/css" rel="stylesheet" href="${path}/resource/default.css">
<script src="${path}/resource/swfupload.js" type="text/javascript"></script>
<script src="${path}/resource/swfupload.queue.js" type="text/javascript"></script>
<script src="${path}/resource/fileprogress.js" type="text/javascript"></script>
<script src="${path}/resource/handlers.js" type="text/javascript"></script>
<script type="text/javascript">
		var swfu;
	
		window.onload = function() {
			var settings = {
				flash_url : "${path}/resource/swfupload.swf",
				upload_url: "${path}/FileUploadCtrl/doupload.do",
				post_params: {"PHPSESSID" : ""},
				file_size_limit : "100 MB",
				file_types : "*.*",
				file_types_description : "All Files",
				file_upload_limit : 100,
				file_queue_limit : 0,
				custom_settings : {
					progressTarget : "fsUploadProgress",
					cancelButtonId : "btnCancel"
				},
				debug: false,

				// Button settings
				button_image_url: "${path}/resource/TestImageNoText_65x29.png",
				button_width: "65",
				button_height: "29",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '<span class="theFont">Hello</span>',
				button_text_style: ".theFont { font-size: 16; }",
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