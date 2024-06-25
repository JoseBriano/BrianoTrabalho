
package model.DAO;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bean.Usuario;


public class UsuarioDAO {
    
    //função de fazer o login
    public Usuario logar(Usuario usuario) {
        Usuario usu = new Usuario();

        try {
            //conecta o banco de dados
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            // faz os comandos sql 
            stmt = conexao.prepareCall("SELECT * FROM Usuario WHERE email = ? AND senha = ?");
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            rs = stmt.executeQuery();
            
            
            if(rs.next()){
                Usuario.setIdUsuario(rs.getInt("idUsuario"));
                System.out.println("DAO: "+Usuario.getIdUsuario());
            }
            
         
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usu;
    }

    // função de cadastrar usuario
    public void create(Usuario usuario){
        try{
            
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareCall("INSERT INTO Usuario(nome, senha, email, telefone, cpf) VALUES (?,?,?,?,?)");
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSenha());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getTelefone());
            stmt.setString(5, usuario.getCpf());
            stmt.executeUpdate();

            
            stmt.close();
            conexao.close();
            System.out.println("deu certo");

        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    // função para ler os usuarios
    public List<Usuario> leia() {
        List<Usuario> usuario = new ArrayList<>();
        try {
            
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM Usuario");
            rs = stmt.executeQuery();

            // le os resultados da consuta e cri um objeto 
            while (rs.next()) {
                Usuario usu = new Usuario();
                Usuario.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNome(rs.getString("nome"));
                usu.setSenha(rs.getString("senha"));
                usu.setTelefone(rs.getString("telefone"));
                usu.setCpf(rs.getString("cpf"));
                usuario.add(usu);
            }

         
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // retorna a lista de usuários 
        return usuario;
    }
}