package br.com.caelum.mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrimeiraLogica implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("Exexutando a lógica");
		System.out.println("retornando o nome da página JSP...");
		return "primeira-logica.jsp";
	}
	

}
