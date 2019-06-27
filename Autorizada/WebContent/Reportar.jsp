<%@page import="org.ja.autorizada2.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Assistencia Tecnica J.A</title>
<meta charset="UTF-8">
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
<script type="text/javascript">
function dadosForm() {
	var dados = "";
	
	dados += "nome=" + document.getElementById("nome").value;
	dados += "&nivel=" + document.getElementById("nivel").value;
	dados += "&produto=" + document.getElementById("produto").value;
	dados += "&defeito=" + document.getElementById("defeito").value;
	dados += "&vend=" + document.getElementById("vend").value;
	dados += "&fabricante=" + document.getElementById("fabricante").value;
	dados += "&nota=" + document.getElementById("nota").value;
	dados += "&email=" + document.getElementById("email").value;
	dados += "&tell=" + document.getElementById("tell").value;
	dados += "&cep=" + document.getElementById("cep").value;
	dados += "&ende=" + document.getElementById("ende").value;
	dados += "&serie=" + document.getElementById("serie").value;
	dados += "&cod=" + document.getElementById("cod").value;
	return dados;
}

function gravar() {

	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	       // Typical action to be performed when the document is ready:
	       var msg = xhttp.responseText;
	       document.getElementById("msg").innerHTML = msg;
	       if (msg == "Gravado com sucesso.") {
	    	   document.getElementById("msg").className = "alert alert-success";   
	    	   
	       }else {
	    	   document.getElementById("msg").className = "alert alert-danger";
	       }
	    }
	};
	xhttp.open("GET", "servletPainel?"+dadosForm(), true);
	xhttp.send();
	
}

function gravado() {

	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	       // Typical action to be performed when the document is ready:
	       var msg = xhttp.responseText;
	       document.getElementById("msg").innerHTML = msg;
	       if (msg == "Gravado com sucesso.") {
	    	   document.getElementById("msg").className = "alert alert-success";   
	    	   
	       }else {
	    	   document.getElementById("msg").className = "alert alert-danger";
	       }
	    }
	};
	xhttp.open("GET", "servletPainel?"+dadosForm(), true);
	xhttp.send();
	
}

</script>
<%
Painel painel = new Painel();

if (request.getParameter("cod") != null){
	int cod = Integer.parseInt(request.getParameter("cod"));
	painel = painel.getPainel(cod);
}
%>

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
<div class="container">
<font size="2">Solicitar serviços.</font>
<form id="form">
<div id="msg"></div>
<input type="hidden" value="<%out.print(painel.getCod());%>" id="cod" />
<br>
  <div class="row">
    <div class="form-group col-md-4">
      <label for="nome">Nome/Empresa:</label> <input
							type="text" name="nome" 
							class="form-control" id="nome"
							placeholder="Seu Nome/Empresa"
							value="<%out.print(painel.getNome());%>">
    </div>
    <div class="form-group col-md-4">
    <label for="loc">Email:</label> <input name="email" type="text"
							class="form-control"
							id="email" placeholder="Seu email"
							value="<%out.print(painel.getEmail());%>">
    </div>
    <div class="form-group col-md-3">
    <label for="loc">Telefone:</label> <input name="tell" type="text"
							class="form-control"
							id="tell" placeholder="Seu n° de telefone"
							value="<%out.print(painel.getTell());%>">
    </div>
    	<div class="form-group col-md-2">
    <label for="loc">CEP:</label> <input name="cep" type="number"
							class="form-control"
							id="cep" placeholder="ex: 01001-000"
							value="<%out.print(painel.getCep());%>">
    </div>
    <div class="form-group col-md-4">
    <label for="loc">Endereço:</label> <input name="ende" type="text"
							class="form-control"
							id="ende" placeholder="Endereço onde se encontra o produto"
							value="<%out.print(painel.getEnde());%>">
    </div>
        <div class="form-group col-md-3">
      <label for="sel1">Nivel de Urgência:</label> <select
							class="form-control"  id="nivel" name="nivel"
							value="<%out.print(painel.getNivel());%>">
								<option></option>
								<option>Urgente</option>
								<option>Normal</option>
								<option>Sem Pressa</option>

	</select>
	<script>
	document.getElementById("nivel").value = "<% out.print(painel.getNivel()); %>";
	</script>
    </div>
    <div class="form-group col-md-2">
    <label for="loc">N° Nota Fiscal:</label> <input name="nota" type="number"
							class="form-control"
							id="nota" placeholder="ex: XXXXXX"
							value="<%out.print(painel.getNota());%>">
    </div>
  </div>
 <div class="row">
    <div class="form-group col-md-3">
      <label for="sel2">Loja que Vendeu:</label> <select
							class="form-control"  id="vend" name="vend"
							value="<%out.print(painel.getVend());%>">
								<option>Gasfilar</option>
								<option>Chama Alternativa</option>
								<option>Campeão da Construção</option>
								<option>Só Reparos</option>
								<option>Tendtudo</option>
								<option>AcCoelho</option>
	</select>
	<script>
	document.getElementById("vend").value = "<% out.print(painel.getVend()); %>";
	</script>
    </div>
    <div class="form-group col-md-2">
      <label for="sel3">Fabricante:</label> <select
							class="form-control"  id="fabricante" name="fabricante"
							value="<%out.print(painel.getFabricante());%>">
								<option></option>
								<option>Emmeti</option>
								<option>Rinnai</option>
								<option>Aqualimp</option>
								<option>G-Light</option>
								<option>Rowa</option>
								<option>Aépio</option>

	</select>
	<script>
	document.getElementById("fabricante").value = "<% out.print(painel.getFabricante()); %>";
	</script>
    </div>
    <div class="form-group col-md-2">
    <label for="loc">Produto:</label> <input name="produto" type="text"
							class="form-control"
							id="produto" placeholder="Qual é o produto?"
							value="<%out.print(painel.getProduto());%>">
    </div>
     <div class="form-group col-md-2">
    <label for="loc">N° de Serie:</label> <input name="serie" type="text"
							class="form-control" value="<%out.print(painel.getSerie());%>"
							id="serie" placeholder="N° de Serie">
    </div>
    <div class="form-group col-md-3">
    <label for="loc">Defeito:</label> <input name="defeito" type="text"
							class="form-control"
							id="defeito" placeholder="Qual o defeito?"
							value="<%out.print(painel.getDefeito());%>">
    </div>
  

  </div>
  <br>
  <div align="center">
	<button type="button" class="btn btn-primary" onclick="gravar()" >Enviar</button>
	</div>
</form>
</div>
</body>
</html>