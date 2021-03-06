package com.project.tain.post.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.tain.post.model.domain.Story;
import com.project.tain.post.model.service.StoryService;
import com.project.tain.post.model.service.TimeLineService;
import com.project.tain.membermanage.model.service.mMessageServiceImpl;


@Controller
public class StoryController {
	@Autowired
	private TimeLineService tService;

	@Autowired
	private StoryService sService;
	
	@Autowired
	   private mMessageServiceImpl mMessageServiceImpl;

	@RequestMapping(value = "/writeStory", method = RequestMethod.GET)
	public ModelAndView writeStory(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("myProfile", tService.showMyProf(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("myStory", sService.showMyStory(my_name));
			mv.addObject("selectHighlight", sService.selectHighlight(my_name));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.setViewName("post/writeStory");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/stories", method = RequestMethod.GET)
	public ModelAndView stories(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("myProfile", tService.showMyProf(my_name));
			mv.addObject("showAllStory", sService.showAllStory(my_name));
			mv.addObject("showAllAStory", sService.showAllAStory());
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.setViewName("post/stories");
			System.out.println(mv);
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/eachHighlight", method = RequestMethod.GET)
	public ModelAndView selectEachHighlight(HttpServletRequest request, @RequestParam(name = "h_name") String h_name,
			@RequestParam(name = "m_id") String m_id, ModelAndView mv, Story st) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("selectEachHighlight", sService.selectEachHighlight(st));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			System.out.println(h_name);
			System.out.println(m_id);
			System.out.println(sService.selectEachHighlight(st));
			mv.setViewName("post/highlight");
			System.out.println(mv);
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/eachstory", method = RequestMethod.GET)
	public ModelAndView eachstory(HttpServletRequest request, @RequestParam(name = "id") String id, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			String my_name = (String) session.getAttribute("my_name");
			mv.addObject("myProfile", tService.showMyProf(my_name));
			mv.addObject("chkfollow", tService.chkfollow(my_name));
			mv.addObject("eachstory", sService.eachStory(id));
			mv.addObject("alarmcheck", tService.alarmcheck(my_name));
			mv.addObject("shownotice", tService.shownotice(my_name));
			mv.addObject("messagecheck", mMessageServiceImpl.readcheck(my_name));
			mv.setViewName("post/eachstory");
			System.out.println(mv);
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
		return mv;
	}

	// 작성된 글을 insert
	@RequestMapping(value = "/storyInsert.do", method = RequestMethod.POST)
	public ModelAndView storyInsert(Story st, @RequestParam(name = "upfile") MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {
			// 첨부파일 저장
			if (report != null && !report.equals("")) {
				saveFile(report, request);
			}
			st.setS_img(report.getOriginalFilename());
			sService.storyInsert(st);
			mv.setViewName("redirect:/timeLine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/insertHighlight.do", method = RequestMethod.POST)
	public ModelAndView insertHighlight(Story st, ModelAndView mv) {
		try {
			sService.insertHighlight(st);
			mv.setViewName("redirect:/writeStory");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return mv;
		}
	}

	private void removeFile(String s_img, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//uploadFiles";
		String filePath = savePath + "/" + s_img;
		try {
			System.out.println(s_img + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			File delFile = new File(filePath);
			delFile.delete();
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "//uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);

			filePath = folder + "/" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteStory.do", method = RequestMethod.POST)
	public String deleteStory(@RequestParam(name = "m_id") String m_id, @RequestParam(name = "s_img") String s_img,
			Story st, HttpServletRequest request, ModelAndView mv) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", sService.deleteStory(st));
			removeFile(s_img, request);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteHname.do", method = RequestMethod.POST)
	public String deleteHname(Story st, HttpServletRequest request, ModelAndView mv) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", sService.deleteHname(st));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteh.do", method = RequestMethod.POST)
	public String deleteh(Story st, HttpServletRequest request, ModelAndView mv) {
		JSONObject job = new JSONObject();
		try {
			job.put("ack", sService.deleteh(st));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return job.toJSONString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "storyResult.do", method = RequestMethod.POST)
	public String storyResult(Story st, ModelAndView mv) {
		JsonObject job = new JsonObject();
		try {
			List<Story> story = sService.storyResult(st);
			if (CollectionUtils.isEmpty(story) == false) {
				JsonArray jsonArr = new Gson().toJsonTree(story).getAsJsonArray();
				job.add("story", jsonArr);
			} else {
				System.out.println("empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return job.toString();
	}

}
