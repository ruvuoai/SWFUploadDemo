<!DOCTYPE HTML>
<#assign path="${request.getContextPath()}">
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery File Upload Example</title>
		<script src="${path}/js/jquery-1.7.2.min.js"></script>
		<script src="${path}/js/jquery.ui.widget.js"></script>
		<script src="${path}/js/jquery.fileupload.js"></script>
		<script type="text/javascript">
	$(function() {
		$('#fileupload').fileupload({
	        dataType: 'json',
	        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
	       
        },
        done: function (e, data) {
         
           $.each(data.result, function (index, file) {
             $('<p/>').text(file.name).appendTo(document.body);
            });
           
	        //if($.browser.msie){
			//	    var data_to_parse = $( 'pre', data.result ).text();
			//	}else{
			//	    var data_to_parse = data.result;
			//	}
			//	var result = jQuery.parseJSON(data_to_parse);
			//	var filename = result[0].name;
			//    alert(filename);
		   
        }
    });
	});
	//ready over
</script>

<link href="http://blueimp.github.com/jQuery-File-Upload/css/jquery.fileupload-ui.css" rel="stylesheet">

<style type="text/css">
	.bar {
	  height: 18px;
	  background: green;
	}
	div{
		margin: 50px;
		float: none;
	}
	
	.fileinput-button input {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    -moz-transform: translate(-300px, 0px) scale(4);
    border-color: transparent;
    border-image: none;
    border-style: solid;
    border-width: 0 0 100px 200px;
    cursor: pointer;
    direction: ltr;
    margin: 0;
    opacity: 0;
    position: absolute;
    right: 0;
    top: 0;
}

 
.btn {

  border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);

    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #F5F5F5;
    background-image: -moz-linear-gradient(center top , #FFFFFF, #E6E6E6);
    background-repeat: repeat-x;
    border-color: #E6E6E6 #E6E6E6 #A2A2A2;
    border-image: none;
    border-radius: 4px 4px 4px 4px;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2) inset, 0 1px 2px rgba(0, 0, 0, 0.05);
    color: #333333;
    cursor: pointer;
    display: inline-block;
    font-size: 14px;
    line-height: 20px;
    margin-bottom: 0;
    padding: 4px 14px;
    text-align: center;
    text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
    vertical-align: middle;
}
</style>

	</head>
	<body>
		
		<div>
			 <span class="btn fileinput-button">
               <span>Add files...</span>
               <input id="fileupload" type="file" name="input_file" data-url="${path}/FileUploadCtrl/doupload.do" multiple>
        	 </span>
		</div>
			
		<div style="clear: both;"></div>	
		
		<div id="progress">
			<div class="bar" style="width: 0%;"></div>
		</div>
		
		<div id="msg"></div>
		 
		
	</body>
</html>