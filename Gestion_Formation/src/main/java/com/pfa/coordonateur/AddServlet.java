package com.pfa.coordonateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import com.pfa.connectionProvide.ConnectionProvider;

@WebServlet("/coordonnateur/add")
public class AddServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {  
		try {
			RequestDispatcher rd = null ; 
			System.out.println("validerEmploi , Post received") ;
		    PrintWriter out = response.getWriter();
		    String action = request.getParameter("action");
		    switch (action) {
		    case "1" :
		    	// add grade 
		    	try {
		    	addgrade(request.getParameter("nom"));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressaier");
		    	}
		    	 rd=request.getRequestDispatcher("coordonnateur/grade.jsp");
		    	break ;
		    case "2" :
		    	// add niveau
		    	try {
		    	addniveau(request.getParameter("nom"));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressaier");
		    	}
		    	 rd=request.getRequestDispatcher("coordonnateur/niveau.jsp");
		    	break ;
		    case "3" : 
		    	// add departement
		    	try {
		    	adddepart(request.getParameter("nom"));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressaier");
		    	}
		    	rd=request.getRequestDispatcher("coordonnateur/departement.jsp");
		    	break;
		    case "4" : 
		    	// add enseignant
		    	try {
		    	addens(request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("genre") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("grade") , 
		    			request.getParameter("department") , 
		    			request.getParameter("element"));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressaier");
		    	}
		    	 rd=request.getRequestDispatcher("coordonnateur/Enseignant.jsp");
		    	break;
		    case "5" : 
		    	// add etudiant
		    	try {
		    	addetu(request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("genre") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("niveau") , 
		    			request.getParameter("formation"));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressaier");
		    	}
		    	 rd=request.getRequestDispatcher("coordonnateur/etudiant.jsp");
		    	break;
		    case "6" : 
		    	break ;
		    default : 
		    	rd = request.getRequestDispatcher("coordonnateur/index.jsp");
		    }
	        rd.include(request,response);
		    out.close();
		
		} catch (Exception e ) { 
			e.printStackTrace();
		}
	}
	public void addgrade(String nom) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into grade values(?,?);");
		PreparedStatement pst1 = connection.prepareStatement
				("select max(id) from grade");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setString(2 , nom);
		pst.executeUpdate();
	}
	public void addens(String nom , String prenom , String email , String genre , String adresse , String grade , String department , String elemnt) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into enseignant values ("
						+ "? ,  (select id from grade where nom=?) , (select id from departement where nom=? ) , (select max(id)+1 from vac ) , ? , ?  , ? , ?");
		PreparedStatement pst1 = connection.prepareStatement
		("select max(id) from grade");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setString(2 , grade);
		pst.setString(3 , department);
		pst.setString(4, nom);
		pst.setString(5 , prenom);
		pst.setString(6 , email);
		pst.setString(7,genre);
		pst.executeUpdate();
	}
	public void addetu(String nom , String prenom , String email , String genre , String adresse , String niveau , String formation ) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into enseignant values ("
						+ "? ,  (select id from niveau where nom=?) ,?, ? , ?  , ? , ?");
		PreparedStatement pst1 = connection.prepareStatement
		("select max(id) from grade");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setString(2 , niveau);
		pst.setString(3, nom);
		pst.setString(4 , prenom);
		pst.setString(5 , email);
		pst.setString(6,genre);
		pst.setString(7 , adresse);
		pst.executeUpdate();
	}
	public void addniveau(String nom) throws Exception  {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into niveau values(?,?);");
		PreparedStatement pst1 = connection.prepareStatement
				("select max(id) from niveau");
		ResultSet rs = pst1.executeQuery();
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setString(2 , nom);
		pst.executeUpdate();
	}
	public void adddepart(String nom) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into departement values(?,?);");
		PreparedStatement pst1 = connection.prepareStatement
				("select max(id) from departement");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setString(2 , nom);
		pst.executeUpdate();
	}
}