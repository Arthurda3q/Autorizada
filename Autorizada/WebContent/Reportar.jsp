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
	<script type="text/javascript" src="js/mask.js"></script>
		<script src="js/jquery-3.3.1.slim.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script	src="js/popper.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>
	<!-- Script JMask -->
	<script type="text/javascript" src="js/jquery.mask.js"></script>
	<!-- Gestor script -->
	<script type="text/javascript" src="js/gestor.js"></script>
	<script type="text/javascript" src="js/cep.js"></script>
		
<link rel="stylesheet" href="css/estilo.css">

</head>
<body onload="mascaras()">
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
	if ((document.getElementById("nome").value != "") && (document.getElementById("tell").value !="")
			&& (document.getElementById("cep").value !="")&& (document.getElementById("vend").value !="")
			&& (document.getElementById("fabricante").value !="")&& (document.getElementById("produto").value !="")
			&& (document.getElementById("defeito").value != "")){
	xhttp.open("GET", "servletPainel?"+dadosForm(), true);
	xhttp.send();
	window.setTimeout('novo()', 2000);
	} else {
		if (document.getElementById("nome").value == ""){
		document.getElementById("nome").className= "form-control border border-danger";
		}
		if (document.getElementById("tell").value == ""){
		document.getElementById("tell").className= "form-control border border-danger";
		}
		if (document.getElementById("cep").value == ""){
			document.getElementById("cep").className= "form-control border border-danger";
			}
			if (document.getElementById("vend").value == ""){
			document.getElementById("vend").className= "form-control border border-danger";
			}
			if (document.getElementById("fabricante").value == ""){
				document.getElementById("fabricante").className= "form-control border border-danger";
				}
				if (document.getElementById("produto").value == ""){
				document.getElementById("produto").className= "form-control border border-danger";
				}
				if (document.getElementById("defeito").value == ""){
					document.getElementById("defeito").className= "form-control border border-danger";
					}
		document.getElementById("msg").className = "alert alert-danger";
		document.getElementById("msg").innerHTML = "Preencha os campos obrigatorios.";
	}
}
function act() {
	if (document.getElementById("nome").value != ""){
		document.getElementById("nome").className= "form-control";
		}
	if (document.getElementById("tell").value != ""){
		document.getElementById("tell").className= "form-control";
		}
	if (document.getElementById("cep").value != ""){
		document.getElementById("cep").className= "form-control";
			}
	if (document.getElementById("vend").value != ""){
		document.getElementById("vend").className= "form-control ";
			}
	if (document.getElementById("fabricante").value != ""){
		document.getElementById("fabricante").className= "form-control";
				}
	if (document.getElementById("produto").value != ""){
		document.getElementById("produto").className= "form-control ";
				}
	if (document.getElementById("defeito").value != ""){
		document.getElementById("defeito").className= "form-control";
					}
}
function novo(){
	window.location.replace('index.jsp');
}
function mascaras() {
	$(document).ready(function() {
		$("#tell").mask("(00)00000-0000")
	})
}
</script>
	<%
		Painel painel = new Painel();
		if (request.getParameter("cod") != null) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			painel = painel.getPainel(cod);
		}
	%>

	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		<ul class="navbar-nav">
			<a class="navbar-brand" href="index.jsp"> <img
				src="https://i.imgur.com/taI8F9V.png" style="width: 20px"
				align="left" />
			</a>

			<li class="nav-item active"><a class="nav-link" href="index.jsp">Inicio</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="Reportar.jsp">Abrir
					chamado</a></li>
			<li class="nav-item"><a class="nav-link" href="Painel.jsp">Painel</a>
			</li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Gerenciar</a>
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
					<label for="nome">Nome/Empresa:</label> <input type="text"
						name="nome" class="form-control" id="nome"
						maxlength="100"
						placeholder="Seu Nome/Empresa"
						value="<%out.print(painel.getNome());%>"
						onkeyup="act()">
				</div>
				<div class="form-group col-md-4">
					<label for="loc">Email:</label> <input name="email" type="text"
						class="form-control" id="email" placeholder="Seu email"
						maxlength="100"
						value="<%out.print(painel.getEmail());%>">
				</div>
				<div class="form-group col-md-3">
					<label for="telefone">Telefone:</label> <input name="tell" type="text"
						maxlength="11" 
						class="form-control" id="tell" placeholder="Seu n° de telefone"
						value="<%out.print(painel.getTell());%>"
						>
				</div>
				<div class="form-group col-md-2">
					<label for="loc">CEP:</label> <input name="cep" type="text"
						class="form-control" id="cep" placeholder="ex: 01001-000"
						maxlength="8"
						value="<%out.print(painel.getCep());%>"
						onkeyup="pesquisacep(this.value);">
				</div>
				<div class="form-group col-md-4">
					<label for="loc">Endereço:</label> <input name="rua" type="text"
						class="form-control" id="rua"
						placeholder="Endereço onde se encontra o produto"
						value="<%out.print(painel.getEnde());%>">
				</div>
				<div class="form-group col-md-1">
					<label for="loc">Bairro:</label> <input name="bairro" type="text"
						class="form-control" id="bairro"
						placeholder=".."
						>
				</div>
				<div class="form-group col-md-3">
					<label for="sel1">Nivel de Urgência:</label> <select
						class="form-control" id="nivel" name="nivel"
						value="<%out.print(painel.getNivel());%>">
						<option></option>
						<option>Urgente</option>
						<option>Normal</option>
						<option>Sem Pressa</option>

					</select>
					<script>
	document.getElementById("nivel").value = "<%out.print(painel.getNivel());%>";
	</script>
				</div>
				<div class="form-group col-md-2">
					<label for="loc">N° Nota Fiscal:</label> <input name="nota"
						type="number" class="form-control" id="nota"
						placeholder="ex: XXXXXX" value="<%out.print(painel.getNota());%>">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="sel2">Loja que Vendeu:</label> <select
						class="form-control" id="vend" name="vend"
						value="<%out.print(painel.getVend());%>"
						onchange="act()">
						<option>Gasfilar</option>
						<option>Chama Alternativa</option>
						<option>Só Reparos</option>
						<option>Tendtudo</option>
						<option>AcCoelho</option>
					</select>
					<script>
	document.getElementById("vend").value = "<%out.print(painel.getVend());%>";
	</script>
				</div>
				<div class="form-group col-md-2">
					<label for="sel3">Fabricante:</label> <select class="form-control"
						id="fabricante" name="fabricante"
						value="<%out.print(painel.getFabricante());%>"
						onchange="act()">
						<option></option>
						<option>Emmeti</option>
						<option>Rinnai</option>
						<option>Aqualimp</option>
						<option>G-Light</option>
						<option>Rowa</option>
						<option>Aépio</option>

					</select>
					<script>
	document.getElementById("fabricante").value = "<%out.print(painel.getFabricante());%>";
					</script>
				</div>
				<div class="form-group col-md-2">
					<label for="loc">Produto:</label> 
					<img src="https://img.icons8.com/material-rounded/24/000000/about.png" 
					width="15px" title="O nome do produto esta localizada na parte da frente do mesmo, ou na caixa."><input name="produto" type="text"
						class="form-control" id="produto" placeholder="Qual é o produto?"
						value="<%out.print(painel.getProduto());%>"
						onkeyup="act()">
				</div>
				<div class="form-group col-md-2">
					<label for="loc">N° de Serie:</label> <input name="serie"
						type="text" class="form-control"
						value="<%out.print(painel.getSerie());%>" id="serie"
						placeholder="N° de Serie">
				</div>
				<div class="form-group col-md-3">
					<label for="loc">Defeito:</label>
					<img src="https://img.icons8.com/material-rounded/24/000000/about.png" 
					width="15px" title="Ex: Não liga, está queimado, está furado etc..">
					 <input name="defeito" type="text"
						class="form-control" id="defeito" placeholder="Qual o defeito?"
						value="<%out.print(painel.getDefeito());%>"
						onkeyup="act()">
				</div>


			</div>
			<br>
			<div align=center>
				<button type="button" class="button button1" onclick="gravar()">Enviar</button>
			</div>
		</form>
	</div>
</body>
</html>