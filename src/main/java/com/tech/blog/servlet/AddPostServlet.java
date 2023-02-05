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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ProvideConnection;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter())
		{
			
			
			int cid= Integer.parseInt(request.getParameter("cid"));
			String pTitle=request.getParameter("pTitle");
			String pContent=request.getParameter("pContent");
			String pPode =request.getParameter("pCode");
			//Part part=request.getPart("pPic");
			
			//getting user id
			
			HttpSession session=request.getSession();
			
			User user=(User)session.getAttribute("currentUser");
			
			//out.println("your title is print ln"+pTitle);
			//out.println(part.getSubmittedFileName());
			
			Posts p=new Posts( pTitle, pContent,  pPode,null, cid, user.getId());
			PostDao dao=new PostDao(ProvideConnection.getConnection());
			
			if(dao.savePost(p))
			{
				out.println("done");
			}
			else
			{
				out.println("error");
			}
			
		}
	}

}
