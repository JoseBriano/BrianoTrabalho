/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bean.Usuario;
import model.DAO.UsuarioDAO;

/**
 *
 * @author Senai
 */
@WebServlet(urlPatterns = {"/criar", "/logar"})
@MultipartConfig
public class Login extends HttpServlet {

    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDao = new UsuarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageMasc = "/pages/login.jsp";

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageMasc);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        if (action.equals("/logar")) {
            logar(request, response);
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        if (action.equals("/criar")) {
            user(request, response);
        } else {
            processRequest(request, response);
        }

    }
// logica do cadastro de usuario
    protected void user(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        usuario.setNome(request.getParameter("nome"));
        usuario.setSenha(request.getParameter("senha"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setCpf(request.getParameter("cpf"));
        usuario.setTelefone(request.getParameter("telefone"));
        if (usuario.getNome().trim().equals("") || usuario.getSenha().trim().equals("") || usuario.getEmail().trim().equals("") || usuario.getCpf().trim().equals("") || usuario.getTelefone().trim().equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Por favor, preencha todos os campos.');");
            out.println("window.location.href = './Login';");
            out.println("</script>");
        } else {
            usuarioDao.create(usuario);
            response.sendRedirect("redirect.jsp");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro feito com Sucesso!.');");
            out.println("window.location.href = './Login   ';");
            out.println("</script>");
        }

    }
 //logica para login
    protected void logar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        usuario.setEmail(request.getParameter("email"));
        usuario.setSenha(request.getParameter("senha"));
        if (usuario.getEmail().trim().equals("") || usuario.getSenha().trim().equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Por favor, preencha todos os campos.');");
            out.println("window.location.href = './Login';");
            out.println("</script>");
        } else {
            //valida se é usuario ou adm
            usuarioDao.logar(usuario);
            System.out.println(usuario.getIdUsuario());
            if (usuario.getIdUsuario() ==1 ) {
                response.sendRedirect("./adm");
                
                }else if(usuario.getIdUsuario() >0){
                    response.sendRedirect("redirect.jsp");
                }else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Por favor, faça o cadastro.');");
                    out.println("window.location.href = './Login';");
                    out.println("</script>");
                }
            } 
        }
    }


