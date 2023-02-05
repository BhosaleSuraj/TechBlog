package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;



/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter())
		{
			
			out.println("<!DOCTYPE html>");
			
			out.println("<head>");
			out.println("<title> LoginServlet </title>");
			out.println("</head>");
			out.println("<body>");
			
			 HttpSession s=request.getSession();
			 s.removeAttribute("currentUser");
			 Message m=new Message("Logout Successfully", "success","alert-success");
	    	 s.setAttribute("msg",m);
	    	 response.sendRedirect("login_page.jsp");
			
			
			out.println("</body>");
			out.println("</html>");
		}
	}

	
	}


