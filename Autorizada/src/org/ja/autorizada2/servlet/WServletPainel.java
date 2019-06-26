package org.ja.autorizada2.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ja.autorizada2.modelo.Painel;


@WebServlet(name = "wservletPainel", urlPatterns = "/wservletPainel")

public class WServletPainel extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {

		String nome = request.getParameter("nome");
		String cep = request.getParameter("cep");
		String produto = request.getParameter("produto");
		String defeito = request.getParameter("defeito");
		String fabricante = request.getParameter("fabricante");
		String vend = request.getParameter("vend");
		String nota = request.getParameter("nota");
		String ende = request.getParameter("ende");
		String serie = request.getParameter("serie");
		String chegada = request.getParameter("chegada");
		String saida = request.getParameter("saida");
		String defeitov = request.getParameter("defeitov");
		String nometec = request.getParameter("nometec");
		String codtec = request.getParameter("codtec");
		String status = request.getParameter("status");
		String email = request.getParameter("email");
		String tell = request.getParameter("tell");
		String nivel = request.getParameter("nivel");
		System.out.println("Nome: " + nome);
		System.out.println("Produto: " + produto);
		System.out.println("Defeito: " + defeito);
		System.out.println("Fabricante: " + fabricante);
		System.out.println("Vendedor: " + vend);
		System.out.println("N° Nota Fiscal: " + nota);
		System.out.println("CEP: " + cep);
		System.out.println("Endereço: " + ende);
		System.out.println("Nº de Serie: " + serie);
		System.out.println("Chegada: " + chegada);
		System.out.println("Saida: "+ saida);
		System.out.println("Defeito Presenciado: "+ defeitov);
		System.out.println("Nome do Tecnico: "+ nometec);
		System.out.println("Cod Tecnico: "+ codtec);
		System.out.println("Status: "+ status);
		System.out.println("Email: "+ email);
		System.out.println("Tell: " + tell);
		System.out.println("Nivel: " + nivel);

		
		Painel obj = new Painel();
		obj.setNome(nome);
		obj.setCep(cep);
		obj.setNota(nota);
		obj.setVend(vend);
		obj.setFabricante(fabricante);
		obj.setProduto(produto);
		obj.setDefeito(defeito);
		obj.setEnde(ende);
		obj.setSerie(serie);
		obj.setChegada(chegada);
		obj.setSaida(saida);
		obj.setDefeitov(defeitov);
		obj.setNometec(nometec);
		obj.setCodtec(codtec);
		obj.setStatus(status);
		obj.setEmail(email);
		obj.setTell(tell);
		obj.setNivel(nivel);
		PrintWriter saidas = response.getWriter();
		
		int cod = Integer.parseInt(request.getParameter("cod"));
		boolean sucesso = obj.colocar();
		
		if (sucesso) {
			saidas.print("Gravado com sucesso.");
		}else {
			saidas.print("Erro ao gravar.");
		}
	}

}