package com.green.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.biz.dto.BoardVO;
import com.green.biz.dto.PokemonVO;
import com.green.biz.dto.ReplyVO;
import com.green.biz.service.PokemonService;
import com.green.biz.service.ReplyService;

@Controller
public class PokemonController {

	@Autowired
	private PokemonService poService;

	@Autowired
	private ReplyService rService;

	@RequestMapping(value = "/pokedex_detail")
	public String pokedexDetailView(PokemonVO po, Model mo, String po_seq) {

		PokemonVO pokemon = poService.getPokemon(po.getPo_seq());

		ReplyVO reply = new ReplyVO();

		reply.setKind("pokedex");
		reply.setSeq(pokemon.getPo_seq());

		pokemon.setReplyCnt(rService.replyCnt(reply));
		List<ReplyVO> rList = rService.replyList(reply);
		
		if(pokemon.getPo_seq().length() > 4) {
			String formName = pokemon.getPo_seq().substring(4);
			String oName = pokemon.getName() + " (" + formName+ ")";
			pokemon.setName(oName);
		}
		
		mo.addAttribute("pokemon", pokemon);
		mo.addAttribute("replyList", rList);

		return "pokedex/pokedexDetail";
	}

	@RequestMapping(value = "/pokedex_list", method = RequestMethod.GET)
	public String pokedexListView(PokemonVO vo, Model mo) {

		vo = orderCheck(vo, mo);
		if (vo.getKeyword() != null) {
			mo.addAttribute("keyword", vo.getKeyword());
		}
		List<PokemonVO> poList = poService.pokemonList(vo);


		for (PokemonVO po : poList) {
			ReplyVO re = new ReplyVO();
			re.setKind("pokedex");
			re.setSeq(po.getPo_seq());
			po.setReplyCnt(rService.replyCnt(re));
		}
		if (vo != null) {
			mo.addAttribute("selectType", vo);
		} else {
			vo = defaultPokemonType(vo);
			mo.addAttribute("selectType", vo);
		}
		
		for (PokemonVO po : poList) {
			if(po.getPo_seq().length() > 4) {
				String formName = po.getPo_seq().substring(4);
				String oName = po.getName() + " (" + formName+ ")";
				po.setName(oName);
			}
		}
		
		mo.addAttribute("poList", poList);
		return "pokedex/pokedexList";
	}

	@RequestMapping(value = "/insert_pokemon", method = RequestMethod.GET)
	public String insertPokemonView() {
		return "pokedex/pokedexInsert";
	}

	@RequestMapping(value = "/insert_pokemon", method = RequestMethod.POST)
	public String insertPokemonAction(PokemonVO vo, @RequestParam(value = "uploadFile") MultipartFile file)
			throws IOException {
		vo = defaultPokemonType(vo);

		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			vo.setImage(fileName);
			file.transferTo(new File(
					"D:\\spring_workspace\\Jonghun\\src\\main\\webapp\\WEB-INF\\resources\\images\\pokedex\\pokemonImages\\"
							+ fileName));
		} else {
			vo.setImage("");
		}

