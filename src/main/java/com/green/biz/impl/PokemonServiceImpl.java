package com.green.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.dao.PokemonDAO;
import com.green.biz.dto.PokemonVO;
import com.green.biz.service.PokemonService;

@Service("PokemonService")
public class PokemonServiceImpl implements PokemonService {

	@Autowired
	PokemonDAO dao;

	@Override
	public List<PokemonVO> pokemonList(PokemonVO vo) {
		return dao.pokemonList(vo);
	}

	@Override
	public PokemonVO getPokemon(String po_seq) {
		return dao.getPokemon(po_seq);
	}

	@Override
	public void inserPokemon(PokemonVO vo) {
		dao.insertPokemon(vo);		
	}

	@Override
	public void updatePokemon(PokemonVO vo) {
		dao.updatePokemon(vo);
	}

	@Override
	public void deletePokemon(String po_seq) {
		dao.deletePokemon(po_seq);
	}

}
