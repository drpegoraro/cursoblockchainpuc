pragma solidity 0.5.12;

contract relatorioDeHorasTrabalhadas

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
        uint256 _dia10) public
        
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
        numeroDeHorasTrabalhadas= dia1+dia2+dia3+dia4+dia5+dia6+dia7+dia8+dia9+dia10;
        return numeroDeHorasTrabalhadas;
    }
}
