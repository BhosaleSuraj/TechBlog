package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ProvideConnection;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter())
		{
			
			out.println("<!DOCTYPE html>");
			
			out.println("<head>");
			out.println("<title> LoginServlet </title>");
			out.println("</head>");
			out.println("<body>");
			//fetch the data form table			 
			
			String userEmail=request.getParameter("user_email");
			String userName=request.getParameter("user_name");
			String userPassword=request.getParameter("user_password");
			String userAbout=request.getParameter("user_about");
			/*Part part=request.getPart("image");
			
			String imageName=part.getSubmittedFileName();*/
			
			
			//get the user form session
			
			HttpSession s=request.getSession();
			User user=(User)s.getAttribute("currentUser");
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			//user.setProfile(imageName);
			
			//update database in the data
			
			//connection Provider
			UserDao userDao=new UserDao(ProvideConnection.getConnection());
			boolean ans=userDao.updateUser(user);
			
			if(ans)
			{
				out.println("updated to data base");
			}
			else
			{
				out.println("Not updated to data base");
			}
			out.println("</body>");
			out.println("</html>");

	
		}
		
	}
	}

