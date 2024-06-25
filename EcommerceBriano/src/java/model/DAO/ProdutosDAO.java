
package model.DAO;

import conexao.Conexao; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bean.Produtos;


public class ProdutosDAO {
    
    // Função que lê e retorna todos os produtos do banco de dados
    public List<Produtos> ler() {
        List<Produtos> produtos = new ArrayList(); // cria uma lista para armazenar os produtos
        
        try {
            Connection conexao = Conexao.conectar(); // conexão com o banco
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            // faz a consulta sql para buscar todos os produtos
            stmt = conexao.prepareStatement("SELECT * FROM Produtos");
            rs = stmt.executeQuery();
            
            // le os resultados da consulta e cria objetos Produtos para cada produto encontrado
            while(rs.next()) {
                Produtos produto = new Produtos();
                //define os atributos do produto com base nos dados do banco de dados
                produto.setIdProdutos(rs.getInt("idProdutos"));
                produto.setNome(rs.getString("nome"));
                produto.setImagem(rs.getBytes("imagem"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setTamanho(rs.getString("tamanho"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setQuantidade(rs.getInt("quantidade"));
                
                produtos.add(produto); // adiciona o produto à lista de produtos do banco de dados
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
        //função pra criar um novo produto
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            // cadastrao os dados do novo produto na tabela Produtos
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
            System.out.println("Operação de inserção bem-sucedida");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Função para pesquisar um produto pelo seu id 
    public List<Produtos> ler1(int id) {
        List<Produtos> produtos = new ArrayList();

        try {
            // Estabelece conexão com o banco de dados
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
           
            stmt = conexao.prepareStatement("SELECT * FROM Produtos WHERE idProdutos = ?");
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            
            // le o resultado da consulta e cria um objeto Produtos para o produto encontrado
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

    // função para ler e retornar produtos de uma determinada categoria(não concluida)
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

    // Função para buscar e retornar produtos com base em um termo de pesquisa
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