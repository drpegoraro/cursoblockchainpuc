pragma solidity 0.5.12;
   
    contract PrestacaoDeServicos
{
    string public prestador;
    string public empresa;
    uint256 public  valorHora;
    uint256 public horasTrabalhadas;
    bool[] public statusPagamento;
    address public contaPrestador;
    address payable contaEmpresa;
    bool public pago;
    bool public retirado;
    
    event pagamentoRealizado (uint valor);
    
   /* modifier autorizadoRecebimento () {
        require (msg.sender == prestador, "SOMENTE O PRESTADOR DE SERVIÇOS PODE RECEBER");
        _;    
    }
    
    modifier autorizadoPagamento () {
        require (msg.sender == empresa, "SOMENTE A EMPRESA PODE PAGAR");
        _;
    }
*/
    constructor (
        string memory nomePrestador,
        string memory nomeEmpresa,
        uint256 valorHoraTrabalho,
        uint256 numeroHorasTrabalhadas,
        address ncontaprestador,
        address payable ncontaempresa
        ) public
        
        {
// require para que o contrato seja limitado a no m´áximo 66.000 ether
        
        require (valorHoraTrabalho<=300, "O VALOR DA HORA ULTRAPASSOU O LIMITE");
        require (numeroHorasTrabalhadas<=220, "O NÚMERO DE HORAS ULTRAPASSOU O LIMITE");
        
        prestador = nomePrestador;
        empresa = nomeEmpresa;
        valorHora = valorHoraTrabalho;
        horasTrabalhadas = numeroHorasTrabalhadas;
        contaPrestador = ncontaprestador;
        contaEmpresa = ncontaempresa;
        }
    
    function calculoremuneracaoFinal () public view returns (uint256 remuneracaoFinal)
    {
        remuneracaoFinal = valorHora*horasTrabalhadas;

//condiç~ão para a ter uma remuneraç~ão m´ínima de 1.000 ether

        if (remuneracaoFinal<1000)
        {    
            remuneracaoFinal = 1000;
            return remuneracaoFinal;
        }
     }

//contrato tem duração de 12 meses
    function calculonumeroParcela () public pure returns (uint256 numeroParcela)
    {
        require (numeroParcela<12, "O CONTRATO EXPIROU. DURAÇÃO DE 12 MESES");
        for (uint i=1; numeroParcela<12; i++) {
            numeroParcela = numeroParcela + 1;
        }
    } 
    
        function saldoNoContrato () public view returns (uint) 
    {
        return address(this).balance;
    }

    function efetuarPagamento() public payable
    {
        require (msg.sender == contaEmpresa, "SOMENTE EMPRESA PODE PAGAR");
        
        // preciso informar que o valor a ser transferido é a remuneracaoFinal. Como faço?
        
        contaEmpresa.transfer (calculoremuneracaoFinal ());
        statusPagamento.push(true);
        emit pagamentoRealizado (msg.value);
    }
}
