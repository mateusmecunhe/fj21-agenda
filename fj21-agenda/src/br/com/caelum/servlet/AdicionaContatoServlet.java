package br.com.caelum.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

@WebServlet("/adicionaContato")
public class AdicionaContatoServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// buscando o write
		PrintWriter out = response.getWriter();

		// buscando os parâmetros do request
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String endereco = request.getParameter("endereco");
		String dataEmTexto = request.getParameter("dataNascimento");

		Calendar dataNascimento = null;

		// convertendo a data
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);

			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);

		} catch (ParseException e) {
			out.println("Erro na conversão da data");
			return;
		}

		// instanciando o objeto contato que receberá as informações do formulário

		Contato contato = new Contato();

		contato.setNome(nome);
		contato.setEmail(email);
		contato.setEndereco(endereco);
		contato.setDataNascimento(dataNascimento);
		
		//puxando a conexao criada pelo filtro, adicionada no request
		
		Connection connection = (Connection) request.getAttribute("conexao");

		// salvando o contato
		ContatoDao dao = new ContatoDao(connection);
		dao.adiciona(contato);
		
		//Enviando o contato salvo para a JSP contato-adicionado.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/contato-adicionado.jsp");
		rd.forward(request, response);


	}

}
