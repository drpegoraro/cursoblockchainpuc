pragma solidity 0.5.12;
   
contract RelatorioDeHorasTrabalhadas

{
    uint256 mes;
    uint256 ano;
    uint256 dia1;
    uint256 dia2;
    uint256 dia3;
    uint256 dia4;
    uint256 dia5;
    uint256 dia6;
    uint256 dia7;
    uint256 dia8;
    uint256 dia9;
    uint256 dia10;
    uint256 dia11;
    uint256 dia12;
    uint256 dia13;
    uint256 dia14;
    uint256 dia15;
    uint256 dia16;
    uint256 dia17;
    uint256 dia18;
    uint256 dia19;
    uint256 dia20;
    uint256 dia21;
    uint256 dia22;
    uint256 dia23;
    uint256 dia24;
    uint256 dia25;
    uint256 dia26;
    uint256 dia27;
    uint256 dia28;
    uint256 dia29;
    uint256 dia30;
    uint256 dia31;

//não consegui declarar os 30 dias, como fazer?
    constructor (
        uint256 mesAtual,
        uint256 anoAtual, 
        uint256 _dia1,
        uint256 _dia2,
        uint256 _dia3,
        uint256 _dia4,
        uint256 _dia5,
        uint256 _dia6,
        uint256 _dia7,
        uint256 _dia8,
        uint256 _dia9,
        uint256 _dia10,
        uint256 _dia11,
        uint256 _dia12,
        uint256 _dia13,
        uint256 _dia14) public
        
        /*uint256 _dia11,
        uint256 _dia12,
        uint256 _dia13,
        uint256 _dia14,
        uint256 _dia15
        ) public
        */
        {
            mes=mesAtual;
            ano=anoAtual;
            dia1=_dia1;
            dia2=_dia2;
            dia3=_dia3;
            dia4=_dia4;
            dia5=_dia5;
            dia6=_dia6;
            dia7=_dia7;
            dia8=_dia8;
            dia9=_dia9;
            dia10=_dia10;
            dia11=_dia11;
            dia12=_dia12;
            dia13=_dia13;
            dia14=_dia14;
        }


/*
        uint256 _dia16,
        uint256 _dia17,
        uint256 _dia18,
        uint256 _dia19,
        uint256 _dia20,
        uint256 _dia21,
        uint256 _dia22,
        uint256 _dia23,
        uint256 _dia24,
        uint256 _dia25,
        uint256 _dia26,
        uint256 _dia27,
        uint256 _dia28,
        uint256 _dia29,
        uint256 _dia30,
        uint256 _dia31) public
    

    function LancamentoDeDeHoras (uint256) public view returns (uint)
    {
        dia1;
    }
*/  
    function totalDeHorasTrabalhadas () public view returns (uint256 numeroDeHorasTrabalhadas)
    {
        numeroDeHorasTrabalhadas= dia1+dia2+dia3+dia4+dia5+dia6+dia7+dia8+dia9+dia10+dia11+dia12+dia13+dia14;
        return numeroDeHorasTrabalhadas;
    }
}

contract PrestacaoDeServicos
{
    string public prestador;
    string public empresa;
    uint256 public  valorHora;
    bool[] public statusPagamento;
    address payable contaPrestador;
    address contaEmpresa;
    bool public pago;
    bool public retirado;
    
    event pagamentoRealizado (uint valor);
    
    constructor (
        string memory nomePrestador,
        string memory nomeEmpresa,
        uint256 valorHoraTrabalho,
        address payable ncontaprestador,
        address ncontaempresa
        ) public
        
        {
// require para que o contrato seja limitado a no m´áximo 66.000 ether
        
        require (valorHoraTrabalho<=300, "O VALOR DA HORA ULTRAPASSOU O LIMITE");

        
        prestador = nomePrestador;
        empresa = nomeEmpresa;
        valorHora = valorHoraTrabalho;
        contaPrestador = ncontaprestador;
        contaEmpresa = ncontaempresa;
        }
        
    function vigenciaContrato () public view returns (uint dataInicioContrato, uint dataFinalContrato)
    {
        dataInicioContrato = now;
        dataFinalContrato = dataInicioContrato+365 days; 
    }
//data vencimento mensal a cada 30 dias (queria todo o dia 10, mas n~ão consegui). Tentei então a cada 30 dias, mas também não consegui
    function dataVencimentoMensal () public view returns (uint dataVencimentoMensal, uint dataInicioContrato)
    {
        dataVencimentoMensal=dataInicioContrato+30 days;
        for (uint i=1; i>30; i++)
        dataVencimentoMensal=dataVencimentoMensal+30;
    } 
            
    function saldoNoContrato () public view returns (uint) 
    {
        return address(this).balance;
    }

//DÚVIDA: o pagamento está sendo efetuado no contrato, como o prestador retira? Estou conseguindo pagar, mas fica no contrato e não aparece na conta do prestador.

    function efetuarPagamento() public payable
    {
        require (msg.sender == contaEmpresa, "SOMENTE EMPRESA PODE PAGAR");
        contaPrestador.transfer(address(this).balance);
        statusPagamento.push(true);
        emit pagamentoRealizado(msg.value);
    }
}

contract RemuneracaoFinal is PrestacaoDeServicos, RelatorioDeHorasTrabalhadas
{
        uint256 valorHora;
        uint256 remuneracaoFinal;
        uint256 numeroDeHorasTrabalhadas;
        
        constructor () public
        {
            uint256 numeroDeHorasTrabalhadas;
            uint256 remuneracaoFinal;
        }
        
        function calculoremuneracaoFinal () public view returns (uint remuneracaoFinal)
    {
        remuneracaoFinal=valorHora*numeroDeHorasTrabalhadas;

//condiç~ão para a ter uma remuneraç~ão m´ínima de 1.000 ether

        if (remuneracaoFinal<1000)
        {    
            remuneracaoFinal = 1000;
            return remuneracaoFinal;
        }
    }
}
