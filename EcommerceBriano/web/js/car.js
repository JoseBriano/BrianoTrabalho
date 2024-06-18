document.querySelectorAll('btn-comprar').forEach(btn => {
    btn.addEventListener('click', function() {
        var idProduto = this.getAttribute('data-id');
        var descricao = this.getAttribute('data-descricao');
        var nome = this.getAttribute('data-nome');
        var preco = this.getAttribute('data-preco');
        var imagem = this.getAttribute('data-imagem');
        var quantidade = this.getAttribute('data-quantidade');
        var tamanho = this.getAttribute('data-tamanho');
        
        
        // Crie um novo objeto FormData
        var formData = new FormData();
        
        // Adicione os dados do produto ao FormData
        formData.append('idProduto', idProduto);
        formData.append('descricao', descricao);
        formData.append('nomeCarrinho', nome);
        formData.append('preco', preco);
        formData.append('quantidade',quantidade);
        formData.append('tamanho',tamanho);
        
        // Crie um Blob a partir do base64 da imagem
        var byteCharacters = atob(imagem);
        var byteNumbers = new Array(byteCharacters.length);
        for (var i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
        }
        var byteArray = new Uint8Array(byteNumbers);
        var blob = new Blob([byteArray], { type: 'image/png' });
        
        // Adicione a imagem ao FormData
        formData.append('imagem', blob, 'imagem.png');
        
        // Envie o FormData
        fetch('enviarc', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Ocorreu um erro ao enviar o formulário.');
            }else{
                
                window.location.href = 'redirect.jsp';
            }
           
        })
        .catch(error => {
            console.error('Erro:', error);
        });
    });
});

