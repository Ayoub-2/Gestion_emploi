package com.pfa.login;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet("/login")
public class Login extends HttpServlet { 
public void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {  
	
    PrintWriter out = response.getWriter();  
          
    String u=request.getParameter("username");
    String p=request.getParameter("userpass");
    System.out.println("user :" + u + "\npass :" + p);
    boolean result = new LoginDao().validate(u, p);
    if(result){  
    	System.out.println("Hello , Post received") ;
    	response.sendRedirect("./admin/index.html"); 
    }  
    else{  
        System.out.println("Sorry username or password error");  
        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        rd.include(request,response);
    }  
          
    out.close();  
    }   
}  