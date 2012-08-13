<!DOCTYPE HTML>
<#assign path="${request.getContextPath()}">
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery File Upload Example</title>
		<script src="${path}/js/jquery-1.7.2.min.js"></script>
		<script src="${path}/js/jquery.ui.widget.js"></script>
		<script src="${path}/js/jquery.iframe-transport.js"></script>
		<script src="${path}/js/jquery.fileupload.js"></script>
		<script type="text/javascript">
		$(function () {
		    $('#fileupload').fileupload({
		        dataType: 'json',
		        done: function (e, data) {
		            $.each(data.result, function (index, file) {
		                $('<p/>').text(file.name).appendTo(document.body);
		            });
		        }
		    });
		});
		

//ready over

	
</script>
	</head>
	<body>

		<input id="fileupload" type="file" name="files[]"
			data-url="${path}/FileUploadCtrl/doupload.do" multiple>
		<div id="progress">
			<div class="bar" style="width: 0%;"></div>
		</div>


	</body>
</html>