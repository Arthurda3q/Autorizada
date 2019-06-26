package org.ja.autorizada2.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ja.autorizada2.modelo.Painel;


@WebServlet(name = "servletPainel", urlPatterns = "/servletPainel")

public class ServletPainel extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {

		String nome = request.getParameter("nome");
		String nivel = request.getParameter("nivel");
		String produto = request.getParameter("produto");
		String defeito = request.getParameter("defeito");
		String fabricante = request.getParameter("fabricante");
		String vend = request.getParameter("vend");
		String nota = request.getParameter("nota");
		String email = request.getParameter("email");
		String tell = request.getParameter("tell");
		String cep = request.getParameter("cep");
		String ende = request.getParameter("ende");
		String serie = request.getParameter("serie");
		System.out.println("Nome: " + nome);
		System.out.println("Nivel de Urgencia: " + nivel);
		System.out.println("Produto: " + produto);
		System.out.println("Defeito: " + defeito);
		System.out.println("Fabricante: " + fabricante);
		System.out.println("Vendedor: " + vend);
		System.out.println("N° Nota Fiscal: " + nota);
		System.out.println("Email: " + email);
		System.out.println("Tell: " + tell);
		System.out.println("CEP: " + cep);
		System.out.println("Endereço: " + ende);
		System.out.println("Nº de Serie: " + serie);
		
		Painel obj = new Painel();
		obj.setNome(nome);
		obj.setNivel(nivel);
		obj.setNota(nota);
		obj.setVend(vend);
		obj.setFabricante(fabricante);
		obj.setProduto(produto);
		obj.setDefeito(defeito);
		obj.setEmail(email);
		obj.setTell(tell);
		obj.setCep(cep);
		obj.setEnde(ende);
		obj.setSerie(serie);
		
		PrintWriter saida = response.getWriter();
		
		int cod = Integer.parseInt(request.getParameter("cod"));
		boolean sucesso = false;
		if (cod > 0) {
			obj.setCod(cod);
			if (request.getParameter("apagar")==null) {
				sucesso = obj.atualizar();
			}else{
				sucesso = obj.apagar();
			}
		}else {
			sucesso = obj.inserir();
		}
		
		if (sucesso) {
			saida.print("Gravado com sucesso.");
		}else {
			saida.print("Erro ao gravar.");
		}
	}

}