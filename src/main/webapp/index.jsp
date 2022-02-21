<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.infnet.domain.Contato" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuarios</title>
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script>
	$(document).ready(function(){
		$('#contatos').DataTable();
	});
</script>
</head>
	<body>
		<h1>Cadastro de Usuarios</h1>
		<table id="contatos" border="1" cellpadding="3" cellspacing="0">
			<thead>
				<tr>
					<th>Nome</th><th>Email</th><th>Telefone</th><th>Endereço</th><th>Tipo de Conta</th><th>Cpf</th><th>Razao Social</th><th>Cnpj</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<Contato> contatos = (ArrayList<Contato>) request.getAttribute("contatos");
					if(contatos != null){
						for(Contato contato: contatos){
							out.println("<tr>"
										+"<td>" + contato.getNome()+"</td>"
										+"<td>" + contato.getEmail()+"</td>"
										+"<td>" + contato.getFone()+"</td>"
										+"<td>" + contato.getEndereco()+"</td>"
										+"<td>" + contato.getTipoDeConta()+"</td>"
										+"<td>" + contato.getCpf()+"</td>"
										+"<td>" + contato.getRazaoSocial()+"</td>"
										+"<td>" + contato.getCnpj()+"</td>"
										+"</tr>");
						}
					}
		
				%>
			</tbody>
		</table>
		
		
		<form action="CadastrarContatoController" method="post">
			<table border="1" cellpadding="3" cellspacing="0">
				<tr>
					<td>Nome:</td>
					<td><input type="text" name="nome" maxlength="50" size="30" value="${contato.nome}"/></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" maxlength="15" size="15" value="${contato.email}"/></td>
				</tr>
				<tr>
					<td>Telefone:</td>
					<td><input type="text" name="fone" maxlength="15" size="15" value="${contato.fone}"/></td>
				</tr>
				<tr>
					<td>Endereço:</td>
					<td><input type="text" name="endereco" maxlength="50" size="50" value="${contato.endereco}"/></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" name="senha" maxlength="15" size="15" value="${contato.senha}"/></td>
				</tr>
				<tr>
					<td>Tipo de Conta:</td>
					<td><label class="radio-inline">
     					 	<input type="radio" name="tipoDeConta" value="Candidato" checked>Candidato
    					</label>
    					<label class="radio-inline">
      						<input type="radio" name="tipoDeConta"value="Empresa" >Empresa
    					</label>
    				</td>
				</tr>
				<tr>
					<td>Cpf:</td>
					<td><input type="text" name="cpf" maxlength="15" size="15" /></td>
				</tr>
				<tr>
					<td>Razão Social:</td>
					<td><input type="text" name="razaoSocial" maxlength="50" size="50" /></td>
				</tr>
				<tr>
					<td>Cnpj:</td>
					<td><input type="text" name="cnpj" maxlength="15" size="15" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center" > <input type="submit" value="Cadastrar" /> </td>
				</tr>
			</table>
		</form>
		<%
			String msg = (String) request.getAttribute("msg");
			if(msg != null){
				out.println("<h3 style='color:green'>" + msg + "</h3>");
			}
			ArrayList<String> erros = (ArrayList<String>) request.getAttribute("erros");
			if(erros != null){
				for (String erro : erros){
					out.println("<h3 style='color:red'>"+ erro + "</h3>");
				}
			}
		%>
	</body>
</html>