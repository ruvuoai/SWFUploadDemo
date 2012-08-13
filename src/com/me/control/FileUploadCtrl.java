package com.me.control;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
