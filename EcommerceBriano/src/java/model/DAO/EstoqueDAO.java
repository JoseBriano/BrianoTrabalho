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
import model.Bean.Estoque;

/**
 *
 * @author Senai
 */
public class EstoqueDAO {
    public List<Estoque> ler() {
        List<Estoque> estoques = new ArrayList();
        
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conexao.prepareStatement("SELECT * FROM Estoque");
            rs = stmt.executeQuery();
            
            while(rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setIdEstoque(rs.getInt("idEstoque"));
                estoque.setNome(rs.getString("nome"));
                estoque.setImagem(rs.getBytes("imagem"));
                estoque.setCategoria(rs.getString("categoria"));
                estoque.setPreco(rs.getFloat("preco"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                
                estoques.add(estoque);
            }
            rs.close();
            stmt.close();
            conexao.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return estoques;
    }
}
