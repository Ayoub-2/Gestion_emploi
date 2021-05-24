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

@WebServlet("/coordonnateur/delete")

public class DelServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {  
		try {
			RequestDispatcher rd = null ; 
		    PrintWriter out = response.getWriter();
		    String action = request.getParameter("action");
		    switch (action) {
		    case "1" :
		    	// del grade 
		    	try {
		    	DelGrade(Integer.parseInt(request.getParameter("del_id")));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressayer");
		    		break;
		    	}
		    	response.sendRedirect("./grade.jsp");
		    	break ;
		    case "2" :
		    	// del niveau
		    	try {
		    	DelNiveau(Integer.parseInt(request.getParameter("del_id")));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressayer");
		    		break;
		    	}
		    	response.sendRedirect("./niveau.jsp");
		    	break ;
		    case "3" : 
		    	// del departement
		    	try {
		    	DelDep(Integer.parseInt(request.getParameter("del_id")));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressayer");
		    		break;
		    	}
		    	response.sendRedirect("./departement.jsp");
		    	break;
		    case "4" : 
		    	// del enseignant
		    	try {
		    	DelENS(Integer.parseInt(request.getParameter("del_id")));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressayer");
		    		break;
		    	}
		    	response.sendRedirect("./Enseignant.jsp");
		    	break;
		    case "5" : 
		    	// del etudiant
		    	try {
		    	DelEtu(Integer.parseInt(request.getParameter("del_id")));
		    	} catch (Exception e) {
		    		out.print("An erreur a occuré veuillez ressayer");
		    		break;
		    	}
		    	response.sendRedirect("./etudiant.jsp");
		    	break;
		    case "6" : 
		    	DelModule(Integer.parseInt(request.getParameter("del_id")));
		    	response.sendRedirect("./modules.jsp");
		    default : 
		    	response.sendRedirect("./index.jsp");
		    }
	        
		    out.close();
		
		} catch (Exception e ) { 
			e.printStackTrace();
		}
	}
	public void DelGrade(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement("DELETE from grade where id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	public void DelModule(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement("DELETE from vacation where id_elem=(select id from element where id_module=?)");
		pst.setInt(1, id);
		pst.executeUpdate();
		pst = connection.prepareStatement("DELETE from element where id_module=?");
		pst.setInt(1, id);
		pst.executeUpdate();
		pst = connection.prepareStatement("DELETE from module where id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	public void DelNiveau(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("DELETE from niveau where id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	public void DelDep(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement
				("DELETE from departement where id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	public void DelENS(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement("DELETE from dates where id_vac = (Select id from vacation where id_ens=?)");
		PreparedStatement pst1 = connection.prepareStatement("DELET from vacation where id_ens=? ");
		PreparedStatement pst2= connection.prepareStatement("DELETE from enseignant where id=?");
		pst.setInt(1, id);pst1.setInt(1, id);pst2.setInt(1, id);
		pst.executeUpdate();pst1.executeUpdate();pst2.executeUpdate();
		}
	public void DelEtu(int id) throws Exception {
		Connection connection = new ConnectionProvider().getConnection();
		PreparedStatement pst = connection.prepareStatement("DELETE from paiement where ID_INSCR_ET=?");
		PreparedStatement pst1 = connection.prepareStatement("DELETE from inscripton where id_et =?");
		PreparedStatement pst2 = connection.prepareStatement("DELETE from etudiant where id=?");
		pst.setInt(1, id);pst1.setInt(1, id);pst2.setInt(1, id);
		pst.executeUpdate();pst1.executeUpdate();pst2.executeUpdate();
	}
	
}