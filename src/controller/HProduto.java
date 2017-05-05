package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SProdutos;

@WebServlet("/HProduto")
public class HProduto extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	private SProdutos servProduto;
	
    public HProduto() 
    {
        super();
        servProduto = new SProdutos();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setAttribute("listaProduto", servProduto.getArProduto());
		request.getRequestDispatcher("loja.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String nome = request.getParameter("nome");
		double preco = Double.parseDouble(request.getParameter("preco"));
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		
		servProduto.addProduto(nome, quantidade, preco);
		
		doGet(request, response);
	}
}
