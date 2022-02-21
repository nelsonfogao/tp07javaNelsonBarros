package br.edu.infnet.infra;

import java.util.ArrayList;
import java.util.HashMap;

import br.edu.infnet.domain.Contato;

public class ContatoRepository {
	
	private HashMap<Integer, Contato> contatos = new HashMap<Integer, Contato>();
	
	public Contato inserir(Contato contato) {
		int id = contatos.size()+1;
		contatos.put(id, contato);
		contato.setId(id);
		return contato;
	}
	public void alterar(Contato contato) {
		Integer id = contato.getId();
		contatos.remove(id);
		contatos.put(id, contato);
	}
	public ArrayList<Contato> listar(){
		ArrayList<Contato> retorno = new ArrayList<Contato>();
		for(Object objeto: contatos.values()) {
			retorno.add((Contato)objeto);
		}
		return retorno;
	}
}
