package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.entities.Message;
import com.tech.blog.helper.ProvideConnection;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter())
		{
			
			String operation=request.getParameter("operation");
			
			int uid=Integer.parseInt(request.getParameter("uid"));
			int pid=Integer.parseInt(request.getParameter("pid"));
			
					/*	out.println("data form server");
						out.println(operation);
						out.println(uid);
						out.println(pid);
				    */
			  
			 LikeDao ld=new LikeDao(ProvideConnection.getConnection());
			
			if(operation.equals("like"))
			{
				boolean f=ld.insertLike(pid, uid);
				out.println(f);
			}
		}

	}

}