		poService.inserPokemon(vo);
		return "redirect:pokedex_list";
	}

	@RequestMapping(value = "/po_seq_check", method = RequestMethod.GET)
	public String poSeqView(String anotherForm, String formName, String seq, Model mo) {
		PokemonVO vo = new PokemonVO();
		String str = seq;
		if(str.length()==1) {
			str = "00"+str;
		}else if(str.length()==2) {
			str = "0" + str;
		}
		
		String po_seq = str;

		if (anotherForm != null) {
			po_seq += "_" + formName;
			mo.addAttribute("formName", formName);
			mo.addAttribute("anotherForm", "checked");
		}
		
		vo = poService.getPokemon(po_seq);
		if (vo == null) {
			mo.addAttribute("message", 1);
		} else {
			mo.addAttribute("message", 0);
		}

		mo.addAttribute("seq", str);

		
		mo.addAttribute("po_seq", po_seq);

		return "pokedex/poSeqCheck";
	}

	@RequestMapping(value = "/po_seq_check", method = RequestMethod.POST)
	public String poSeqAction(String anotherForm, String formName, String seq, Model mo) {
		PokemonVO vo = new PokemonVO();
		String str = seq;
		if(str.length()==1) {
			str = "00"+str;
		}else if(str.length()==2) {
			str = "0" + str;
		}
		
		String po_seq = str;

		if (anotherForm != null) {
			po_seq += "_" + formName;
			mo.addAttribute("formName", formName);
			mo.addAttribute("anotherForm", "checked");
		}
		
		vo = poService.getPokemon(po_seq);
		if (vo == null) {
			mo.addAttribute("message", 1);
		} else {
			mo.addAttribute("message", 0);
		}

		mo.addAttribute("seq", str);		
		mo.addAttribute("po_seq", po_seq);

		return "pokedex/poSeqCheck";
	}

	@RequestMapping(value = "/update_pokemon", method = RequestMethod.GET)
	public String updatePokemonView(String po_seq, Model mo) {
		PokemonVO vo = poService.getPokemon(po_seq);
		mo.addAttribute("pokemon", vo);
		return "pokedex/pokedexUpdateForm";
	}

	@RequestMapping(value = "/update_pokemon", method = RequestMethod.POST)
	public String updatePokemonAction(PokemonVO vo, @RequestParam(value = "uploadFile") MultipartFile file)
			throws IOException {

		vo = defaultPokemonType(vo);

		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			vo.setImage(fileName);
			file.transferTo(new File(
					"D:\\spring_workspace\\Jonghun\\src\\main\\webapp\\WEB-INF\\resources\\images\\pokedex\\pokemonImages\\"
							+ fileName));
		}

		poService.updatePokemon(vo);

		return "redirect:pokedex_list";
	}

	@RequestMapping(value = "/delete_pokemon")
	public String deletePokemonAction(String po_seq) {

		poService.deletePokemon(po_seq);

		return "redirect:pokedex_list";
	}

	@RequestMapping(value = "/insert_pokedex_reply", method = RequestMethod.POST)
	public String pokedexReplyInsert(ReplyVO vo, PokemonVO pokemon) {
		rService.insertReply(vo);
		return "redirect:pokedex_detail?po_seq=" + vo.getSeq();
	}

	@RequestMapping(value = "/pokedex_reply_update")
	public String pokedexReplyUpdate(ReplyVO re, PokemonVO po) {

		rService.updateReply(re);

		return "redirect:pokedex_detail?po_seq=" + po.getPo_seq();
	}

	@RequestMapping(value = "/pokedex_reply_delete")
	public String pokedexReplyDeleteAction(ReplyVO vo, PokemonVO po) {
		rService.deleteReply(vo);
		return "redirect:pokedex_detail?po_seq=" + po.getPo_seq();
	}

	// 타입 널값 0으로
	public PokemonVO defaultPokemonType(PokemonVO vo) {

		if (vo.getBug() == null) {
			vo.setBug("0");
		}
		if (vo.getDark() == null) {
			vo.setDark("0");
		}
		if (vo.getDragon() == null) {
			vo.setDragon("0");
		}
		if (vo.getElectric() == null) {
			vo.setElectric("0");
		}
		if (vo.getFairy() == null) {
			vo.setFairy("0");
		}
		if (vo.getFighting() == null) {
			vo.setFighting("0");
		}
		if (vo.getFire() == null) {
			vo.setFire("0");
		}
		if (vo.getFlying() == null) {
			vo.setFlying("0");
		}
		if (vo.getGhost() == null) {
			vo.setGhost("0");
		}
		if (vo.getGround() == null) {
			vo.setGround("0");
		}
		if (vo.getGrass() == null) {
			vo.setGrass("0");
		}
		if (vo.getIce() == null) {
			vo.setIce("0");
		}
		if (vo.getNormal() == null) {
			vo.setNormal("0");
		}
		if (vo.getPoison() == null) {
			vo.setPoison("0");
		}
		if (vo.getPsychic() == null) {
			vo.setPsychic("0");
		}
		if (vo.getRock() == null) {
			vo.setRock("0");
		}
		if (vo.getSteel() == null) {
			vo.setSteel("0");
		}
		if (vo.getWater() == null) {
			vo.setWater("0");
		}

		return vo;
	}

	public PokemonVO orderCheck(PokemonVO vo, Model mo) {

		if (vo.getOrder() == null || vo.getOrder().equals("refresh")) {
			mo.addAttribute("order", "normal");
			vo = new PokemonVO();
			vo.setOrder("normal");
		} else if (vo.getOrder().equals("seq_desc")) {
			mo.addAttribute("order", "seq_asc");
			vo.setOrder("seq_desc");
		} else if (vo.getOrder().equals("seq_asc")) {
			mo.addAttribute("order", "seq_desc");
			vo.setOrder("seq_asc");
		} else if (vo.getOrder().equals("cp_desc")) {
			mo.addAttribute("order", "cp_asc");
			vo.setOrder("cp_desc");
		} else if (vo.getOrder().equals("cp_asc")) {
			mo.addAttribute("order", "cp_desc");
			vo.setOrder("cp_asc");
		} else if (vo.getOrder().equals("att_desc")) {
			mo.addAttribute("order", "att_asc");
			vo.setOrder("att_desc");
		} else if (vo.getOrder().equals("att_asc")) {
			mo.addAttribute("order", "att_desc");
			vo.setOrder("att_asc");
		} else if (vo.getOrder().equals("def_desc")) {
			mo.addAttribute("order", "def_asc");
			vo.setOrder("def_desc");
		} else if (vo.getOrder().equals("def_asc")) {
			mo.addAttribute("order", "def_desc");
			vo.setOrder("def_asc");
		} else if (vo.getOrder().equals("hp_desc")) {
			mo.addAttribute("order", "hp_asc");
			vo.setOrder("hp_desc");
		} else if (vo.getOrder().equals("hp_asc")) {
			mo.addAttribute("order", "hp_desc");
			vo.setOrder("hp_asc");
		}

		return vo;
	}

}
