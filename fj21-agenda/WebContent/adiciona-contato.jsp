<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="banana" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adicione seu contato</title>
<link href="css/jquery.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
</head>
<body>
	<c:import url="cabecalho.jsp" />
	<h1>Adiciona contatos</h1>
	<hr />
	<form action="adicionaContato" method="POST"> 
	<!-- o action="adicionaContato" � recuperado no in�cio da classe
	 AdicionaContatoServlet-->
		Nome: <input type="text" name="nome" /><br /> 
		E-mail: <input type="text" name="email" /><br /> 
		Endere�o: <input type="text" name="endereco" /><br /> 
		Data de Nascimento: <banana:campoData id="dataNascimento"/><br /> 
		<input type="submit" value="Gravar" />
	</form>
	<c:import url="rodape.jsp" />
</body>
</html>