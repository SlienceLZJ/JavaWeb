package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.JDBCDao;
import com.domain.DianMingInformation;

/**
 * Servlet implementation class ModStoreMsg
 */
@WebServlet("/ModStoreMsg")
@MultipartConfig(location="C:\\jspCache",fileSizeThreshold=1024*5)
public class ModStoreMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
       // response.setContentType("text/html;charset=UTF-8");
		String sql;
		HttpSession session=request.getSession();
		String no=(String)session.getAttribute("no");
		
		request.setCharacterEncoding("UTF-8");		
		String name=request.getParameter("name");

        System.out.println("name is null?+"+(name==null));
		
					//如果用户提交了保存的信息，则将表单的数据进行更新
				if(name!=null) {	
		
				String description=request.getParameter("description");
				Part picture=request.getPart("picture");	
				Part payCode=request.getPart("payCode");				
				String path=this.getServletContext().getRealPath("/")+"storePicture\\"+no+".jpg";
				String payPath=this.getServletContext().getRealPath("/")+"storePayCode\\"+no+".jpg";
				System.out.println("the path is "+path);
				
				 File f = new File(path);
				 File fPay=new File(payPath);
		          if( !f.exists()){  // 若目录不存在，则创建目录
		        	  System.out.println("the file is not existed");
		            f.mkdirs();
		          }
		          else {
		        	  System.out.println("the file is existed");
		        	 f.setWritable(true);
		          }		
		          
		          if( !fPay.exists()){  // 若目录不存在，则创建目录
		        	  //System.out.println("the file is not existed");
		            fPay.mkdirs();
		          }
		          else {
		        	  //System.out.println("the file is existed");
		        	 fPay.setWritable(true);
		          }		
		          
		    
		          //当上传文件不为空的时候进行写入
		          if(picture.getSize()!=0.0) {
		        	    picture.write(path);
		          }
				  if(payCode.getSize()!=0.0) {
					  payCode.write(payPath);
				  }
		          		          
				    
			    sql="update DianMing set name='"+name+"',description='"+description+"' where id='"+no+"'";
			    JDBCDao.insertOrDeleteOrUpdate(sql);
			    //开始执行更新操作
			    System.out.println("the sql is :"+sql);
			    request.setAttribute("update", "更新成功!");		    

				}
	
	
		DianMingInformation info=new DianMingInformation();	
		sql="select * from DianMing where id='"+no+"'";	
		try {
			ResultSet rs=JDBCDao.getData(sql);	
			System.out.println("have");
			while(rs.next()) {
				System.out.println("no have");
			info.setName(rs.getString("name"));
			info.setPicture("storePicture/"+no+".jpg");
			info.setStoreId(rs.getString("id"));
			info.setDescription(rs.getString("description"));
			info.setPayPicture("storePayCode/"+no+".jpg");
			}
						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		
		
		
		 request.setAttribute("info", info);
		 RequestDispatcher rd = request.getRequestDispatcher("modStoreMsg.jsp");
		 rd.forward(request, response);
		
	}
}
