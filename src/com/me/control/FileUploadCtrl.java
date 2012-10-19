package com.me.control;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.nutz.json.Json;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.me.domain.UploadedFile;
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


    @RequestMapping("/showFileUploadCtrl2")
    public String showFileUploadCtrl2()
    {
        return "test02";
    }

    @RequestMapping("/showFileUploadCtrl3")
    public String showFileUploadCtrl3()
    {
        return "test03";
    }
    

    @RequestMapping(value = "/doupload", method = RequestMethod.POST, produces = "text/json")
    public String handleFormUpload(@RequestParam("Filedata") MultipartFile file,
                                   @RequestParam("requestid") String requestid,
                                   @RequestParam("fieldName") String fieldName)
    {
	
        System.out.println("--\r\n");
        System.out
                .println("requestid=" + requestid + ";fieldName=" + fieldName);
        System.out.println("--\r\n");

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
            IOUtils.copy(file.getInputStream(),
                         output);

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
        }

        // List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
        // UploadedFile u = new UploadedFile(filename, Long
        // .valueOf(file.getSize()).intValue(), filename);
        // uploadedFiles.add(u);
        return "login";// 随便指定一个页面返回就行了
    }

}
