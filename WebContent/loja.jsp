<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.Produto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Shop App</title>
</head>
<body>
	<form action="HProduto" method="post">
		<h1>Adicionar Produto</h1>
		<table>
			<label><tr><th align="right">Nome Produto</th><th><input type="text" name="nome" placeholder="Ex: Maçãs"></th></tr></label><br>
			<label><tr><th align="right">Preço Estimado Produto</th><th><input type="text" name="preco" placeholder="Ex: 4.99"></th></th></label><br>
			<label><tr><th align="right">Quantidade</th><th><input type="number" name="quantidade"></th></tr></label><br>
		</table>
		<input type="submit" value="Enviar" name="enviar">
	</form>
	<h2>Lista de Produtos</h2>
	
		<%
			//Buscar a ArrayList
			ArrayList<Produto> arp = (ArrayList) request.getAttribute("listaProduto");
		
			double precoTotal = 0.0, precoFinal = 0.0;
		
			out.append("<table><tr><th>Nome Artigo</th><th>Preço Individual</th><th>Quantidade</th><th>Preço Final</th></tr>");
			//Ciclo FOR
			for(Produto p : arp)
			{
				if(p.getQuantidade() > 1)
				{
					precoFinal = p.getPreco() * p.getQuantidade();
					out.append("<tr><td align=center>" + p.getNome() + "</td><td align=center>" + p.getPreco() + "</td><td align=center>" + p.getQuantidade() + "</td><td align=center>" + precoFinal + "<td></tr>");
					precoTotal += precoFinal;
				}
				else
				{
					out.append("<tr><td align=center>" + p.getNome() + 
							"</td><td align=center>" + p.getPreco() + "</td><td align=center>" + 
							p.getQuantidade() + "</td><td align=center>" + 
							p.getPreco() + "<td></tr>");
					precoTotal += p.getPreco();
				}
			}
			
			out.append("</table><br><b>Preço Estimado: </b>" + precoTotal + ("<b> €</b>"));
		%>
</body>
</html>