package com.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.dao.*;

/**
 * Servlet implementation class addfood
 */
@WebServlet("/addfood")
@MultipartConfig(location="C:\\jspCache",fileSizeThreshold=1024)
public class addfood extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 // 返回上传来的文件名
    private String getFilename(Part part){
        String fname = null;
        // 返回上传的文件部分的content-disposition请求头的值
        String header = part.getHeader("content-disposition");
        System.out.println(header);
        
        // 返回不带路径的文件名
        fname = header.substring(header.lastIndexOf("=")+2, 
                                 header.length()-1);        
        //判断是否为IE浏览器的文件名，IE浏览器下文件名会带有盘符信息
        // Check for Unix-style path
        int unixSep = fname.lastIndexOf('/');
        // Check for Windows-style path
        int winSep = fname.lastIndexOf('\\');
        // Cut off at latest possible point
        int pos = (winSep > unixSep ? winSep : unixSep);
        if (pos != -1)  {
            // Any sort of path separator found...
            fname = fname.substring(pos + 1);
        }     
        return fname;
    }	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=new String(request.getParameter("id")
                .getBytes("iso-8859-1"),"UTF-8");	
		System.out.println("java    "+id);
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日hh时mm分ss秒");
		System.out.println(sdf.format(calendar.getTime()));
        String date =sdf.format(calendar.getTime());
		String foodname=new String(request.getParameter("foodname")
                .getBytes("iso-8859-1"),"UTF-8");
		String foodpicture=null;
		String foodprice=new String(request.getParameter("foodprice")
                .getBytes("iso-8859-1"),"UTF-8");
		String foodtype=new String(request.getParameter("foodtype")
                .getBytes("iso-8859-1"),"UTF-8");
		String foodIntroduction=new String(request.getParameter("foodIntroduction")
                .getBytes("iso-8859-1"),"UTF-8");		
		System.out.println(id);
		System.out.println(foodname);
		System.out.println(foodpicture);
		System.out.println(foodprice);
		System.out.println(foodtype);
		System.out.println(foodIntroduction);
		  // 返回Web应用程序文档根目录
        String path = this.getServletContext().getRealPath("/");
        System.out.println(path);
        path = path +"img2\\"+ id;
        System.out.println(path);        
        Part p = request.getPart("foodpicture");
        System.out.println("part is null?"+p);
        System.out.println(p);
        String fname = getFilename(p);   // 得到文件名                
        String message="";
        if(p.getSize() >1024*1024*5){    // 上传的文件不能超过5MB大小
          p.delete();
          message = "文件太大，不能上传！";
        }else{
          // 文件存储在文档根目录下img2中          
          File f = new File(path);
          if( !f.exists()){  // 若目录不存在，则创建目录
            f.mkdirs();
          }
            String A="img2\\"+ id+ "\\"+ date+fname ;
            A=A.replaceAll("\\\\", "\\\\\\\\");
            System.out.println(A);
            String sql ="INSERT INTO Dian VALUES ('"+id+"','"+foodname+"','"+A+"','"+foodprice+"','"+foodIntroduction+"','"+foodtype+"')";
            System.out.println(sql);
            int a=JDBCDao.insertOrDeleteOrUpdate(sql);
    			  JDBCDao.closeConnecttion();
    			  System.out.println(a);
    			if(a==0) {
    			request.setAttribute("result", "您的店铺已有该菜品");
    			
    			}
    			else {
    	     	request.setAttribute("result", "成功添加菜：    "+foodname);
    	     	System.out.println(fname);       

    	        path=path + "\\"+date+fname;
    	        System.out.println(path);

    	        p.write(path);     // 将上传的文件写入磁盘
    	        path=path.replaceAll("\\\\", "\\\\\\\\");    
    	        message = "文件上传成功！";
    	        System.out.println(path);     	    	     	
    			}   
          }                 
        
    request.setAttribute("message", message);
    RequestDispatcher rd = request.getRequestDispatcher("/addfood.jsp");
    rd.forward(request, response);
		doGet(request, response);
	}

}