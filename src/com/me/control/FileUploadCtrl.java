package com.me.control;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.me.ut.WebPath;


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
        // 获得文件
        MultipartFile file = multipartRequest.getFile("files[]");
        // 获得文件名
        String filename = file.getOriginalFilename();
        
        OutputStream output = null;
        File outfile = null;
        try
        {
            filename = new String(filename.getBytes("iso-8859-1"), "UTF-8");
            String folderpath = WebPath.getUploadRootPath();
            String filePath = folderpath + filename;
            
            outfile = new File(filePath);
            output = new FileOutputStream(outfile);
            IOUtils.copy(file.getInputStream(), output);

            System.out.println(filename);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (output != null)
            {
                try
                {
                    output.close();
                }
                catch (IOException ioe)
                {
                    ioe.printStackTrace();
                }
            }
            
            // 如果上传过程中出现异常：告知前台错误
            mod.setViewName("fieldtest");
            mod.addObject("fielderr", "上传文件" + filename + "的时候出现错误");
        }
        
        mod.setViewName("test01");
        return mod;

    }
}
