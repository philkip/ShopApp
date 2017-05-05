package service;

import java.util.ArrayList;
import model.Produto;

public class SProdutos 
{
	ArrayList<Produto> arProduto;
	
	public SProdutos()
	{
		arProduto = new ArrayList<Produto>();
	}

	public ArrayList<Produto> getArProduto() 
	{
		return arProduto;
	}

	public void setArProduto(ArrayList<Produto> arProduto) 
	{
		this.arProduto = arProduto;
	}
	
	public void addProduto(String nome, int quantidade, double preco)
	{
		Produto p = new Produto(nome, quantidade, preco);
		
		this.arProduto.add(p);
	}
	
}
