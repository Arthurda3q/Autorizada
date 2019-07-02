
<%@page import="org.ja.autorizada2.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Painel de Gerenciamento</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
  <ul class="navbar-nav">
  <a class="navbar-brand" href="index.jsp">
  <img
			src="https://i.imgur.com/taI8F9V.png"
			style="width: 20px" align="left" />
  </a>

    <li class="nav-item active">
      <a class="nav-link" href="index.jsp">Inicio</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Reportar.jsp">Abrir chamado</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Painel.jsp">Painel</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="#">Gerenciar</a>
    </li>
  </ul>
</nav>
<br>
	<div class="container">
	<font size="2">Clique sobre o nome desejado para...</font>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome do Cliente</th>
					<th>Nivel de Urgência</th>
					<th>N° Nota Fiscal
					</th>
					<th>Loja que Vendeu
					</th>
					<th>Produto
					</th>
					<th>Deifeito
					</th>
				</tr>
			</thead>
			<tbody>
			
			<script>
			
			function prepararEditar(cod){
				window.location.replace('Gerenciamento.jsp?cod='+cod)
			}
			
			</script>
				<%
					Painel painel = new Painel();
					for (Painel p : painel.getLista()) {
						out.print("<tr onclick='prepararEditar("+p.getCod()+")'>");
						out.print("<td>" + p.getNome() + "</td>");
						out.print("<td class='"+p.getCorStatus()+"'>" + p.getNivel() + "</td>");
						out.print("<td>" +p.getNota()+"</td>");
						out.print("<td>" +p.getVend()+"</td>");
						out.print("<td>" +p.getProduto()+"</td>");
						out.print("<td>" +p.getDefeito()+"</td>");
						out.print("</tr>");
					}
				%>
			</tbody>
		</table>


	</div>

</body>
</html>