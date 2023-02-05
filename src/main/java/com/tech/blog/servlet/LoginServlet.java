package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ProvideConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
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
			
			//out.println("<h1> Servlet LoginServlet at" + request.getContextPath()+ "</h1>");
			
			
			//Write a code for login page fetch username and password
			
			String userEmail=request.getParameter("email");
			String userPassword=request.getParameter("password");
			
			//connection Provider
			UserDao dao=new UserDao(ProvideConnection.getConnection());
			
		    User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
			
		    if(u == null)
		    {
		    	//login
		    	
		    	//out.println("invalid details try again");
		    	
		    	Message msg=new Message("Inavalide details ! try with another","error","alert-danger");
		    	HttpSession s=request.getSession();
		    	s.setAttribute("msg", msg);
		    	response.sendRedirect("login_page.jsp");
		    }
		    else
		    {
		    	//login  success  
		    	 HttpSession s=request.getSession();
		    	 s.setAttribute("currentUser",u);
		    	 response.sendRedirect("profile.jsp");
		    }
		    
		    out.println("</body>");
			out.println("</html>");
		}
		//doGet(request, response);
	}

	}
