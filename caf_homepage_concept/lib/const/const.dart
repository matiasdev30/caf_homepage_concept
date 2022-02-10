import 'package:flutter/cupertino.dart';
import 'package:caf_homepage_concept/model/players.dart';

//SCREEN SIZE VARIBLE
double? widthScreen, heigthScreen;

//COLORS
const Color firstColor = Color(0xff070761);
const Color greenCAF = Color(0xff37B235);
const Color yelowCAF = Color(0xffFFEF0F);

//IMAGE
const String imgMane = 'assets/mane.png';
const String imgManeBack = 'assets/mane_back.jpg';
const String imgSalah = 'assets/salah.png';
const String imgSalahBack = 'assets/salah_back.jpg';
const String imgRelva = 'assets/relva3.png';
const String imgField = 'assets/field1.jpg';
const String imgShirtSenegal = 'assets/senegal.png';
const String imgShirtEgipt = 'assets/egipto.png';
const String imgCAF = 'assets/caf.png';
const String imgLiverpool = 'assets/liverpool.png';
const String imgCoachSenegal = 'assets/coachSenegal.jpg';
const String imgCoachEgipt = 'assets/coachEgipt.jpg';
const String imgFlagSenegal = 'assets/flagSenegal.png';
const String imgFlagEgipt = 'assets/flagEgipt.jpg';

//LIST OF PLAYERS
List<Players> senegalListPlayers = [
  Players('Mendy', 'Guarda-Redes', 'Chelsea', 1.95, 'Direito', '17/11/2018',
      '32,00M €', '01/03/1992(29)', 16),
  Players('Diallo', 'Lateral Esquerdo', 'PSG', 1.78, 'Esquerdo', '26/03/2021',
      '25,00 M €', '04/05/1996(25)', 22),
  Players('Koulibaly', 'Defesa Central', 'Napoli', 1.78, 'Directo',
      '05/09/2015', '45,00 M €', '20/06/1991(30)', 3),
  Players('Sarr', 'Lateral Direito', 'Bayer Munchen', 1.77, 'Directo',
      '09/10/2021', '3,00 M €', '31/01/1992(30)', 20),
  Players('Ciss', 'Lateral Esquerdo', 'ANL', 1.74, 'Esuerdo', '14/11/2012',
      '500 mil €', '15/09/1989(32)', 2),
  Players('Kouyaté', 'Médio Defensivo', 'Crystal Palace', 1.89, 'Directo',
      '29/02/2012', '4,00 M €', '21/12/1989(32)', 8),
  Players('Mendy', 'Médio Defensivo', 'Leicester City', 1.67, 'Directo',
      '26/03/2021', '5,00 M €', '23/06/1992(29)', 6),
  Players('Sarr', 'Extremo Direito', 'FC-Watford', 1.80, 'Directo',
      '15/01/2017', '27,00 M €', '25/02/1998(23)', 18),
  Players('Gueye', 'Médio Defensivo', 'Olyempique', 1.89, 'Esquerdo',
      '14/11/2021', '10,00 M €', '24/01/1999(23)', 5),
  Players('Mané', 'Extremo Esquerdo', 'Liverpool', 1.74, 'Direito',
      '25/05/2012', '80,00 M €', '10/04/1992(29)', 10),
  Players('Diédhiou', 'Ponta de Lança', 'Alanya', 1.89, 'Direito', '31/05/2014',
      '3,40 M €', '15/12/1992(29)', 19)
];

List<Players> egiptListPlayers = [
  Players('Gabaski', 'Guarda-Redes', 'Pharco FC', 1.85, 'Direito', '11/12/2021',
      '400 mil €', '01/02/1999(23)', 16),
  Players('Abdelmonem', 'Defesa Central', 'El Kairo', 1.80, 'Directo',
      '11/12/2021', '400 mil €', '01/02/1999(23)', 2),
  Players('Hamdy', 'Defesa Central', 'Zamalek SC', 1.84, 'Directo',
      '25/05/2018', '2,00 M €', '01/06/1995(26)', 15),
  Players('Ashour', 'Medio Centro', 'Zamalek SC', 1.82, 'Directo', '16/11/2021',
      '800 mil €', '20/02/1998(23)', 8),
  Players('Fetouh', 'Medio Centro', 'Zamalek SC', 1.82, 'Directo', '16/11/2021',
      '800 mil €', '20/02/1998(23)', 13),
  Players('Fetouh', 'Medio Centro', 'Zamalek SC', 1.82, 'Directo', '16/11/2021',
      '800 mil €', '20/02/1998(23)', 13),
  Players('Elnemy', 'Medio Defensivo', 'Zamalek SC', 1.82, 'Directo',
      '16/11/2021', '800 mil €', '20/02/1998(23)', 17),
  Players('Fath', 'Medio Defensivo', 'Zamalek SC', 1.82, 'Directo',
      '16/11/2021', '800 mil €', '20/02/1998(23)', 5),
  Players('Soulia', 'Medio Defensivo', 'Zamalek SC', 1.82, 'Directo',
      '16/11/2021', '800 mil €', '20/02/1998(23)', 4),
  Players('Salah', 'Extremo Directo', 'Liverpool', 1.75, 'Esquerdo',
      '03/09/2011', '100,00 M €', '15/06/1992(29)', 10),
  Players('Mohamed', 'Ponta de Lança', 'Zamalek SC', 1.75, 'Directo',
      '03/09/2011', '100,00 M €', '15/06/1992(29)', 14),
  Players('Marmoush', 'Ponta de Lança', 'Galatasarya', 1.75, 'Directo',
      '03/09/2011', '100,00 M €', '15/06/1992(29)', 22),
];
