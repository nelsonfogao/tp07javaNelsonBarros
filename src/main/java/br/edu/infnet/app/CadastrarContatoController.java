package br.edu.infnet.app;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import br.edu.infnet.domain.Contato;
import br.edu.infnet.infra.ContatoRepository;


public class CadastrarContatoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ContatoRepository contatoRepository = new ContatoRepository();
	  public CadastrarContatoController() {

	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Contato contato = new Contato();
			contato.setNome(request.getParameter("nome"));
			contato.setEmail(request.getParameter("email"));
			contato.setFone(request.getParameter("fone"));
			contato.setEndereco(request.getParameter("endereco"));
			contato.setSenha(request.getParameter("senha"));
			contato.setTipoDeConta(request.getParameter("tipoDeConta"));
			contato.setCnpj(request.getParameter("cnpj"));
			contato.setCpf(request.getParameter("cpf"));
			contato.setRazaoSocial(request.getParameter("razaoSocial"));

			request.setAttribute("contato", contato);
			
			ArrayList<String> erros = new ArrayList<String>();
			
			if(contato.getNome().isBlank()) {
				erros.add("O campo Nome � Obrigat�rio");
			}
			if(contato.getEmail().isBlank()) {
				erros.add("O campo Email � Obrigat�rio");
			}
			if(contato.getFone().isBlank()) {
				erros.add("O campo Telefone � Obrigat�rio");
			}
			if(contato.getEndereco().isBlank()) {
				erros.add("O campo Endere�o � Obrigat�rio");
			}
			if(contato.getSenha().isBlank()) {
				erros.add("O campo Senha � Obrigat�rio");
			}
			
			if(erros.isEmpty()) {
				contatoRepository.inserir(contato);
				request.removeAttribute("contato");
				request.setAttribute("msg", "Contato cadastrado com sucesso");
			}else {
				request.setAttribute("erros", erros);
			}
			request.setAttribute("contatos", contatoRepository.listar());
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}

}
