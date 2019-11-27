/*
 * 描 述: <描述> 修 改 人: brady 修改时间: 2012-12-26 <修改描述:>
 */
package example.util;

import example.entity.User;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 请求获取请求属性集 <功能详细描述>
 * 
 * @author brady
 * @version [版本号, 2012-12-26]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class WebContextUtils {


    /** 当前登录人员在session中的key */
    public static final String SESSION_CURRENT_USER = "user";
  
  
    
    /**
     * 从会话中获取当前组织<br/>
     * <功能详细描述>
     * 
     * @return [参数说明]
     * 
     * @return Organization [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
     */
    public static User getCurrentUser() {
        HttpSession session = getSession(true);
        if (null == session) {
            return null;
        }
        User user = (User) session.getAttribute(SESSION_CURRENT_USER);
        return user;
    }

    public static void addToSession(String key,Object object){
        getSession().setAttribute(key,object);
    }

    public static void removeFromSession(String key){
        getSession().removeAttribute(key);
    }
    



    /**
     * 获取当前请求RequestAttributes <功能详细描述>
     * 
     * @return [参数说明]
     * 
     * @return HttpServletRequest [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
     */
    public static RequestAttributes getRequestAttributes() {
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        
        return requestAttributes;
    }
    
    /**
     * 获取当前请求request <功能详细描述>
     * 
     * @return [参数说明]
     * 
     * @return HttpServletRequest [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
     */
    public static HttpServletRequest getRequest() {
        if (getRequestAttributes() != null) {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } else {
            return null;
        }
    }
    
    /**
     * 获取当前会话 <功能详细描述>
     * 
     * @return [参数说明]
     * 
     * @return HttpSession [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
     */
    public static HttpSession getSession() {
        return getSession(true);
    }
    
    /**
     * 获取当前会话 <功能详细描述>
     * 
     * @param flag
     * @return [参数说明]
     * 
     * @return HttpSession [返回类型说明]
     * @exception throws [异常类型] [异常说明]
     * @see [类、类#方法、类#成员]
     */
    public static HttpSession getSession(boolean flag) {
        if (getRequest() == null) {
            return null;
        }
        return getRequest().getSession(flag);
    }
    
}
