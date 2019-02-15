<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
<meta charset="UTF-8">
<title>Lista de contatos</title>
</head>
<body>
	<c:import url="cabecalho.jsp" />
	<table>
		<thead class="cabecalho-tabela">
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>E-mail</th>
				<th>Endereço</th>
				<th>Data de Nascimento</th>
				<th>Opções</th>
			</tr>
		</thead>
		

		<!-- fazendo o for para montar as linhas
a var mostra o tipo do objeto (contato) e é automaticamente "importado" para cá. O retorno de dao.getLista
(que vira dao.lista, já que o get está implícito) já é uma lista. De contatos. O classe de lista já é imporada tbm -->

		<c:forEach var="contato" items="${contatos}" varStatus="id">

			<tr class="campos-tabela">
				<td>${contato.id}</td>
				<td>${contato.nome}</td>

				<td><c:if test="${not empty contato.email}">
						<a href="mailto:${contato.email}">${contato.email}</a>
					</c:if> <c:if test="${empty contato.email }">
				E-mail não cadastrado
				</c:if></td>
				<td>${contato.endereco}</td>

				<td><fmt:formatDate value="${contato.dataNascimento.time}"
						pattern="dd/MMM/yyyy" /></td>
				<td><a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:import url="rodape.jsp" />
</body>
</html>