function createSwf(fieldId,fieldName,btnTxt,fileListObj,sysPath, btnbgWidth)
{
	if(fieldId==undefined||fieldId.length==0)
	{
		alert("文件ID为空,上传插件初始化失败");
		return;
	}
	
	if(!btnbgWidth){
		btnbgWidth=120;			
	}
	$("#outdiv_"+fieldName).html(
		"<form id=\"form_"+fieldName+"\"   method=\"post\"" +
		"							enctype=\"multipart/form-data\">" +
		"	<div style=\"float: left;\">" +
		"		<span id=\"span_"+fieldName+"\"></span>" +
		"		<input id=\"cancel_"+fieldName+"\" type=\"button\" value=\"Cancel All Uploads\"" +
		"			onclick=\"swfu_"+fieldName+".cancelQueue();\" disabled=\"disabled\"" +
		"			style=\"font-size: 8pt; height: 29px; display: none;\" />" +
		"	</div>" +
		"	" +
		"	<div style=\"float: left;\">" +
		"		<div id=\"status_"+fieldName+"\"" +
		"			style=\"float: left; text-align: left;\">" +
		"		</div>" +
		"	</div>" +
		"</form>"
	);
	
	var settings  = {
			            flash_url : sysPath+"/resource6/swfupload.swf",
			            upload_url : sysPath+"/FileUploadCtrl/do_upload_file.do;jsessionid=${jsessionid}",
			            post_params : {
							"requestid" : fieldId, 
							"fieldName":fieldName  
						},
			            file_size_limit : "0",
			            file_types : "*.*",
			            file_types_description : "All Files",
			            file_upload_limit : 100,
			            file_queue_limit : 0,
			            custom_settings : {
			                progressTarget : "porgress_"+fieldName,
			                cancelButtonId : "cancel_"+fieldName,
			                divStatus:"status_"+fieldName
			            },
			            button_width:btnbgWidth,
			            button_text:"<span class='button_swf'>"+btnTxt+"</span>",
			            button_image_url: sysPath+"/resource6/images/swfbg"+btnbgWidth+".gif",
			            button_text_style: ".button_swf {width:"+btnbgWidth+"px; height:25px; font-size:12px; text-align:center;vertical-align: middle; font-family:'微软雅黑', ''黑体; color:#1c527a; }",
			            button_placeholder_id: "span_"+fieldName ,
			            
			            file_queue_error_handler : fileQueueError,
						file_dialog_complete_handler : fileDialogComplete,
						upload_start_handler : uploadStart,
						upload_progress_handler : uploadProgress,
						upload_error_handler : uploadError,
						upload_success_handler : function(file, data)
						{
							var href="FileUploadCtrl/download/"+fieldId+"/"+fieldName+"/"+file.name+".do";
							if($(fileListObj).html().indexOf(href)<0)
							{
								$(fileListObj).prepend(
										"<div><a href=\""+sysPath+"/FileUploadCtrl/download/"+fieldId+"/"+fieldName+"/"+file.name+".do\">"+file.name+"</a>\n" +
										"--\n" +
										"<a  href=\"javascript:delFile('"+fieldId+"','"+fieldName+"','"+file.name+"','"+sysPath+"')\">删除</a>\n" +
										"<br/></div>"
								);
							}
							
							try {
								var progress = new FileProgress(file, this.customSettings.progressTarget);
								progress.setComplete();
								progress.setStatus("上传完成");
								progress.toggleCancel(false);
								} catch (ex) {
								this.debug(ex);
							}
						},
						upload_complete_handler : uploadComplete,
						queue_complete_handler : queueComplete 	// Queue plugin event
			            
		 };
		 return new SWFUpload(settings);
}


// 删除文件
function delFile(fileid, fieldName, fileName, sysPath) {
    $.ajax({
        type: "POST",
        async: false,
        url: sysPath + "/FileUploadCtrl/delFile.do",
        data: {
            requestId: fileid,
            fieldName: fieldName,
            fileName: fileName
        },
        success: function (data) {
            // data 有三个字段， fieldName,fileName,requestId

            // var t=$("a:contains('"+
            // decodeURI(fileName)+"')").attr("href");
            // 4b0e3db48be2410fb71af4c350479aac/practicingCertificate/Empty.doc
            var str = data.requestId + "/" + data.fieldName + "/" + fileName  + ".do";
            // var s=$("a[href$='"+str+"']").attr("href");
            $("div[id^='fileList']>div>a[href$='" + str + "']")
							.parent().remove();
        }
    });
}


