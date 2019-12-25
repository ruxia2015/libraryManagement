package example.controller;

import example.util.CodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/code")
public class CodeController {

    @RequestMapping("/getCode")
        public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            // 调用工具类生成的验证码和验证码图片
            Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();

            // 将四位数字的验证码保存到Session中。
            HttpSession session = req.getSession();
            session.setAttribute("code", codeMap.get("code").toString());

            // 禁止图像缓存。
            resp.setHeader("Pragma", "no-cache");
            resp.setHeader("Cache-Control", "no-cache");
            resp.setDateHeader("Expires", -1);

            resp.setContentType("image/jpeg");

            // 将图像输出到Servlet输出流中。
            ServletOutputStream sos;
            try {
                sos = resp.getOutputStream();
                ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
                sos.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }



    @RequestMapping("/checkCode")
      public int  doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String code = request.getParameter("code");
            // 验证验证码
            String sessionCode = request.getSession().getAttribute("code").toString();
            if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode)) {
                if (code.equalsIgnoreCase(sessionCode)) {
                    return 1;
//                    response.getWriter().println("验证通过！");
                } else {
                    return 2;
//                    response.getWriter().println("验证失败！");
                }
            } else {
                    return 3;
//                response.getWriter().println("验证失败！");
            }
        }
    }

