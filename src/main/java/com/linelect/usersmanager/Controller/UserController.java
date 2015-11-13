package com.linelect.usersmanager.Controller;

import com.linelect.usersmanager.Model.User;
import com.linelect.usersmanager.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String list(Model model, Integer offset, Integer maxResults) {
        model.addAttribute("users", userDAO.getAll(offset, maxResults));
        model.addAttribute("count", userDAO.count());
        model.addAttribute("offset", offset);
        return "index";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        model.addAttribute("userAttribute", new User());
        return "addpage";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String add(@Valid @ModelAttribute("userAttribute") User user, BindingResult bindingResult, Model model) {

        if (!bindingResult.hasErrors()) {
            userDAO.add(user);
            model.addAttribute("userAdded", true);
        }

        return "addpage";
    }

    @RequestMapping(value = "/users/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Long id, Model model) {
        userDAO.delete(id);
        model.addAttribute("id", id);
        return "deletedpage";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value = "id", required = true) Long id, Model model) {
        model.addAttribute("userAttribute", userDAO.get(id));
        return "editpage";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public String saveEdit(@RequestParam(value = "id", required = true) Long id,
                           @Valid @ModelAttribute("userAttribute") User user,
                           BindingResult bindingResult,
                           Model model) {

        if (!bindingResult.hasErrors()) {
            user.setId(id);
            userDAO.edit(user);
            model.addAttribute("id", id);
            model.addAttribute("userEdited", true);
        }

        return "editpage";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "searchBy", required = true) String searchBy,
                         @RequestParam(value = "searchString", required = true) String searchString,
                         Model model, Integer offset, Integer maxResults) {

        List<User> usersList = userDAO.searchUsers(offset, maxResults, searchBy, searchString);
        model.addAttribute("users", usersList);
        model.addAttribute("count", userDAO.countForSearch(searchBy, searchString));
        model.addAttribute("offset", offset);
        model.addAttribute("searchBy", searchBy);
        model.addAttribute("searchString", searchString);

        return "index";
    }


}
