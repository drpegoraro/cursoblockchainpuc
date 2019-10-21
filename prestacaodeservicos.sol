pragma solidity 0.5.12;
   
contract PrestacaoDeServicos
{
    string public prestador;
    string public empresa;
    uint256 public  valorHora;
    uint256 public horasTrabalhadas;
    bool[] public statusPagamento;
    address payable contaPrestador;
    address contaEmpresa;
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
        address payable ncontaprestador,
        address ncontaempresa
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
    
    function calculoremuneracaoFinal () public view returns (uint remuneracaoFinal)
    {
        remuneracaoFinal = valorHora*horasTrabalhadas;

//condiç~ão para a ter uma remuneraç~ão m´ínima de 1.000 ether

        if (remuneracaoFinal<1000)
        {    
            remuneracaoFinal = 1000;
            return remuneracaoFinal;
        }
     }
// a duração do contrato é de 365 dias
        // dúvida: cada vez que abrir o contrato ele entende o "now" como a data da 1a. abertura ou o tempo agora?
        
    function vigenciaContrato () public view returns (uint dataInicioContrato, uint dataFinalContrato)
    {
        dataInicioContrato = now;
        dataFinalContrato = dataInicioContrato+365 days;
    }
//data vencimento mensal a cada 30 dias (queria todo o dia 10, mas n~ão consegui)
    function dataVencimentoMensal () public returns (uint segundoAoDia, uint dataVencimentoMensal)
    {
        segundoAoDia=86400;
        dataVencimentoMensal=30*segundoAoDia;
        for (uint i=1; i<12; i++)  
        {}
        
    } 
    
    function saldoNoContrato () public view returns (uint) 
    {
        return address(this).balance;
    }

    function efetuarPagamento() public payable
    {
        require (msg.sender == contaEmpresa, "SOMENTE EMPRESA PODE PAGAR");
        
        // preciso informar que o valor a ser transferido é a remuneracaoFinal. Como faço?
        
        contaPrestador.transfer(address(this).balance);
        statusPagamento.push(true);
        emit pagamentoRealizado(msg.value);
    }
}
