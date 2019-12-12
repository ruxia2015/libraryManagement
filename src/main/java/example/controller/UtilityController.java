package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.util.Date;

@Controller
@RequestMapping("/util")
public class UtilityController {

//    //上传图片并返回上传结果
//    @RequestMapping("/picture")
//    public String  fileUpload(@RequestParam("file") CommonsMultipartFile file) throws IOException {
//        //用来检测程序运行时间
//        long  startTime=System.currentTimeMillis();
////        System.out.println("fileName："+file.getOriginalFilename());
//
//        try {
//            //获取输出流
//            OutputStream os=new FileOutputStream("E:/"+new Date().getTime()+file.getOriginalFilename());
//            //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
//            InputStream is=file.getInputStream();
//            int temp;
//            //一个一个字节的读取并写入
//            while((temp=is.read())!=(-1))
//            {
//                os.write(temp);
//            }
//            os.flush();
//            os.close();
//            is.close();
//
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        }
//        long  endTime=System.currentTimeMillis();
////        System.out.println("方法一的运行时间："+String.valueOf(endTime-startTime)+"ms");
//        return "/success";
//    }
}
