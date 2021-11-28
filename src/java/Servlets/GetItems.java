/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Item;
import Utils.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kenan
 */
@WebServlet(name = "GetItems", urlPatterns = {"/GetItems"})
public class GetItems extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Object itemListObject = session.getAttribute("itemList");
            ArrayList<Item> itemList = new ArrayList<Item>();
            
            if(itemListObject == null){
                itemList = new ArrayList<Item>();
            }
            else{
                itemList = (ArrayList<Item>)itemListObject;
            }
            itemList.clear();   //zbog buttona unutar userPanel.jsp se svakim pozivom ova lista puni svim clanovima baze
            
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            String query = "SELECT * FROM items;";
            
            try {
                con = DB.getInstance().getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);
                
                while(rs.next()){
                    Item item1 = new Item();
                    item1.setItemId(rs.getInt("id"));
                    item1.setItemName(rs.getString("name"));
                    item1.setItemDescription(rs.getString("description"));
                    item1.setItemPrice(rs.getDouble("price"));
                    //stmt.close();
                    itemList.add(item1);
                    System.out.println(item1.getItemName());
                }
            } catch (SQLException e) {
                out.print(e.getMessage());
            }
            
            session.setAttribute("itemList", itemList);
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
