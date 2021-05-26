package com.pfa.coordonateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import com.pfa.connectionProvide.ConnectionProvider;

@WebServlet("/coordonnateur/tableformation")
public class ShowServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		int id_form = Integer.parseInt(request.getParameter("form"));
		request.setAttribute("name", id_form);
		RequestDispatcher rd=request.getRequestDispatcher("./table-emploi.jsp");
        rd.include(request,response);
	}
}