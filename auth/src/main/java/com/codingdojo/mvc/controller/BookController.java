package com.codingdojo.mvc.controller;



import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.mvc.models.Book;
import com.codingdojo.mvc.models.User;
import com.codingdojo.mvc.services.BookService;
import com.codingdojo.mvc.services.UserService;



@Controller

public class BookController {
	//dependency injection 

	@Autowired
	BookService bookService;
	@Autowired
	UserService userService;

	@GetMapping("/books")
	public String homePage(
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes
			) { 
		//if not Auth 
		if(session.getAttribute("user_id") == null) {
			redirectAttributes.addFlashAttribute("error", "you need to login/register");
			return "redirect:/";
		}
		
		Long id= (Long) session.getAttribute("user_id"); //register the session number 
		User user = userService.findUser(id);
		model.addAttribute("username",user.getUsername());//to get username
		
		List<Book> books = bookService.getAllBooks();//to get list of all boos in home page
		model.addAttribute("books",books);
		return "/books.jsp";
	}
	
	
	//create the book
	@RequestMapping("/books/new")
    public String newBook(@ModelAttribute("book") Book book ,Model model) {
        return "/new.jsp";
    }
	
	
	 //----------------------------------------------------
	// add new book
		@PostMapping(value="books/new")
		public String add(Model model, @Valid @ModelAttribute("book") Book book, 
				BindingResult result, 
				RedirectAttributes redirectAttributes,
				HttpSession session
				) {
			if (result.hasErrors()) {
				redirectAttributes.addFlashAttribute("book",book);
				redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.book",result);
				return "redirect:./new";
	        } 
			
			Long id= (Long) session.getAttribute("user_id");
			User user = userService.findUser(id);
			book.setUser(user);
			bookService.createBook(book);
	    	redirectAttributes.addFlashAttribute("success", "your shelf created successfully");
	        return "redirect:/books";
		        
			}
   
    //----------------------------------------------------
    
	//rendering information of the book in separate page 
	@RequestMapping("books/{bookId}")
	public String index(Model model,@PathVariable("bookId") Long bookId) {
		Book book=bookService.findBook(bookId);
		model.addAttribute("book", book);
		return "details.jsp";
	}
	
	 //----------------------------------------------------
	// show the edit form page 
		@RequestMapping("books/{id}/edit")
		public String edit(@PathVariable("id") Long id, Model model) {
			Optional<Book> obt= bookService.getBookById(id);
			Book book = obt.get();
			model.addAttribute("book",book);
		    return "/edit.jsp";
		}
		    
		// edit 
		@PutMapping(value="books/{id}" )
		public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("book") Book book , BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
			if (result.hasErrors()) {
				
				return "/edit.jsp";
			}else {
			bookService.updateBook(book,id);
			redirectAttributes.addFlashAttribute("success", "the shelf edited successfully");
			return "redirect:/books";
			}
		}
}
