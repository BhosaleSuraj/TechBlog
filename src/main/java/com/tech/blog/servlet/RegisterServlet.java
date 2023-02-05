package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ProvideConnection;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
	
		try(PrintWriter out=response.getWriter())
		{
			
            //Fetch form data in register form
			
			String check=request.getParameter("check");
			if(check==null)
			{
				out.println(" box not check");
			}
			else
			{
				//other data to  fetch
				 
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				String about=request.getParameter("about");
				
				//create user object and set all data to that object
				
				User user=new User(name,email,password,gender,about);
				
				//create Dao object
				
				UserDao dao=new UserDao(ProvideConnection.getConnection());
				if(dao.saveUser(user))
				{
					out.println("done");
				}
				else
				{
					out.println("error");
				}
			}

			
		}
		
		//doPost(request,response);
	}

	
	

}
