pragma solidity 0.5.12;

contract Aluguel 
{

/* iniciar um comentário com esses caracteres
e fecho com o asterisco e barra
*/ 

// se for so um comentario barra/barra

    string public locatario;

    string public locador;
    
// string é nome
    uint256 private aluguel;
// definir sempre o nome da uint que é função valor

    uint256 constant numeroMaximoLegalDeAlugueisParaMulta = 3;

/* string = texto
    uint = numero inteiro
*/
    constructor(
        string memory nomeLocador,
        string memory nomeLocatario,
        uint256 valorDoAluguel)
    public 
    {
        locador = nomeLocador;
        locatario = nomeLocatario;
        aluguel = valorDoAluguel;
    }
    function valorAtualDoAluguel() public view returns (uint256) 
    {
        return aluguel;
    }
    function simulaMulta (uint256 mesesRestantes,
                    uint256 totalMesesContrato)
    public
    view
    returns(uint256 valorMulta) 
    {
        valorMulta = aluguel*numeroMaximoLegalDeAlugueisParaMulta;
        valorMulta = valorMulta/totalMesesContrato;
        valorMulta = valorMulta*mesesRestantes;
        return valorMulta;
    }
    function reajusteAluguel (uint256 percentualReajuste) public
    {
        if (percentualReajuste >20)
        {
            percentualReajuste = 20;
        }
        uint256 valorDoAcrescimo = 0;
        valorDoAcrescimo = ((aluguel*percentualReajuste)/100);
        aluguel = aluguel + valorDoAcrescimo;
    }
    function aditamentoValorAluguel(uint256 valorCerto) public
    {
        aluguel = valorCerto;
    }
    function aplicaMulta (uint256 mesesRestantes, uint256 percentual) public
    {
        require(mesesRestantes<30, "Período de contrato inválido");
        for (uint i=1; i<mesesRestantes; i++){
            aluguel = aluguel+((aluguel*percentual)/100);
        }
        }
    }
