pragma solidity ^0.5.0;

contract contrato_basico {
    //DEFINO UNA VARIABLE QUE LUEGO VAMOS A BUSCAR EN APIS VÍA ORACLES
    uint public stock_price_t1 = 120;
    uint public stock_price_t2 = 140;
    
    //DEFINIMOS LAS CARACTERÍSTICAS DE UN LOS AGENTES 
    struct long_trader {
        uint id; 
        uint margin; 
        bool liquidation;
    }
    
    struct short_trader{
        uint id; 
        uint margin;
        bool liquidation;

    }
    
    //SUPONGAMOS QUE ENTRAN DOS PERSONAS DE CADA PUNTA PARA EJECUTAR ELCONTRATO
        long_trader = long_trader(1, 100, false)
        short_trader = short_trader(1, 100, false)
        
    //VAMOS A PONER SU MARGIN EN UN "POTT"
    uint pot_balance = short_trader[margin] + long_trader[margin]
    
    //CREAMOS UNA SITUACIÓN DONDE UNA DE LAS PARTES DESEA LIQUIDAR SU POSICION
    if(short_trader[liquidation] = true){
        uint pnl_short = ((stock_price_1 - stock_price_t2)/stock_price_t2) * short_trader[margin]
        pot_balance = pot_balance +pnl_short
    }
    
}
