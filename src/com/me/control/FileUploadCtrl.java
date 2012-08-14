package com.me.control;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/FileUploadCtrl")
public class FileUploadCtrl
{

    /**
     * 显示文件上传页面
     * 
     * @return
     */
    @RequestMapping("/showFileUploadCtrl")
    public String showFileUploadCtrl()
    {
        return "test01";
    }


    @RequestMapping(value = "/doupload", method = RequestMethod.POST)
    // Filedata此处对应js/swfupload/swfupload.js中的this.ensureDefault("file_post_name",
    // "Filedata");
    public ModelAndView handleFormUpload(HttpServletResponse response,
                                         HttpServletRequest request)
    {

        ModelAndView mod = new ModelAndView();

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        // 获得文件：
        MultipartFile file = multipartRequest.getFile("files[]");
        // 获得文件名：
        String filename = file.getOriginalFilename();
        // 获得输入流：

        try
        {
            filename = new String(filename.getBytes("iso-8859-1"), "UTF-8");
            InputStream input = file.getInputStream();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        // 写入文件

        mod.setViewName("filetest");
        return mod;
    }

}
