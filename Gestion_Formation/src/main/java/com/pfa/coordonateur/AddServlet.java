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

@WebServlet("/coordonnateur/add1")
public class AddServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {  
		try {
			RequestDispatcher rd = null ; 
		    PrintWriter out = response.getWriter();
		    String action = request.getParameter("action");
		    switch (action) {
		    case "1" :
		    	// add grade 
		    	AddGrade(request.getParameter("nom"));
		    	response.sendRedirect("./grade.jsp");
		    	break ;
		    case "2" :
		    	// add niveau
		    	AddNiveau(request.getParameter("nom"));
		    	response.sendRedirect("./niveau.jsp");
		    	break ;
		    case "3" : 
		    	// add departement
		    	AddDepart(request.getParameter("nom"));
		    	response.sendRedirect("./departement.jsp");
		    	break;
		    case "4" : 
		    	// add enseignant
		    	AddEns(request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("genre") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("grade") , 
		    			request.getParameter("department") , 
		    			request.getParameter("element"));
		    	response.sendRedirect("./Enseignant.jsp");
		    	break;
		    case "5" : 
		    	AddEtu(request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("genre") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("niveau") , 
		    			request.getParameter("formation"));
		    	response.sendRedirect("./etudiant.jsp");
		    	break;
		    case "5_f" :
		    	// add grade 
		    	AddEtu_form( Integer.parseInt(request.getParameter("id_etu")), Integer.parseInt(request.getParameter("id_formation")));
		    	response.sendRedirect("./grade.jsp");
		    	break ;
		    case "6" :
		    	// add grade 
		    	AddModule(request.getParameter("nom") ,Integer.parseInt(request.getParameter("id_formation")));
		    	response.sendRedirect("./modules.jsp");
		    	break ;
		    case "7" :
		    	// add grade 
		    	AddElement(request.getParameter("nom") ,Integer.parseInt(request.getParameter("id_ens")), Integer.parseInt(request.getParameter("id_module")));
		    	response.sendRedirect("./modules.jsp");
		    	break ;
		    default : 
		    	response.sendRedirect("./index.jsp");
		    }
	        
		    out.close();
		
		} catch (Exception e ) { 
			e.printStackTrace();
		}
	}
	public void AddGrade(String nom) throws Exception {
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
	public void AddModule(String nom, int id_formation) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into module values(?,? , ?);");
		PreparedStatement pst1 = connection.prepareStatement
				("select max(id) from module");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setInt(2 , id_formation);
		pst.setString(3 , nom);
		pst.executeUpdate();
	}
	public void AddElement(String nom, int id_ens , int id_module) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("insert into element values(?,?,?);");
		PreparedStatement pst1 = connection.prepareStatement
				("select max(id) from element");
		ResultSet rs = pst1.executeQuery(); 
		rs.next();
		int id_elem = rs.getInt(1) +1 ;
		pst.setInt(1, id_elem);
		pst.setInt(2 , id_module);
		pst.setString(3 , nom);
		pst.executeUpdate();pst.close();
		 pst1 = connection.prepareStatement
				("select max(id) from vacation");
		 rs = pst1.executeQuery(); 
		pst = connection.prepareStatement
				("insert into vacation(id, id_ens , id_elem) values(?,?,?) ");
		rs.next();
		pst.setInt(1, rs.getInt(1) + 1);
		pst.setInt(2 , id_ens);
		pst.setInt(3 , id_elem);
		pst.executeUpdate();
	}
	public void AddEns(String nom , String prenom , String email , String genre , String adresse , String grade , String department , String elemnt) throws Exception {
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
	public void AddEtu_form(int id_etu , int id_formation) throws Exception {
		Connection con = new ConnectionProvider().getConnection();
		PreparedStatement st= con.prepareStatement("insert into inscription(id_et , id_form) values (?,?)");
		//PreparedStatement st1= con.prepareStatement("insert into paiement(id_et , id_form) values (?,?)"); // create the recu 
		st.setInt(1,  id_etu);
		st.setInt(2, id_formation);
		st.executeUpdate();
	}
	public void AddEtu(String nom , String prenom , String email , String genre , String adresse , String niveau , String formation ) throws Exception {
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
	public void AddNiveau(String nom) throws Exception  {
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
	public void AddDepart(String nom) throws Exception {
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