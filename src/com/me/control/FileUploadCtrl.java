package com.me.control;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
        return "test02";
    }


    @RequestMapping(value = "/doupload", method = RequestMethod.POST)
    public @ResponseBody
    List<UploadedFile> handleFormUpload(
                                        @RequestParam("input_file") MultipartFile file,
                                        HttpServletRequest request,
                                        HttpServletResponse response)
    {
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
            IOUtils.copy(
                    file.getInputStream(),
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

        List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
        UploadedFile u = new UploadedFile(filename, Long.valueOf(
                file.getSize()).intValue(), filename);
        uploadedFiles.add(u);
        // HttpHeaders headers = new HttpHeaders();
        // MediaType mt = new MediaType("text", "html", Charset.forName("gbk"));
        // headers.setContentType(mt);
        // ResponseEntity<String> re = new
        // ResponseEntity<String>(Json.toJson(uploadedFiles), HttpStatus.OK);
        return uploadedFiles;
    }


    @RequestMapping(value = "/doupload_ie", method = RequestMethod.POST)
    public @ResponseBody
    List<UploadedFile> handleFormUpload_ie(
                                           @RequestParam("input_file") MultipartFile file,
                                           HttpServletRequest request,
                                           HttpServletResponse response)
    {
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
            IOUtils.copy(
                    file.getInputStream(),
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

        List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
        UploadedFile u = new UploadedFile(filename, Long.valueOf(
                file.getSize()).intValue(), filename);
        uploadedFiles.add(u);
        // HttpHeaders headers = new HttpHeaders();
        // MediaType mt = new MediaType("text", "html", Charset.forName("gbk"));
        // headers.setContentType(mt);
        // ResponseEntity<String> re = new
        // ResponseEntity<String>(Json.toJson(uploadedFiles), HttpStatus.OK);
        return uploadedFiles;
    }

}
