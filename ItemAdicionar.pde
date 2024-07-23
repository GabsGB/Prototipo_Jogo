void addItens() {
  
  itensMapa1 = new ArrayList<Item>();
  circulosMapa1 = new ArrayList<Item>();
  
  item1 = new Item(15 * 32, 4 * 32, 32, 32, "item1.2.png", 2); //Diario
  item2 = new Item(23 * 32, 15 * 32, 32, 32, "item2.png", 2); //Caveira
  item3 = new Item(8 * 32, 6 * 32, 32, 32, "item3.png", 2); //Vela
  
  localItem1 = new Item(6 * 32, 11 * 32, 32, 32, "item4.png", 2); //circulo1
  localItem2 = new Item(10 * 32, 11 * 32, 32, 32, "item4.png", 2); //circulo2
  localItem3 = new Item(8 * 32, 15 * 32, 32, 32, "item4.png", 2); //circulo3
  localItem4 = new Item(8 * 32, 13 * 32, 32, 32, "item4.png", 3); //circulo4
  //localItem4.coletado = true;
  
  itensMapa1.add(item1);
  itensMapa1.add(item2);
  itensMapa1.add(item3);
  
  circulosMapa1.add(localItem1);
  circulosMapa1.add(localItem2);
  circulosMapa1.add(localItem3);
  //circulosMapa1.add(localItem4);
}
