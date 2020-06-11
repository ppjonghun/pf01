package com.green.biz.service;

import java.util.List;

import com.green.biz.dto.PokemonVO;

public interface PokemonService {
	List<PokemonVO> pokemonList(PokemonVO vo);
	PokemonVO getPokemon(String po_seq);
	void inserPokemon(PokemonVO vo);
	void updatePokemon(PokemonVO vo);
	void deletePokemon(String po_seq);
}
