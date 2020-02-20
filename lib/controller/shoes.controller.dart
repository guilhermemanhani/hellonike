import 'package:flutter/material.dart';
import 'package:hello/model/shoes.model.dart';

class ShoesController {
  List<Shoes> getShoes(){
    List<Shoes> list = [];
    Shoes lebron = new Shoes(cardNum: 1, nome: 'LeBron', preco: '500,00', cor: Colors.red, 
    img: 'image/lebron.png');

    Shoes kyrie = new Shoes(cardNum: 2,nome: 'Kyrie', preco: '400,00', cor: Colors.blue, 
    img: 'image/kyrie.png');
    
    Shoes kobe = new Shoes(cardNum: 3, nome: 'Kobe', preco: '300,00', cor: Colors.purple, 
    img: 'image/kobe.png');
    
    Shoes ante = new Shoes(cardNum: 4, nome: 'Antetokounmpo', preco: '370,00', cor: Colors.green, 
    img: 'image/zoomFreak.png');
  
    list.add(lebron);
    list.add(kyrie);
    list.add(kobe);
    list.add(ante);
    return list;
  }
}