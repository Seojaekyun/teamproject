package kr.co.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.board.dto.BoardDto;
import kr.co.board.dto.DatDto;
import kr.co.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
		
	@RequestMapping("/")
	public String home() {
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page")!=null)
			page=Integer.parseInt(request.getParameter("page"));
		  
		int pstart,pend,chong;
		pstart=page/10;
		if(page%10==0)
			pstart=pstart-1;
		
		pstart=(pstart*10)+1;
		pend=pstart+9;
		
		int rec=10;
		if(request.getParameter("rec")!=null) {
			rec=Integer.parseInt(request.getParameter("rec"));
		}
		
		chong=mapper.getChong(rec);
		
		if(pend>chong)
			pend=chong;
		
		System.out.println(pstart+" "+pend+" "+chong);
		
		int index=(page-1)*10;
		ArrayList<BoardDto> list=mapper.list(index,rec);
				
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("rec",rec);
		return "/list";
		
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/writeOk")
	public String writeOk(BoardDto bdto) {
 		mapper.writeOk(bdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/rnum")
	public String rnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String rec=request.getParameter("rec");
		
		mapper.rnum(id);
		
		return "redirect:/content?id="+id+"&page="+page+"&rec="+rec;
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String rec=request.getParameter("rec");
		
 		BoardDto bdto=mapper.content(id);
		
		String imsi=bdto.getContent().replace("\r\n", "<br>");
		bdto.setContent(imsi);
		
		model.addAttribute("bdto",bdto);
		model.addAttribute("rec",rec);
		model.addAttribute("page",page);
		
		ArrayList<DatDto> dlist=mapper.dat(id);
        model.addAttribute("dlist", dlist);
		
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String rec=request.getParameter("rec");
		
 		BoardDto bdto=mapper.update(id);
		
		model.addAttribute("bdto",bdto);
		model.addAttribute("page",page);
		model.addAttribute("rec",rec);
		
		return "/update";
	}
	
	@RequestMapping("/updateOk")
	public String updateOk(BoardDto bdto,HttpServletRequest request) {
		String page=request.getParameter("page");
		String rec=request.getParameter("rec");
		
	
		if(mapper.isPwd(bdto.getId(),bdto.getPwd())) {
			mapper.updateOk(bdto);
			
			return "redirect:/content?id="+bdto.getId()+"&page="+page+"&rec="+rec;
		}
		else {
			return "redirect:/update?id="+bdto.getId()+"&page="+page+"&rec="+rec;
		}
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		int id=Integer.parseInt(request.getParameter("id"));
		String page=request.getParameter("page");
		String pwd=request.getParameter("pwd");
		String rec=request.getParameter("rec");
		
		if(mapper.isPwd(id, pwd)) {
			mapper.delete(id);
			
			return "redirect:/list?page="+page+"&rec="+rec;
		}
		else {
			return "redirect:/content?id="+id+"&page="+page+"&rec="+rec;
		}
	}
	
	@RequestMapping("/datOk")
    public String datOk(DatDto ddto, HttpServletRequest request) {
        String page=request.getParameter("page");
        String rec=request.getParameter("rec");
        
        mapper.datOk(ddto);
        
        return "redirect:/content?id="+ddto.getBid()+"&page="+page+"&rec="+rec;
    }
    
    @RequestMapping("/datUp")
    public @ResponseBody DatDto datUp(String id, HttpServletRequest request) {
    	String page=request.getParameter("page");
        String rec=request.getParameter("rec");
        
        DatDto ddto=mapper.datUp(id);
        return ddto;
    }
    
    @RequestMapping("/datupOk")
    public String datupOk(DatDto ddto, BoardDto bdto, HttpServletRequest request) {
    	String page=request.getParameter("page");
        String rec=request.getParameter("rec");
        
        if (mapper.isdatPwd(ddto.getId(), ddto.getPwd())) {
            mapper.datupOk(ddto);
            return "redirect:/content?id="+ddto.getBid()+"&page="+page+"&rec="+rec;
        }
        else {
            return "redirect:/content?err=1&id="+ddto.getBid()+"&page="+page+"&rec="+rec;	
        }
    }
    
    @RequestMapping("/datDel")
    public String datDel(DatDto ddto, BoardDto bdto, HttpServletRequest request) {
    	String page=request.getParameter("page");
        String rec=request.getParameter("rec");
        
        if (mapper.isdatPwd(ddto.getId(), ddto.getPwd())) {
            mapper.datDel(ddto);
            return "redirect:/content?id="+ddto.getBid()+"&page="+page+"&rec="+rec;
        }
        else {
            return "redirect:/content?err=1&id="+ddto.getBid()+"&page="+page+"&rec="+rec;	
        }
    }

}
