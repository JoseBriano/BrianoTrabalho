/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bean.Produtos;


/**
 *
 * @author Senai
 */
public class ProdutosDAO {
     public List<Produtos> ler() {
        List<Produtos> produtos = new ArrayList();
        
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conexao.prepareStatement("SELECT * FROM Produtos");
            rs = stmt.executeQuery();
            
            while(rs.next()) {
                Produtos produto = new Produtos();
                produto.setIdProdutos(rs.getInt("idProdutos"));
                produto.setNome(rs.getString("nome"));
                produto.setImagem(rs.getBytes("imagem"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setTamanho(rs.getString("tamanho"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setQuantidade(rs.getInt("quantidade"));
                
                produtos.add(produto);
            }
            rs.close();
            stmt.close();
            conexao.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }
     public void create(Produtos produto) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareCall("INSERT INTO Produtos(nome, imagem, descricao, tamanho, preco, quantidade) VALUES (?,?,?,?,?,?)");
            stmt.setString(1, produto.getNome());
            stmt.setBytes(2, produto.getImagem());
            stmt.setString(3, produto.getDescricao());
            stmt.setString(4, produto.getTamanho());
            stmt.setFloat(5, produto.getPreco());
            stmt.setInt(6, produto.getQuantidade());
            stmt.executeUpdate();

            stmt.close();
            conexao.close();
            System.out.println("deu certo");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public List<Produtos> ler1( int id) {
        List<Produtos> produtos = new ArrayList();
        
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conexao.prepareStatement("SELECT * FROM Produtos WHERE idProdutos = ?");
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            
            
            while(rs.next()) {
                Produtos produto = new Produtos();
                produto.setIdProdutos(rs.getInt("idProdutos"));
                produto.setNome(rs.getString("nome"));
                produto.setImagem(rs.getBytes("imagem"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setTamanho(rs.getString("tamanho"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setQuantidade(rs.getInt("quantidade"));
                
                produtos.add(produto);
            }
            rs.close();
            stmt.close();
            conexao.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }
     public List<Produtos> leia2(String categoria) {
        List<Produtos> produto = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM Produtos WHERE Categoria = ?");
            stmt.setString(1, categoria);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produtos prt = new Produtos();
                prt.setIdProdutos(rs.getInt("idProdutos"));
                prt.setNome(rs.getString("nome"));
                prt.setImagem(rs.getBytes("imagem"));
                prt.setCategoria(rs.getString("categoria"));
                prt.setDescricao(rs.getString("descricao"));
                prt.setTamanho(rs.getString("tamanho"));
                prt.setPreco(rs.getFloat("preco"));
                prt.setQuantidade(rs.getInt("quantidade"));
                produto.add(prt);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produto;
    }
      public List<Produtos> leia3(String pesquisar) {
        List<Produtos> produto = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM Produtos WHERE nome LIKE ?");
            stmt.setString(1, "%"+pesquisar+"%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produtos prt = new Produtos();
                prt.setIdProdutos(rs.getInt("idProdutos"));
                prt.setNome(rs.getString("nome"));
                prt.setImagem(rs.getBytes("imagem"));
                prt.setDescricao(rs.getString("descricao"));
                prt.setPreco(rs.getFloat("preco"));
                prt.setQuantidade(rs.getInt("quantidade"));
                produto.add(prt);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produto;
    }
}
