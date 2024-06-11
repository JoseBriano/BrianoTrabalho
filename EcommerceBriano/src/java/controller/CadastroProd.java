/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Bean.  Produtos;
import model.Bean.Usuario;
import model.DAO.ProdutosDAO;
import model.DAO.UsuarioDAO;

/**
 *
 * @author Senai
 */
@WebServlet(urlPatterns = {"/criarprt"})
@MultipartConfig
public class CadastroProd extends HttpServlet {
Produtos produto = new Produtos();
    ProdutosDAO produtoDao = new ProdutosDAO();
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
         String pageCad = "/pages/cadastroProd.jsp";
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageCad);
        dispatcher.forward(request, response);
    
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
        String action = request.getServletPath();
        if (action.equals("/criarprt")) {
            create(request, response);
        } else {
            processRequest(request, response);
        }

    }
    
        protected void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("imagem");
        InputStream inputStream = filePart.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();

        produto.setImagem(imageBytes);
        produto.setNome(request.getParameter("nome"));
        produto.setCategoria(request.getParameter("categoria"));
        produto.setDescricao(request.getParameter("descricao"));
        produto.setTamanho(request.getParameter("tamanho"));
        produto.setPreco(Float.parseFloat(request.getParameter("preco")));
        produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        if (produto.getNome().trim().equals("") || produto.getCategoria().trim().equals("") || produto.getDescricao().trim().equals("") || produto.getTamanho().trim().equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Por favor, preencha todos os campos.');");
            out.println("window.location.href = './CadastroProd;");
            out.println("</script>");
        } else {
            produtoDao.create(produto);
            response.sendRedirect("redirect.jsp");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro feito com Sucesso!.');");
            out.println("window.location.href = './CadastroProd;");
            out.println("</script>");
        }
        //nome, iamgem, categoria, descricao, preco, quantidade

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
