package com.green.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.dto.PokemonVO;

@Repository
public class PokemonDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<PokemonVO> pokemonList(PokemonVO vo){
		return mybatis.selectList("PODAO.getPokemonList", vo);
	}
	
	public PokemonVO getPokemon(String po_seq) {
		return mybatis.selectOne("PODAO.getPokemon", po_seq);
	}
	
	public void insertPokemon(PokemonVO vo) {
		mybatis.insert("PODAO.insertPokemon", vo);
		mybatis.insert("PODAO.insertPokemonType", vo);
	}
	
	public void updatePokemon(PokemonVO vo) {
		mybatis.update("PODAO.updatePokemon", vo);
		mybatis.update("PODAO.updatePokemonType" ,vo);
	}
	
	public void deletePokemon(String po_seq) {
		mybatis.delete("PODAO.deletePokemonType", po_seq);
		mybatis.delete("PODAO.deletePokemon", po_seq);
		
	}
	
}
