/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Bean;

import java.util.Base64;

public class Produtos {
    private int idProdutos;
    
    public int getIdProdutos() {
        return idProdutos;
    }

    public void setIdProdutos(int idProdutos) {
        this.idProdutos = idProdutos;
    }
    private String nome;
    private byte[] imagem;
    private String categoria;
    private String descricao;
    private String tamanho;

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public Produtos(String tamanho) {
        this.tamanho = tamanho;
    }
    private float preco;
    private int quantidade;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Produtos(int idProdutos) {
        this.idProdutos = idProdutos;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Produtos(String nome, byte[] imagem, String categoria, String descricao, float preco, int quantidade) {
        this.nome = nome;
        this.imagem = imagem;
        this.categoria = categoria;
        this.descricao = descricao;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    public Produtos() {
    }
     public String getImagemBase64() {
        if (imagem != null) {
            return Base64.getEncoder().encodeToString(imagem);
        } else {
            return "";
        }
    }
}
