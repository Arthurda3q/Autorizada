<%@page import="org.ja.autorizada2.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Grenciar - Autorizada J.A</title>
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
	<link rel="stylesheet" href="css/estilo.css">
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script	src="js/popper.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>
	<!-- Script JMask -->
	<script type="text/javascript" src="js/jquery.mask.js"></script>
	<!-- Gestor script -->
	<script type="text/javascript" src="js/gestor.js"></script>
	<script type="text/javascript" src="js/cep.js"></script>
	
	
<script type="text/javascript">
function dadosForm() {
	var dados = "";
	
	dados += "nome=" + document.getElementById("nome").value;
	dados += "&cep=" + document.getElementById("cep").value;
	dados += "&ende=" + document.getElementById("ende").value;
	dados += "&nota=" + document.getElementById("nota").value;
	dados += "&defeito=" + document.getElementById("defeito").value;
	dados += "&fabricante=" + document.getElementById("fabricante").value;
	dados += "&vend=" + document.getElementById("vend").value;
	dados += "&produto=" + document.getElementById("produto").value;
	dados += "&serie=" + document.getElementById("serie").value;
	dados += "&cod=" + document.getElementById("cod").value;
	dados += "&chegada=" + document.getElementById("chegada").value;
	dados += "&saida=" + document.getElementById("saida").value;
	dados += "&defeitov=" + document.getElementById("defeitov").value;
	dados += "&nometec=" + document.getElementById("nometec").value;
	dados += "&codtec=" + document.getElementById("codtec").value;
	//dados += "&status=" + document.getElementById("status").value;
	dados += "&email=" + document.getElementById("email").value;
	dados += "&tell=" + document.getElementById("tell").value;
	dados += "&nivel=" + document.getElementById("nivel").value;
	return dados;
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
	xhttp.open("GET", "wservletPainel?"+dadosForm(), true);
	xhttp.send();
	
}
function apagar() {
	if (confirm("Realmente deseja apagar esse registro??")) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var msg = xhttp.responseText;
				if (msg == "Gravado com sucesso") {
					document.getElementById("msg").className = "alert alert-info";
					document.getElementById("msg").innerHTML = "Informação apagada";
					document.getElementById("form").reset();
				} //else {
					//document.getElementById("msg").className = "alert alert-danger";
					//document.getElementById("msg").innerHTML = "Erro ao apagar";
				//}
			}
		};
		xhttp.open("GET", "servletPainel?" + dadosForm() + "&apagar", true);
		xhttp.send();
		window.setTimeout('novo()', 1000);
	}
}
function apagarAtualizar() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var msg = xhttp.responseText;
			       document.getElementById("msg").innerHTML = msg;
			}
		};
		if ((document.getElementById("codtec").value != "") && (document.getElementById("nometec").value != "")
				&& (document.getElementById("chegada").value != "")&& (document.getElementById("saida").value != "")){
		xhttp.open("POST", "servletPainel?" + dadosForm() + "&apagar", true);
		xhttp.send();
		gravado();
		window.setTimeout('novo()', 2000); 
		//window.setTimeout('gravado()', 100); 
		}else {
			if (document.getElementById("codtec").value == ""){
				document.getElementById("codtec").className= "form-control border border-danger";
				}
			if (document.getElementById("nometec").value == ""){
				document.getElementById("nometec").className= "form-control border border-danger";
				}
			if (document.getElementById("chegada").value == ""){
				document.getElementById("chegada").className= "form-control border border-danger";
				}
			if (document.getElementById("saida").value == ""){
				document.getElementById("saida").className= "form-control border border-danger";
				}
			document.getElementById("msg").className = "alert alert-danger";
			document.getElementById("msg").innerHTML = "Preencha os campos obrigatorios.";
		}
		
	}
	
