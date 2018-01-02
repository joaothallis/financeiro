defmodule Moeda do
  @moduledoc """
  Este módulo possui listas com informações sobre as moedas.
  A lista está em compliance com o ISO 4217.
  Acesse https://pt.wikipedia.org/wiki/ISO_4217 para saber mais.
  """

  @doc """
  Lista as informações das moedas.

  ## Exemplo

  iex> moeda_info[:AED].peso
  2

  iex> moeda_info[:USD].peso
  10

  """
  def info do
    [
      AED: %{
        nome: "UAE Dirham",                                             
        simbolo: "د.إ", 
        peso: 2, 
        expoente: 2
      },
      AFN: %{
        nome: "Afghani",
        simbolo: "؋",
        peso: 1,
        expoente: 2
      },
      ALL: %{
        nome: "Lek",                                                    
        simbolo: "Lek",  
        peso: 1, 
        expoente: 2
      },
      AMD: %{ 
        nome: "Armenian Dram",                                          
        simbolo: "AMD",  
        peso: 1, 
        expoente: 2
      },
      ANG: %{
        nome: "Netherlands Antillian Guilder",                          
        simbolo: "ƒ",    
        peso: 1, 
        expoente: 2
      },
      AOA: %{
        nome: "Kwanza",                                                 
        simbolo: "Kz",   
        peso: 1, 
        expoente: 2
      },
      ARS: %{
        nome: "Argentine Peso",                                         
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      AUD: %{
        nome: "Australian Dollar",                                      
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      AWG: %{
        nome: "Aruban Guilder",                                         
        simbolo: "ƒ",    
        peso: 1, 
        expoente: 2
      },
      AZN: %{
        nome: "Azerbaijanian Manat",                                    
        simbolo: "ман",  
        peso: 1, 
        expoente: 2
      },
      BAM: %{
        nome: "Convertible Marks",                                      
        simbolo: "KM",   
        peso: 1, 
        expoente: 2
      },
      BBD: %{
        nome: "Barbados Dollar",                                        
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      BDT: %{
        nome: "Taka",                                                   
        simbolo: "৳",     
        peso: 1, 
        expoente: 2
      },
      BGN: %{
        nome: "Bulgarian Lev",                                          
        simbolo: "лв",   
        peso: 1, 
        expoente: 2
      },
      BHD: %{
        nome: "Bahraini Dinar",                                         
        simbolo: ".د.ب", 
        peso: 1, 
        expoente: 3
      },
      BIF: %{
        nome: "Burundi Franc",                                          
        simbolo: "FBu",  
        peso: 1, 
        expoente: 0
      },
      BMD: %{
        nome: "Bermudian Dollar (customarily known as Bermuda Dollar)", 
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      BND: %{
        nome: "Brunei Dollar",                                          
        simbolo: "$",
        peso: 1, 
        expoente: 2
      },
      BOB: %{
        nome: "Boliviano Mvdol",                                        
        simbolo: "$b",   
        peso: 1, 
        expoente: 2
      },
      BOV: %{
        nome: "Boliviano Mvdol",                                        
        simbolo: "$b",   
        peso: 1, 
        expoente: 2
      },
      BRL: %{
        nome: "Brazilian Real",                                         
        simbolo: "R$",  
        peso: 5, 
        expoente: 2
      },
      BSD: %{
        nome: "Bahamian Dollar",                                        
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      BTN: %{
        nome: "Indian Rupee Ngultrum",                                  
        simbolo: "Nu.",  
        peso: 1, 
        expoente: 2
      },
      BWP: %{
        nome: "Pula",                                                   
        simbolo: "P",    
        peso: 1, 
        expoente: 2
      },
      BYR: %{
        nome: "Belarussian Ruble",                                      
        simbolo: "p.",   
        peso: 1, 
        expoente: 0
      },
      BZD: %{
        nome: "Belize Dollar",                                          
        simbolo: "BZ$",  
        peso: 1, 
        expoente: 2
      },
      CAD: %{
        nome: "Canadian Dollar",                                        
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      CDF: %{
        nome: "Congolese Franc",                                        
        simbolo: "CF",   
        peso: 1, 
        expoente: 2
      },
      CHF: %{
        nome: "Swiss Franc",                                            
        simbolo: "CHF",  
        peso: 1, 
        expoente: 2
      },
      CLF: %{
        nome: "Chilean Peso Unidades de fomento",                       
        simbolo: "$",    
        peso: 1, 
        expoente: 4
      },
      CLP: %{
        nome: "Chilean Peso Unidades de fomento",                       
        simbolo: "$",    
        peso: 1, 
        expoente: 0
      },
      CNY: %{
        nome: "Yuan Renminbi",                                          
        simbolo: "¥",    
        peso: 1, 
        expoente: 2
      },
      COP: %{
        nome: "Colombian Peso",                                         
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      COU: %{
        nome: "Colombian Peso Unidad de Valor Real",                    
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      CRC: %{
        nome: "Costa Rican Colon",                                      
        simbolo: "₡",    
        peso: 1, 
        expoente: 2
      },
      CUC: %{
        nome: "Cuban Peso Peso Convertible",                            
        simbolo: "₱",    
        peso: 1, 
        expoente: 2
      },
      CUP: %{
        nome: "Cuban Peso Peso Convertible",                            
        simbolo: "₱",    
        peso: 1, 
        expoente: 2
      },
      CVE: %{
        nome: "Cape Verde Escudo",                                      
        simbolo: "$",    
        peso: 1, 
        expoente: 0
      },
      CZK: %{
        nome: "Czech Koruna",                                           
        simbolo: "Kč",   
        peso: 1, 
        expoente: 2
      },
      DJF: %{
        nome: "Djibouti Franc",                                         
        simbolo: "Fdj",  
        peso: 1, 
        expoente: 0
      },
      DKK: %{
        nome: "Danish Krone",                                           
        simbolo: "kr",   
        peso: 1, 
        expoente: 2
      },
      DOP: %{
        nome: "Dominican Peso",                                         
        simbolo: "RD$",  
        peso: 1, 
        expoente: 2
      },
      DZD: %{
        nome: "Algerian Dinar",                                         
        simbolo: "دج",   
        peso: 1, 
        expoente: 2
      },
      EEK: %{
        nome: "Kroon",                                                  
        simbolo: "KR",   
        peso: 1, 
        expoente: 2
      },
      EGP: %{
        nome: "Egyptian Pound",                                         
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      ERN: %{
        nome: "Nakfa",                                                  
        simbolo: "Nfk",  
        peso: 1, 
        expoente: 2
      },
      ETB: %{
        nome: "Ethiopian Birr",                                         
        simbolo: "Br",   
        peso: 1, 
        expoente: 2
      },
      EUR: %{
        nome: "Euro",                                                   
        simbolo: "€",    
        peso: 1, 
        expoente: 2
      },
      FJD: %{
        nome: "Fiji Dollar",                                            
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      FKP: %{
        nome: "Falkland Islands Pound",                                
        simbolo: "£",   
        peso: 1, 
        expoente: 2
      },
      GBP: %{
        nome: "Pound Sterling",                                         
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      GEL: %{
        nome: "Lari",                                                   
        simbolo: "₾",   
        peso: 1, 
        expoente: 2
      },
      GHS: %{
        nome: "Cedi",                                                   
        simbolo: "GH₵",  
        peso: 1, 
        expoente: 2
      },
      GIP: %{
        nome: "Gibraltar Pound",                                        
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      GMD: %{
        nome: "Dalasi",                                                 
        simbolo: "D",    
        peso: 1, 
        expoente: 2
      },
      GNF: %{
        nome: "Guinea Franc",                                           
        simbolo: "FG",   
        peso: 1, 
        expoente: 0
      },
      GTQ: %{
        nome: "Quetzal",                                                
        simbolo: "Q",    
        peso: 1, 
        expoente: 2
      },
      GYD: %{
        nome: "Guyana Dollar",                                          
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      HKD: %{
        nome: "Hong Kong Dollar",                                       
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      HNL: %{
        nome: "Lempira",                                                
        simbolo: "L",    
        peso: 1, 
        expoente: 2
      },
      HRK: %{
        nome: "Croatian Kuna",                                          
        simbolo: "kn",   
        peso: 1, 
        expoente: 2
      },
      HTG: %{
        nome: "Gourde US Dollar",                                       
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      HUF: %{
        nome: "Forint",                                                 
        simbolo: "Ft",   
        peso: 1, 
        expoente: 2
      },
      IDR: %{
        nome: "Rupiah",                                                 
        simbolo: "Rp",   
        peso: 1, 
        expoente: 2
      },
      ILS: %{
        nome: "New Israeli Sheqel",                                     
        simbolo: "₪",    
        peso: 1, 
        expoente: 2
      },
      INR: %{
        nome: "Indian Rupee",                                           
        simbolo: "₹",    
        peso: 1, 
        expoente: 2
      },
      IQD: %{
        nome: "Iraqi Dinar",                                            
        simbolo: "‎ع.د",  
        peso: 1, 
        expoente: 3
      },
      IRR: %{
        nome: "Iranian Rial",                                           
        simbolo: "﷼",   
        peso: 1, 
        expoente: 2
      },
      ISK: %{
        nome: "Iceland Krona",                                          
        simbolo: "kr",   
        peso: 1, 
        expoente: 0
      },
      JMD: %{
        nome: "Jamaican Dollar",                                        
        simbolo: "J$",   
        peso: 1, 
        expoente: 2
      },
      JOD: %{
        nome: "Jordanian Dinar",                                        
        simbolo: "JOD",  
        peso: 1, 
        expoente: 3
      },
      JPY: %{
        nome: "Yen",                                                    
        simbolo: "¥",    
        peso: 1, 
        expoente: 0
      },
      KES: %{
        nome: "Kenyan Shilling",                                        
        simbolo: "KSh",  
        peso: 1, 
        expoente: 2
      },
      KGS: %{
        nome: "Som",                                                    
        simbolo: "лв",   
        peso: 1, 
        expoente: 2
      },
      KHR: %{
        nome: "Riel",                                                   
        simbolo: "៛",     
        peso: 1, 
        expoente: 2
      },
      KMF: %{
        nome: "Comoro Franc",                                           
        simbolo: "CF",   
        peso: 1, 
        expoente: 0
      },
      KPW: %{
        nome: "North Korean Won",                                       
        simbolo: "₩",    
        peso: 1, 
        expoente: 2
      },
      KRW: %{
        nome: "Won",                                                    
        simbolo: "₩",    
        peso: 1, 
        expoente: 0
      },
      KWD: %{
        nome: "Kuwaiti Dinar",                                          
        simbolo: "د.ك",  
        peso: 1, 
        expoente: 3
      },
      KYD: %{
        nome: "Cayman Islands Dollar",                                  
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      KZT: %{
        nome: "Tenge",                                                  
        simbolo: "лв",   
        peso: 1, 
        expoente: 2
      },
      LAK: %{
        nome: "Kip",                                                    
        simbolo: "₭",    
        peso: 1, 
        expoente: 2
      },
      LBP: %{
        nome: "Lebanese Pound",                                         
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      LKR: %{
        nome: "Sri Lanka Rupee",                                        
        simbolo: "₨",    
        peso: 1, 
        expoente: 2
      },
      LRD: %{
        nome: "Liberian Dollar",                                        
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      LSL: %{
        nome: "Rand Loti",                                              
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      LTL: %{
        nome: "Lithuanian Litas",                                       
        simbolo: "Lt",   
        peso: 1, 
        expoente: 2
      },
      LVL: %{
        nome: "Latvian Lats",                                           
        simbolo: "Ls",   
        peso: 1, 
        expoente: 2
      },
      LYD: %{
        nome: "Libyan Dinar",                                           
        simbolo: "ل.د",  
        peso: 1, 
        expoente: 3
      },
      MAD: %{
        nome: "Moroccan Dirham",                                        
        simbolo: "د.م.", 
        peso: 1, 
        expoente: 2
      },
      MDL: %{
        nome: "Moldovan Leu",                                           
        simbolo: "MDL",  
        peso: 1, 
        expoente: 2
      },
      MGA: %{
        nome: "Malagasy Ariary",                                        
        simbolo: "Ar",   
        peso: 1, 
        expoente: 2
      },
      MKD: %{
        nome: "Denar",                                                  
        simbolo: "ден",  
        peso: 1, 
        expoente: 2},
      MMK: %{
        nome: "Kyat",                                                   
        simbolo: "K",    
        peso: 1, 
        expoente: 2
      },
      MNT: %{
        nome: "Tugrik",                                                 
        simbolo: "₮",    
        peso: 1, 
        expoente: 2
      },
      MOP: %{
        nome: "Pataca",                                                 
        simbolo: "MOP$", 
        peso: 1, 
        expoente: 2
      },
      MRO: %{
        nome: "Ouguiya",                                                
        simbolo: "UM",   
        peso: 1, 
        expoente: 2
      },
      MUR: %{
        nome: "Mauritius Rupee",                                        
        simbolo: "₨",    
        peso: 1, 
        expoente: 2
      },
      MVR: %{
        nome: "Rufiyaa",                                                
        simbolo: "Rf",   
        peso: 1, 
        expoente: 2
      },
      MWK: %{
        nome: "Kwacha",                                                 
        simbolo: "MK",   
        peso: 1, 
        expoente: 2
      },
      MXN: %{
        nome: "Mexican Peso",                                           
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      MXV: %{
        nome: "Mexican Peso Mexican Unidad de Inversion (UDI)",         
        simbolo: "UDI",  
        peso: 1, 
        expoente: 2
      },
      MYR: %{
        nome: "Malaysian Ringgit",                                      
        simbolo: "RM",   
        peso: 1, 
        expoente: 2
      },
      MZN: %{
        nome: "Metical",                                                
        simbolo: "MT",   
        peso: 1, 
        expoente: 2
      },
      NAD: %{
        nome: "Rand Namibia Dollar",                                    
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      NGN: %{
        nome: "Naira",                                                  
        simbolo: "₦",    
        peso: 1, 
        expoente: 2
      },
      NIO: %{
        nome: "Cordoba Oro",                                            
        simbolo: "C$",   
        peso: 1, 
        expoente: 2
      },
      NOK: %{
        nome: "Norwegian Krone",                                        
        simbolo: "kr",   
        peso: 1, 
        expoente: 2
      },
      NPR: %{
        nome: "Nepalese Rupee",                                         
        simbolo: "₨",    
        peso: 1, 
        expoente: 2
      },
      NZD: %{
        nome: "New Zealand Dollar",                                     
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      OMR: %{
        nome: "Rial Omani",                                             
        simbolo: "﷼",   
        peso: 1, 
        expoente: 3
      },
      PAB: %{
        nome: "Balboa US Dollar",                                       
        simbolo: "B/.",  
        peso: 1, 
        expoente: 2
      },
      PEN: %{
        nome: "Nuevo Sol",                                              
        simbolo: "S/.",  
        peso: 1, 
        expoente: 2
      },
      PGK: %{
        nome: "Kina",                                                   
        simbolo: "K",    
        peso: 1, 
        expoente: 2
      },
      PHP: %{
        nome: "Philippine Peso",                                        
        simbolo: "Php",  
        peso: 1, 
        expoente: 2
      },
      PKR: %{
        nome: "Pakistan Rupee",                                         
        simbolo: "₨",    
        peso: 1, 
        expoente: 2
      },
      PLN: %{
        nome: "Zloty",                                                  
        simbolo: "zł",   
        peso: 1, 
        expoente: 2
      },
      PYG: %{
        nome: "Guarani",                                                
        simbolo: "Gs",   
        peso: 1, 
        expoente: 0
      },
      QAR: %{
        nome: "Qatari Rial",                                            
        simbolo: "﷼",   
        peso: 1, 
        expoente: 2
      },
      RON: %{
        nome: "New Leu",                                                
        simbolo: "lei",  
        peso: 1, 
        expoente: 2
      },
      RSD: %{
        nome: "Serbian Dinar",                                          
        simbolo: "Дин.", 
        peso: 1, 
        expoente: 2
      },
      RUB: %{
        nome: "Russian Ruble",                                          
        simbolo: "₽",    
        peso: 1, 
        expoente: 2
      },
      RWF: %{
        nome: "Rwanda Franc",                                           
        simbolo: " ",    
        peso: 1, 
        expoente: 0
      },
      SAR: %{
        nome: "Saudi Riyal",                                            
        simbolo: "﷼",   
        peso: 1, 
        expoente: 2
      },
      SBD: %{
        nome: "Solomon Islands Dollar",                                 
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      SCR: %{
        nome: "Seychelles Rupee",                                       
        simbolo: "₨",    
        peso: 1, 
        expoente: 2
      },
      SDG: %{
        nome: "Sudanese Pound",                                         
        simbolo: "SDG",  
        peso: 1, 
        expoente: 2
      },
      SEK: %{
        nome: "Swedish Krona",                                          
        simbolo: "kr",   
        peso: 1, 
        expoente: 2
      },
      SGD: %{
        nome: "Singapore Dollar",                                       
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      SHP: %{
        nome: "Saint Helena Pound",                                     
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      SLL: %{
        nome: "Leone",                                                  
        simbolo: "Le",   
        peso: 1, 
        expoente: 2
      },
      SOS: %{
        nome: "Somali Shilling",                                        
        simbolo: "S",    
        peso: 1, 
        expoente: 2
      },
      SRD: %{
        nome: "Surinam Dollar",                                         
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      STD: %{
        nome: "Dobra",                                                  
        simbolo: "Db",   
        peso: 1, 
        expoente: 2
      },
      SVC: %{
        nome: "El Salvador Colon US Dollar",                            
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      SYP: %{
        nome: "Syrian Pound",                                           
        simbolo: "£",    
        peso: 1, 
        expoente: 2
      },
      SZL: %{
        nome: "Lilangeni",                                              
        simbolo: "E",    
        peso: 1, 
        expoente: 2
      },
      THB: %{
        nome: "Baht",                                                   
        simbolo: "฿",    
        peso: 1, 
        expoente: 2
      },
      TJS: %{
        nome: "Somoni",                                                 
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      TMT: %{
        nome: "Manat",                                                  
        simbolo: "₼",    
        peso: 1, 
        expoente: 2
      },
      TND: %{
        nome: "Tunisian Dinar",                                         
        simbolo: "د.ت",  
        peso: 1, 
        expoente: 2
      },
      TOP: %{
        nome: "Pa'anga",                                                
        simbolo: "T$",   
        peso: 1, 
        expoente: 2
      },
      TRY: %{
        nome: "Turkish Lira",                                           
        simbolo: "TL",   
        peso: 1, 
        expoente: 2
      },
      TTD: %{
        nome: "Trinidad and Tobago Dollar",                             
        simbolo: "TT$",  
        peso: 1, 
        expoente: 2
      },
      TWD: %{
        nome: "New Taiwan Dollar",                                      
        simbolo: "NT$",  
        peso: 1, 
        expoente: 2
      },
      TZS: %{
        nome: "Tanzanian Shilling",                                     
        simbolo: "Tsh",  
        peso: 1, 
        expoente: 2
      },
      UAH: %{
        nome: "Hryvnia",                                                
        simbolo: "₴",    
        peso: 1, 
        expoente: 2
      },
      UGX: %{
        nome: "Uganda Shilling",                                        
        simbolo: "Ush",  
        peso: 1, 
        expoente: 0
      },
      USD: %{
        nome: "US Dollar",                                              
        simbolo: "$",    
        peso: 10, 
        expoente: 2
      },
      UYI: %{
        nome: "Peso Uruguayo Uruguay Peso en Unidades Indexadas",       
        simbolo: "$U",   
        peso: 1, 
        expoente: 0
      },
      UYU: %{
        nome: "Peso Uruguayo Uruguay Peso en Unidades Indexadas",       
        simbolo: "$U",   
        peso: 1, 
        expoente: 2
      },
      UZS: %{
        nome: "Uzbekistan Sum",                                         
        simbolo: "лв",   
        peso: 1, 
        expoente: 2
      },
      VEF: %{
        nome: "Bolivar Fuerte",                                         
        simbolo: "Bs",   
        peso: 1, 
        expoente: 2
      },
      VND: %{
        nome: "Dong",                                                   
        simbolo: "₫",    
        peso: 1, 
        expoente: 0
      },
      VUV: %{
        nome: "Vatu",                                                   
        simbolo: "VT",   
        peso: 1, 
        expoente: 0
      },
      WST: %{
        nome: "Tala",                                                   
        simbolo: "WS$",  
        peso: 1, 
        expoente: 2
      },
      XAF: %{
        nome: "CFA Franc BEAC",                                         
        simbolo: "FCFA", 
        peso: 1, 
        expoente: 0
      },
      XAG: %{
        nome: "Silver",                                                 
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XAU: %{
        nome: "Gold",                                                   
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XBA: %{
        nome: "Bond Markets Units European Composite Unit (EURCO)",     
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XBB: %{
        nome: "European Monetary Unit (E.M.U.-6)",                      
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XBC: %{
        nome: "European Unit of Account 9(E.U.A.-9)",                   
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XBD: %{
        nome: "European Unit of Account 17(E.U.A.-17)",                 
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XCD: %{
        nome: "East Caribbean Dollar",                                  
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      },
      XDR: %{
        nome: "SDR",                                                    
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XFU: %{
        nome: "UIC-Franc",                                              
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XOF: %{
        nome: "CFA Franc BCEAO",                                        
        simbolo: " ",    
        peso: 1, 
        expoente: 0
      },
      XPD: %{
        nome: "Palladium",                                              
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XPF: %{
        nome: "CFP Franc",                                              
        simbolo: " ",    
        peso: 1, 
        expoente: 0
      },
      XPT: %{
        nome: "Platinum",                                               
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      XTS: %{
        nome: "Codes specifically reserved for testing purposes",       
        simbolo: " ",    
        peso: 1, 
        expoente: 2
      },
      YER: %{
        nome: "Yemeni Rial",                                            
        simbolo: "﷼",   
        peso: 1, 
        expoente: 2
      },
      ZAR: %{
        nome: "Rand",                                                   
        simbolo: "R",    
        peso: 1, 
        expoente: 2
      },
      ZMK: %{
        nome: "Zambian Kwacha",                                         
        simbolo: "ZK",   
        peso: 1, 
        expoente: 2
      },
      ZWL: %{
        nome: "Zimbabwe Dollar",                                        
        simbolo: "$",    
        peso: 1, 
        expoente: 2
      }    
    ]
  end 
  @doc """
  Lista com as moedas para a criação de novos usuários no sistema.

  Todas moedas começam com valor 0.

  ## Exemplo

  iex> usuario[Pedro: Moeda.novo()]
  [AED: 0, AFN: 0, ALL: 0, AMD: 0, ANG: 0, AOA: 0, ARS: 0, AUD: 0, AWG: 0, AZN: 0,
   BAM: 0, BBD: 0, BDT: 0, BGN: 0, BHD: 0, BIF: 0, BMD: 0, BND: 0, BOB: 0, BOV: 0,...
  
  """
  def novo do
    [
      AED: 0, 
      AFN: 0,
      ALL: 0,
      AMD: 0,
      ANG: 0,
      AOA: 0,
      ARS: 0,
      AUD: 0,
      AWG: 0,
      AZN: 0, 
      BAM: 0,
      BBD: 0,
      BDT: 0,
      BGN: 0,
      BHD: 0,
      BIF: 0,
      BMD: 0,
      BND: 0,
      BOB: 0,
      BOV: 0,
      BRL: 0,
      BSD: 0,
      BTN: 0,
      BWP: 0,
      BYR: 0,
      BZD: 0,
      CAD: 0,
      CDF: 0,
      CHF: 0,
      CLF: 0,
      CLP: 0,
      CNY: 0,
      COP: 0,
      COU: 0,
      CRC: 0,
      CUC: 0,
      CUP: 0,
      CVE: 0,
      CZK: 0,
      DJF: 0,
      DKK: 0,
      DOP: 0,
      DZD: 0,
      EEK: 0,
      EGP: 0,
      ERN: 0,
      ETB: 0,
      EUR: 0,
      FJD: 0,
      FKP: 0,
      GBP: 0,
      GEL: 0,
      GHS: 0,
      GIP: 0,
      GMD: 0,
      GNF: 0,
      GTQ: 0,
      GYD: 0,
      HKD: 0,
      HNL: 0,
      HRK: 0,
      HTG: 0,
      HUF: 0,
      IDR: 0,
      ILS: 0,
      INR: 0,
      IQD: 0,
      IRR: 0,
      ISK: 0,
      JMD: 0,
      JOD: 0,
      JPY: 0,
      KES: 0,
      KGS: 0,
      KHR: 0,
      KMF: 0,
      KPW: 0,
      KRW: 0,
      KWD: 0,
      KYD: 0,
      KZT: 0,
      LAK: 0,
      LBP: 0,
      LKR: 0,
      LRD: 0,
      LSL: 0,
      LTL: 0,
      LVL: 0,
      LYD: 0,
      MAD: 0,
      MDL: 0,
      MGA: 0,
      MKD: 0,
      MMK: 0,
      MNT: 0,
      MOP: 0,
      MRO: 0,
      MUR: 0,
      MVR: 0,
      MWK: 0,
      MXN: 0,
      MXV: 0,
      MYR: 0,
      MZN: 0,
      NAD: 0,
      NGN: 0,
      NIO: 0,
      NOK: 0,
      NPR: 0,
      NZD: 0,
      OMR: 0,
      PAB: 0,
      PEN: 0,
      PGK: 0,
      PHP: 0,
      PKR: 0,
      PLN: 0,
      PYG: 0,
      QAR: 0,
      RON: 0,
      RSD: 0,
      RUB: 0,
      RWF: 0,
      SAR: 0,
      SBD: 0,
      SCR: 0,
      SDG: 0,
      SEK: 0,
      SGD: 0,
      SHP: 0,
      SLL: 0,
      SOS: 0,
      SRD: 0,
      STD: 0,
      SVC: 0,
      SYP: 0,
      SZL: 0,
      THB: 0,
      TJS: 0,
      TMT: 0,
      TND: 0,
      TOP: 0,
      TRY: 0,
      TTD: 0,
      TWD: 0,
      TZS: 0,
      UAH: 0,
      UGX: 0,
      USD: 0,
      UYI: 0,
      UYU: 0,
      UZS: 0,
      VEF: 0,
      VND: 0,
      VUV: 0,
      WST: 0,
      XAF: 0,
      XAG: 0,
      XAU: 0,
      XBA: 0,
      XBB: 0,
      XBC: 0,
      XBD: 0,
      XCD: 0,
      XDR: 0,
      XFU: 0,
      XOF: 0,
      XPD: 0,
      XPF: 0,
      XPT: 0,
      XTS: 0,
      YER: 0,
      ZAR: 0,
      ZMK: 0,
      ZWL: 0
    ]
  end
end
