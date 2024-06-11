//Codigo do Paulo do calculo de frete
function validarCEP(cep) {

    var cepRegex = /^[0-9]{8}$/;
    return cepRegex.test(cep);
}
function calcularFrete() {
    var cep = document.getElementById("cep").value;

    // Limpa mensagens anteriores
    document.getElementById("feedback-message").className = "alert"; // Remove a classe 'show' para animação de desaparecimento

    // Validação do CEP
    if (!validarCEP(cep)) {

        mostrarMensagem("danger", "Por favor, insira um CEP válido.");
        return;
    }

    mostrarSpinner();

    // URL da API de cálculo de frete


    // Chamada AJAX para calcular o frete usando jQuery
    $.ajax({
        url: 'https://cepcerto.com/ws/json/' + cep,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log('Dados da API de CEP:', data);

            let logradouro = data.logradouro;
            document.getElementById("shipping-cost").textContent = "R$ " + 10;
            // Obtém o valor atual do custo total (sem o "R$ " e convertido para número)
            var currentTotalCost = parseFloat(document.getElementById("total-cost").innerText.replace("R$", ""));
            // Calcula o novo custo total somando o custo do frete ao custo total atual
            var totalCost = currentTotalCost + 10;

            document.getElementById("total-cost").textContent = "R$" + totalCost.toFixed(2); // Formata o novo custo total com duas casas decimais

            mostrarMensagem("success", "Endereço: " + logradouro + ". Custo do frete: R$ " + 10);
            esconderSpinner();
        },
        error: function (error) {
            esconderSpinner();
            console.error('Erro na requisição:', error);
            mostrarMensagem("danger", "Ocorreu um erro ao calcular o frete. Por favor, tente novamente.");
            console.log('Erro na requisição:', error);
        }
    });
}
