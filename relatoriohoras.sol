pragma solidity 0.5.12;

contract RelatorioDeHorasTrabalhadas
{
    event relatorioEmitido (uint256);
    string public prestador;
    uint256 conta;
    
    
    constructor (
    string memory nomePrestador,
    address payable contaPrestador
    )
    public
    
    {
        prestador = nomePrestador;
        require (msg.sender == contaPrestador, "Operação exclusiva do prestador");
    }
    
    struct RelatorioDeHoras {
        uint256 mes;
        uint256 ano;
        uint256 diaDoMes;
        string trabalhoEfetuado;
        uint256 totalHorasTrabalhadas;
    }
    
    RelatorioDeHoras[] public relatos;
    
    function relatarHoras (
        uint256 mesTrabalhado,
        uint256 anoTrabalhado,
        uint256 diaDoMesTrabalhado,
        string memory descricaoTrabalho,
        uint256 totalDeHorasTrabalhadas)
        public
    {
        require(diaDoMesTrabalhado<31);
        RelatorioDeHoras memory relato=RelatorioDeHoras(mesTrabalhado, anoTrabalhado, diaDoMesTrabalhado, descricaoTrabalho, totalDeHorasTrabalhadas);
        relatos.push(relato);
    }
        
    function gerarRelatorio() public returns (uint256)
    {
        uint256 apuracaoDoMes;
        for (uint i=0; i<relatos.length; i++)   
        {
            apuracaoDoMes = relatos[i].totalHorasTrabalhadas+apuracaoDoMes;
        }
        emit relatorioEmitido (apuracaoDoMes);
        return (apuracaoDoMes);
    }
}
