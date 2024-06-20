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
import model.Bean.Carrinho;

/**
 *
 * @author Senai
 */
public class CarrinhoDAO {

    public List<Carrinho> leia() {
        List<Carrinho> carrinho = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareCall("SELECT * FROM Carrinho");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Carrinho cro = new Carrinho();
                cro.setIdCarrinho(rs.getInt("idCarrinho"));
                cro.setNomeCarrinho(rs.getString("nome_carrinho"));
                cro.setImagemCarrinho(rs.getBytes("imagem"));
                cro.setDescricaoCarrinho(rs.getString("descricao_carrinho"));
                cro.setTamanho(rs.getInt("tamanho"));
                cro.setPrecoCarrinho(rs.getFloat("preco_carrinho"));
                cro.setQuantidadeCarrinho(rs.getInt("quantidade_carrinho"));
                cro.setIdProdutos(rs.getInt("idProdutos"));
                carrinho.add(cro);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carrinho;
    }
    public void create(Carrinho carrinho) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO Carrinho(nome_carrinho, imagem, descricao_carrinho, preco_carrinho, quantidade_carrinho, idProdutos) SELECT p.nome, p.imagem, p.descricao, p.preco, p.quantidade, ? FROM Produtos p WHERE p.idProdutos = ?");
            stmt.setInt(1, carrinho.getIdProdutos());
            stmt.setInt(2, carrinho.getIdProdutos());
            stmt.executeUpdate();

            stmt.close();
            conexao.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
