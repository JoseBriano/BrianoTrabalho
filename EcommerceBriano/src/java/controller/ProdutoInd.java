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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.DAO.CarrinhoDAO;
import model.DAO.ProdutosDAO;
import model.Bean.Produtos;
import model.Bean.Carrinho;


@WebServlet(urlPatterns = "/enviarc")
@MultipartConfig
public class ProdutoInd extends HttpServlet {

    Carrinho objProduto = new Carrinho();
    CarrinhoDAO objProdutoDao = new CarrinhoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProdutosDAO produto = new ProdutosDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        List<Produtos> produtos = produto.ler1(id);
        request.setAttribute("produto", produtos);
        String url = "/pages/produto.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        if (action.equals("/enviarc")) {
            produto(request, response);
        } else {
            processRequest(request, response);
        }

    }

    protected void produto(HttpServletRequest request, HttpServletResponse response)
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

        objProduto.setNomeCarrinho(request.getParameter("nomeCarrinho"));
        objProduto.setPrecoCarrinho(Float.parseFloat(request.getParameter("preco")));
        objProduto.setDescricaoCarrinho(request.getParameter("descricao"));
        objProduto.setImagemCarrinho(imageBytes);
        objProduto.setQuantidadeCarrinho(Integer.parseInt(request.getParameter("quantidade")));
        objProduto.setTamanho(Integer.parseInt(request.getParameter("tamanho")));
        objProduto.setIdProdutos(Integer.parseInt(request.getParameter("idProduto")));
        objProdutoDao.create(objProduto);
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Comprafeita com sucesso.');");
        out.println("window.location.href = './pages/produto.jsp';");
        out.println("</script>");
        response.sendRedirect("redirect.jsp");
      

    }

}