function novo(){
	window.location.replace('Painel.jsp');
}
function act(){
	if (document.getElementById("nometec").value != ""){
		document.getElementById("nometec").className= "form-control";
		}
	if (document.getElementById("codtec").value != ""){
		document.getElementById("codtec").className= "form-control ";
		}
	if (document.getElementById("chegada").value != ""){
		document.getElementById("chegada").className= "form-control";
		}
	if (document.getElementById("saida").value != ""){
		document.getElementById("saida").className= "form-control";
		}
	document.getElementById("msg").className = "";
	document.getElementById("msg").innerHTML = "";
}
</script>	
	
	
<%
Painel painel = new Painel();
if (request.getParameter("cod") != null){
	int cod = Integer.parseInt(request.getParameter("cod"));
	painel = painel.getPainel(cod);
}
%>
	

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
<div class="container">
<font size="2">Relatório de pestação de serviços.</font>
<form id="form">
<div id="msg"></div>
<input type="hidden" value="<%out.print(painel.getCod());%>" id="cod" />
<br>
  <div class="row">
    <div class="form-group col-md-4 " >
      <label for="nome">Nome do Cliente/Empresa:</label> <input
							type="text" name="nome" 
							class="form-control"  readonly id="nome"
							placeholder="Nome do Cliente/Empresa"
							value="<%out.print(painel.getNome());%>">
							
    </div>
    	<div class="form-group col-md-2">
    <label for="loc">CEP:</label> <input name="cep"  type="text"
							class="form-control"
							id="cep" readonly placeholder="ex: 01001-000"
							value="<%out.print(painel.getCep());%>">
    </div>
    <div class="form-group col-md-4">
    <label for="loc">Endereço:</label> <input name="ende" type="text"
							class="form-control"
							id="ende" readonly placeholder="Ex:Casa/Ap:2 "
							value="<%out.print(painel.getEnde());%>">
    </div>
    <div class="form-group col-md-2">
    <label for="loc">N° Nota Fiscal:</label> <input name="nota" type="number"
							class="form-control"
							id="nota" readonly placeholder="ex: XXXXXX"
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
							id="produto" placeholder="Nome do Produto"
							value="<%out.print(painel.getProduto());%>">
    </div>
     <div class="form-group col-md-2">
    <label for="loc">N° de Serie:</label> <input name="serie" type="text"
							class="form-control"
							id="serie" placeholder="N° de Serie"
							value="<%out.print(painel.getSerie());%>">
    </div>
    <div class="form-group col-md-3">
    <label for="loc">Defeito:</label> <input name="defeito" type="text"
							class="form-control"
							id="defeito" readonly placeholder="Defeito Alegado"
							value="<%out.print(painel.getDefeito());%>">
    </div>
 <div class="form-group col-md-3">
  <label for="usr">Data da visita/Chegada:</label> <input
							type="datetime-local" class="form-control" id="chegada" 
							 name="chegada" onkeyup="act()">
</div>
	<div class="form-group col-md-2">
	<label for="usr">Saida:</label> <input
							type="time" class="form-control" id="saida" 
							name="saida" onkeyup="act()">
	</div>
	<div class="form-group col-md-3">
	<label for="usr">Defeito Apresentado:</label> <input
							type="text" class="form-control" id="defeitov" 
							name="defeitov" placeholder="Defeito presenciado">
	</div>
	<div class="form-group col-md-3">
	<label for="usr">Nome do Técnico:</label> <input
							type="text" class="form-control" id="nometec" 
							name="nometec" onkeyup="act()">
	</div>
	<div class="form-group col-md-1">
	<label for="usr">Cod:</label> <input
							type="number" class="form-control" id="codtec" 
							name="codtec" onkeyup="act()">
	</div>
    <div class="form-group col-md-1 d-none">
	<label for="usr">Email:</label> <input
							type="text" class="form-control" id="email" 
							name="email" readonly value="<%out.print(painel.getEmail());%>" >
	</div>
	 <div class="form-group col-md-3 d-none">
	<label for="usr">tell:</label> <input
							type="text" class="form-control" id="tell" 
							name="tell" readonly value="<%out.print(painel.getTell());%>" >
	</div>
   <div class="form-group col-md-1 d-none">
	<label for="usr">Urgencia:</label> <input
							type="text" class="form-control" id="nivel" 
							name="nivel" readonly value="<%out.print(painel.getNivel());%>" >
	</div>

  </div>
  <br>
  <button type="button" class="btn btn-dark" onclick="novo()" >Novo</button>
	<button type="button" class="btn btn-primary" onclick="apagarAtualizar()" >Atualizar</button>
	<button type="button" class="btn btn-danger" onclick="apagar()" >Apagar</button>
</form>
</div>
</body>
</html>