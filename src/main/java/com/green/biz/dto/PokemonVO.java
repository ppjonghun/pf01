package com.green.biz.dto;

import lombok.Data;

@Data
public class PokemonVO {
	private String po_seq;
	private String name;
	private int max_cp;
	private int att;
	private int def;
	private int hp;
	private String image;
	
	//타입
	private String bug;
	private String dark;
	private String dragon;
	private String electric;
	private String fairy;
	private String fighting;
	private String fire;
	private String flying;
	private String ghost;
	private String grass;
	private String ground;
	private String ice;
	private String normal;
	private String poison;
	private String psychic;
	private String rock;
	private String steel;
	private String water;
	
	private int replyCnt;
	
	private String order;
	private String keyword;
	
}
