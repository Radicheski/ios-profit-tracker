//
//  Quote.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

struct Quote: Decodable {
    
    // swiftlint:disable identifier_name
    let tp_reg: Int
    let dt_pregao: String // Date YYYYMMDD
    let cd_bdi: Int
    let cd_acao: String
    let tp_merc: Int
    let nm_empresa_rdz: String
    let especi: String
    let prazot: Int?
    let moeda_ref: String
    let vl_abertura: Decimal
    let vl_maximo: Decimal
    let vl_minimo: Decimal
    let vl_medio: Decimal
    let vl_fechamento: Decimal
    let vl_mlh_oft_compra: Decimal
    let vl_mlh_oft_venda: Decimal
    let vl_ttl_neg: Int
    let qt_tit_neg: Int
    let vl_volume: Decimal
    let vl_exec_opc: Int
    let in_opc: Int
    let dt_vnct_opc: String // Date YYYYMMDD
    let ft_cotacao: Int
    let vl_exec_moeda_corrente: Int
    let cd_isin: String
    let numeroDistribuicao: Int
}
