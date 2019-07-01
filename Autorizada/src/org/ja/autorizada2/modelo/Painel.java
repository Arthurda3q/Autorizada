package org.ja.autorizada2.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class Painel {
	private int cod; 
	private String nome; 
	private String nivel; 
	private String nota; 
	private String vend; 
	private String fabricante; 
	private String produto; 
	private String defeito;
	private String email;
	private String tell;
	private String cep;
	private String ende;
	private String serie;
	private String chegada;
	private String saida;
	private String defeitov;
	private String nometec;
	private String codtec;
	private String status;
	
	public Painel(){
		setNome("");
		setNivel("");
		setNota("");
		setVend("");
		setFabricante("");
		setProduto("");
		setDefeito("");
		setEmail("");
		setTell("");
		setCep("");
		setEnde("");
		setSerie("");
		setChegada("");
		setCod(cod);
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getCod() {
		return cod;
	}


	public void setCod(int cod) {
		this.cod = cod;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public String getVend() {
		return vend;
	}

	public void setVend(String vend) {
		this.vend = vend;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getProduto() {
		return produto;
	}

	public void setProduto(String produto) {
		this.produto = produto;
	}

	public String getDefeito() {
		return defeito;
	}

	public void setDefeito(String defeito) {
		this.defeito = defeito;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEnde() {
		return ende;
	}

	public void setEnde(String endereco) {
		this.ende = endereco;
	}

	public String getSerie() {
		return serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

	public String getChegada() {
		return chegada;
	}

	public void setChegada(String chegada) {
		this.chegada = chegada;
	}

	public String getSaida() {
		return saida;
	}

	public void setSaida(String saida) {
		this.saida = saida;
	}

	public String getDefeitov() {
		return defeitov;
	}

	public void setDefeitov(String defeitov) {
		this.defeitov = defeitov;
	}

	public String getNometec() {
		return nometec;
	}

	public void setNometec(String nometec) {
		this.nometec = nometec;
	}

	public String getCodtec() {
		return codtec;
	}

	public void setCodtec(String codtec) {
		this.codtec = codtec;
	}

	public boolean inserir() {
		Connection conexao = new ConectarJDBC().getConectar();
		
		if (conexao != null) {
			String sql = "insert into painel_reports("
					+ "nome_empresa," +
					"email,"+
					"tell,"+ 
					"cep,"+
					"endereco,"+
					"nivel_urgencia,"+
					"n_fiscal,"+
					"vend,"+
					"fabricante,"+
					"produto,"+
					"n_serie,"+
					"defeito)" + 
					"values (?,?,?,?,?,?,?,?,?,?,?,?);";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1,nome);
				prepararSQL.setString(2,email);
				prepararSQL.setString(3,tell);
				prepararSQL.setString(4,cep);
				prepararSQL.setString(5,ende);
				prepararSQL.setString(6,nivel);
				prepararSQL.setString(7,nota);
				prepararSQL.setString(8,vend);
				prepararSQL.setString(9,fabricante);
				prepararSQL.setString(10,produto);
				prepararSQL.setString(11,serie);
				prepararSQL.setString(12,defeito);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}	
		return false;
	}
	
	public boolean colocar() {
		Connection conexao = new ConectarJDBC().getConectar();
		
		if (conexao != null) {
			String sql = "insert into painel_concluidos("
					+ "nome_empresa, email, tell, cep, endereco,"
					+ " nivel, n_fiscal, vend, fabricante,"
					+ "produto, n_serie, defeito, chegada, saida, defeito_visto, nome_tecnico, cod_tecnico) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"; //
			
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1,nome);
				prepararSQL.setString(2,email);
				prepararSQL.setString(3,tell);				
				prepararSQL.setString(4,cep);				
				prepararSQL.setString(5,ende);				
				prepararSQL.setString(6,nivel);				
				prepararSQL.setString(7,nota);				
				prepararSQL.setString(8,vend);				
				prepararSQL.setString(9,fabricante);				
				prepararSQL.setString(10,produto);				
				prepararSQL.setString(11,serie);				
				prepararSQL.setString(12,defeito);					
				prepararSQL.setString(13,chegada);				
				prepararSQL.setString(14,saida);				
				prepararSQL.setString(15,defeitov);				
				prepararSQL.setString(16,nometec);				
				prepararSQL.setString(17,codtec);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}	
		return false;
	}
	
	public boolean atualizar() {
		Connection conexao = new ConectarJDBC().getConectar();
		
		if (conexao != null) {
			String sql = "update painel_reports set" + 
					"nome_empresa," +
					"email,"+
					"tell,"+ 
					"cep,"+
					"endereco,"+
					"nivel_urgencia,"+
					"n_fiscal,"+
					"vend,"+
					"fabricante,"+
					"produto,"+
					"n_serie,"+
					"defeito)" + 
					"values (?,?,?,?,?,?,?,?,?,?,?,?);";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1,nome);
				prepararSQL.setString(2,email);
				prepararSQL.setString(3,tell);
				prepararSQL.setString(4,cep);
				prepararSQL.setString(5,ende);
				prepararSQL.setString(6,nivel);
				prepararSQL.setString(7,nota);
				prepararSQL.setString(8,vend);
				prepararSQL.setString(9,fabricante);
				prepararSQL.setString(10,produto);
				prepararSQL.setString(11,serie);
				prepararSQL.setString(12,defeito);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}	
		return false;
	}
	
	
	public boolean apagar() {
		Connection conexao = new ConectarJDBC().getConectar();
		
		if (conexao != null) {
			String sql = "delete from painel_reports where cod = ?";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setInt(1, cod);
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}	
		return false;
	}
	
	
	public List<Painel> getLista(){
		
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = 
					conexao.prepareStatement("select * from painel_reports");
			ResultSet rs = ps.executeQuery();
			
			List<Painel> lsPainel = new ArrayList<Painel>();
			
			while (rs.next()) {
				Painel p = new Painel();
				p.setCod(rs.getInt("cod"));
				p.setNome(rs.getString("nome_empresa"));//nome_da_coluna_no_banco
				p.setNivel(rs.getString("nivel_urgencia"));
				p.setProduto(rs.getString("produto"));
				p.setDefeito(rs.getString("defeito"));
				p.setFabricante(rs.getString("fabricante"));
				p.setVend(rs.getString("vend"));
				p.setNota(rs.getString("n_fiscal"));
				p.setEmail(rs.getString("email"));
				p.setTell(rs.getString("tell"));
				p.setCep(rs.getString("cep"));
				p.setEnde(rs.getString("endereco"));
				p.setSerie(rs.getString("n_serie"));
				lsPainel.add(p);
			}
			ps.close();
			conexao.close();
			return lsPainel;
		} catch (Exception e) {
		}
		return null;
	}
	
	public Painel getPainel(int cod){
		
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = 
					conexao.prepareStatement("select * from painel_reports where cod = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			
			Painel p = new Painel();
			
			while (rs.next()) {
				p.setCod(rs.getInt("cod"));
				p.setNome(rs.getString("nome_empresa"));//nome_da_coluna_no_banco
				p.setNivel(rs.getString("nivel_urgencia"));
				p.setProduto(rs.getString("produto"));
				p.setDefeito(rs.getString("defeito"));
				p.setFabricante(rs.getString("fabricante"));
				p.setVend(rs.getString("vend"));
				p.setNota(rs.getString("n_fiscal"));
				p.setEmail(rs.getString("email"));
				p.setTell(rs.getString("tell"));
				p.setCep(rs.getString("cep"));
				p.setEnde(rs.getString("endereco"));
				p.setSerie(rs.getString("n_serie"));
				
				}
			ps.close();
			conexao.close();
			return p;
		} catch (Exception e) {
		}
		return null;
	}	
	public String getCorStatus() {
		
		if (nivel.contentEquals("Sem Pressa")) {
			return "table-info";
		}
		if (nivel.contentEquals("Normal")) {
			return "table-warning";
		}
		if (nivel.contentEquals("Urgente")) {
			return "table-danger";
		}
		return "";

	}
}

