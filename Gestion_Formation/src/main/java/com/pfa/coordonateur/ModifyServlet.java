package com.pfa.coordonateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfa.connectionProvide.ConnectionProvider;

@WebServlet("/coordonnateur/modify")
public class ModifyServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {  
		try {
			RequestDispatcher rd = null ; 
		    PrintWriter out = response.getWriter();
		    String action = request.getParameter("action");
		    switch (action) {
		    case "1" :
		    	// update grade 

		    	updateGrade(Integer.parseInt(request.getParameter("id_grade")), request.getParameter("nom"));
		    	response.sendRedirect("./grade.jsp");
		    	break ;
		    case "2" :
		    	// update niveau
		    	updateNiveau(Integer.parseInt(request.getParameter("id_niveau")),request.getParameter("nom"));
		    	response.sendRedirect("./niveau.jsp");
		    	break ;
		    case "3" : 
		    	// update departement

		    	updateDepart(Integer.parseInt(request.getParameter("id_departement")),request.getParameter("nom"));
		    	response.sendRedirect("./departement.jsp");
		    	break;
		    case "4" : 
		    	// update enseignant

		    	updateEns(Integer.parseInt(request.getParameter("id_ens")),
		    			request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("genre") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("grade") , 
		    			request.getParameter("department") , 
		    			request.getParameter("element"));
		    	response.sendRedirect("./Enseignant.jsp");
		    	break;
		    case "5" : 

		    	updateEtu(Integer.parseInt(request.getParameter("id_etu")),
		    			request.getParameter("nom") , request.getParameter("prenom") , 
		    			request.getParameter("email") , 
		    			request.getParameter("type") , 
		    			request.getParameter("adresse") , 
		    			request.getParameter("niveau") , 
		    			request.getParameter("formation"));
		    	response.sendRedirect("./etudiant.jsp");
		    	break;
		    case "6" :
		    	// update grade 
		    	updateModule(request.getParameter("nom") ,Integer.parseInt(request.getParameter("id_formation")) , Integer.parseInt(request.getParameter("id_module")));
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
	public void updateModule(String nom, int id_formation , int id_module) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update module set nom=?,id_form=? where id=?");
		pst.setString(1, nom);
		pst.setInt(2 , id_formation);
		pst.setInt(3 , id_module);
		pst.executeUpdate();
	}
	public void updateGrade(int id ,String nom) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update grade set nom=? where id=?");
		pst.setString(1 , nom);
		pst.setInt(2, id);
		pst.executeUpdate();
	}
	public void updateEns(int id , String nom , String prenom , String email , String type , String adresse , String grade , String department , String elemnt) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update enseignant set nom=?,prenom=?,email=?,type=?,id_grade=(select id from grade where nom=?),id_dep=(select id from department where nom=?) where id=?");
		pst.setString(1 , nom);
		pst.setString(2 , prenom);
		pst.setString(3, email);
		pst.setString(4 , type);
		pst.setString(5 , grade);
		pst.setString(6,department);
		pst.setInt(7, id);
		pst.executeUpdate();
		pst = connection.prepareStatement
				("update vacation set id_elem=(select id from element where nom=? ) where id_ens=?");
		pst.setString(1, elemnt);
		pst.setInt(2, id);
	}
	public void updateEtu(int id , String nom , String prenom , String email , String genre , String adresse , String niveau , String formation ) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update enseignant set nom=?,prenom=?,email=?,genre=?,adresse=?,id_niv=(select id from niveau where nom=?) where id=?");
		pst.setString(1 , nom);
		pst.setString(2 , prenom);
		pst.setString(3,  email);
		pst.setString(4 , genre);
		pst.setString(5 , adresse);
		pst.setString(6,  niveau);
		pst.setInt(7, id);
		pst.executeUpdate();
		pst = connection.prepareStatement
				("update inscription set id_form=(select id from formation where nom=? ) where id_et=?");
		pst.setString(1, formation);
		pst.setInt(2, id);
		pst = connection.prepareStatement
				("update paiement set id_inscr_form=(select id from formation where nom=? ) where id_inscr_et=?");
		pst.setString(1, formation);
		pst.setInt(2, id);
	}
	public void updateNiveau(int id ,String nom) throws Exception  {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update niveau set nom=? where id=?");
		pst.setInt(1, id);
		pst.setString(2 , nom);
		pst.executeUpdate();
	}
	public void updateDepart(int id ,String nom) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("update departement set nom=? where id=?");
		pst.setInt(1, id);
		pst.setString(2 , nom);
		pst.executeUpdate();
	}
}