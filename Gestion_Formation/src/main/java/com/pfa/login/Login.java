package com.pfa.login;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  

@WebServlet("/login")
public class Login extends HttpServlet { 
public void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {  
	
    PrintWriter out = response.getWriter();  
          
    String u=request.getParameter("username");
    String p=request.getParameter("userpass");
    boolean result = new LoginDao().validate(u, p);
    if(result){
    	String name="Admin";
    	HttpSession session= request.getSession(true);  
        session.setAttribute("name",name);  
    	response.sendRedirect("admin/index.jsp"); 
    }  
    else{  
        System.out.println("Sorry username or password error");  
        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        rd.include(request,response);
    }  
          
    out.close();  
    }   
}  