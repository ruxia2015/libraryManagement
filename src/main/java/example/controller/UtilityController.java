package example.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/util")
public class UtilityController {

    //上传图片并返回上传结果
    @RequestMapping("/picture")
    public String  fileUpload(@RequestParam("file") MultipartFile file,  String bookPicture ) throws IOException {
        if(file != null){
            try {
                String path = BookInfoController.class.getResource("/").getPath();
                String newPath = StringUtils.substringBeforeLast(path, "c");
                String outPutPath = newPath+"statics/image/"+file.getOriginalFilename();
                File fileNew = new File(outPutPath);
                File fileParent = fileNew.getParentFile();
                if(!fileParent.exists()){
                    fileParent.mkdirs();
                }
                //获取输出流
                OutputStream os=new FileOutputStream(outPutPath);
                //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
                InputStream is=file.getInputStream();
                int temp;
                //一个一个字节的读取并写入
                while((temp=is.read())!=(-1))
                {
                    os.write(temp);
                }
                os.flush();
                os.close();
                is.close();
                String newBookPicture = "image/"+file.getOriginalFilename();
                return newBookPicture;
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }
        return bookPicture;
    }
    public static int differentDays(Date date1, Date date2)
    {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int day1= cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);
        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if(year1 != year2)
        {
            int timeDistance = 0 ;
            for(int i = year1 ; i < year2 ; i ++)
            {
                if(i%4==0 && i%100!=0 || i%400==0)
                {
                    timeDistance += 366;
                }
                else
                {
                    timeDistance += 365;
                }
            }
            return timeDistance + (day2-day1) ;
        }
        else
        {
            return day2-day1;
        }
    }


}

