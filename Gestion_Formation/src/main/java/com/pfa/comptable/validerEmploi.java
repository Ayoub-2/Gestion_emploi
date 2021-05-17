package com.pfa.comptable;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfa.connectionProvide.ConnectionProvider;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Set;

@WebServlet("/emploi")
public class validerEmploi extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {  
		try {
			System.out.println("validerEmploi , Post received") ;
		    PrintWriter out = response.getWriter();
		    String ProgrammeEmpl = request.getParameter("ProgrammeEmpl");
		    String Responsable = request.getParameter("Responsable");
		    String Exercice = request.getParameter("Exercice");
		    String Intitule = request.getParameter("Intitule");
		    String ID_formation = request.getParameter("ID_formation");
		    HashMap<String, String[]> parMap = new HashMap<>(request.getParameterMap());
		    parMap.remove("ProgrammeEmpl");
	    	parMap.remove("ID_formation");
	    	parMap.remove("Responsable");
	    	parMap.remove("Exercice");
	    	parMap.remove("Intitule");
		    Set<String> parameterNames = parMap.keySet();
		    int vpe = validateProgrammeEmp(request, ProgrammeEmpl, ID_formation, Intitule, Responsable, Exercice, parameterNames);
		    boolean vr = false;
		    if(vpe == 1) {
		    	vr = validateRubriques(request, ProgrammeEmpl, parameterNames);
		    }
		    
		    if(vr){
		    	System.out.println("Fin valider Emploi") ;
		    	response.sendRedirect("admin/index.jsp"); 
		    } 
		    else{  
		        System.out.println("EROOR valider Emploi ");  
		        RequestDispatcher rd=request.getRequestDispatcher("comptable-table-emploi.jsp");
		        rd.include(request,response);
		    }
		          
		    out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int validateProgrammeEmp(HttpServletRequest request, String ProgrammeEmpl, String ID_formation, String Intitule, String Responsable, String Exercice, Set<String> parameterNames) throws SQLException, ParseException {
		Connection connection = new ConnectionProvider().getConnection();
		    if(ProgrammeEmpl != null) {
		    	System.out.println("ProgrammeEmpl Not NULL : "+ProgrammeEmpl);
		    	PreparedStatement ps = 
		    	connection.prepareStatement
		    	("SELECT ID FROM programmeemp WHERE ID = ?");
		    	ps.setInt(1,Integer.parseInt(ProgrammeEmpl));
		    	ResultSet rs1 = ps.executeQuery();
		    	if (rs1.next()) { //deja exist
		    		PreparedStatement pst;
				    if(Intitule != null) {
						pst = connection.prepareStatement("UPDATE programmeemp SET Intitule = ?");
				    	pst.setString(1,Intitule);
				    	pst.executeUpdate();
				    }
				    if(Responsable != null) {
				    	pst = connection.prepareStatement("UPDATE programmeemp SET Responsable = ?");
				    	pst.setString(1,Responsable);
				    	pst.executeUpdate();
				    }
				    
				    if(Exercice != null) {
				    	Date date = new SimpleDateFormat("DD/MM/YYYY").parse(Exercice);
				    	pst = connection.prepareStatement("UPDATE programmeemp SET Exercice = ?");
				    	pst.setDate(1,new java.sql.Date(date.getTime()));
				    	pst.executeUpdate();
				    }
				    return 1;
		    	}else { //creation et insertion
		    		PreparedStatement pst = connection.prepareStatement
		    				("insert into programmeemp(ID, ID_form, Intitule, Responsable, Exercice) values(?,?,?,?,?);");
		    		pst.setInt(1,Integer.parseInt(ProgrammeEmpl));
		    		pst.setInt(2,Integer.parseInt(ID_formation));
				    if(Intitule != null) {
				    	pst.setString(3,Intitule);
				    }else {
				    	pst.setNull(3, Types.NULL);
				    }
				    
				    if(Responsable != null) {
				    	pst.setString(4,Responsable);
				    }else {
				    	pst.setNull(4, Types.NULL);
				    }
				    
				    if(Exercice != null) {
				    	Date date = new SimpleDateFormat("DD/MM/YYYY").parse(Exercice);
				    	pst.setDate(5,new java.sql.Date(date.getTime()));
				    }else {
				    	pst.setNull(5, Types.NULL);
				    }
				    pst.executeUpdate();
		    	}
		    }
		    return 1;
	}
	
	public boolean validateRubriques(HttpServletRequest request, String ProgrammeEmpl, Set<String> parameterNames) throws SQLException {
		Connection connection = new ConnectionProvider().getConnection();
	    PreparedStatement pst;
	    ResultSet res;
	    boolean etat = true;
	    for(String pname: parameterNames) {
	    	String parameter = request.getParameter(pname);
	    	if(parameter != null) {
	    		if(!parameter.isEmpty()) {
				    	pst = connection.prepareStatement("insert into sortie values(?,?,?,?);");
				    	pst.setInt(1,Integer.parseInt(pname));
				    	pst.setInt(2,Integer.parseInt(ProgrammeEmpl));
				    	Calendar calendar = Calendar.getInstance();
				        java.sql.Date currentDate = new java.sql.Date(calendar.getTime().getTime());
				    	pst.setDate(3,currentDate);
				    	pst.setInt(4,Integer.parseInt(parameter));
				    	pst.executeUpdate();
				    	//etat = etat && res.next();
	    		}
	    	}
	    }
	    return etat;
	}
	
}
