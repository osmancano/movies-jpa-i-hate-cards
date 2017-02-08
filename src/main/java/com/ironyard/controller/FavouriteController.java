package com.ironyard.controller;

import com.ironyard.data.Movie;
import com.ironyard.data.MovieUser;
import com.ironyard.repo.MovieRepo;
import com.ironyard.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by osmanidris on 2/7/17.
 */
@Controller
public class FavouriteController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private MovieRepo movieRepo;

    @RequestMapping(path = "/secure/favourites")
    public String listFavourites(HttpSession session,Model xyz){
        String destination = "favourites";
        MovieUser user = (MovieUser) session.getAttribute("user");
        List<Movie> favourites = user.getFavorites();
        // go to jsp
        return destination;
    }

    @RequestMapping(path = "/secure/addToFavourites", method = RequestMethod.GET)
    public String add(HttpSession session,@RequestParam Long mID){
        MovieUser user = (MovieUser) session.getAttribute("user");
        List<Movie> favourites = user.getFavorites();
        if(favourites == null){
            favourites = new ArrayList<Movie>();
        }
        boolean exists = false;
        for(int j = 0 ; j < favourites.size();j++){
            if(favourites.get(j).getId()==mID){
                exists = true;
                break;
            }
        }
        if(!exists){
            favourites.add(movieRepo.findOne(mID));
        }
        user.setFavorites(favourites);
        userRepo.save(user);
        String destinationView = "home";
        destinationView = "redirect:/secure/movies";
        return destinationView;
    }

    @RequestMapping(path = "/secure/removeFromFavourites", method = RequestMethod.GET)
    public String remove(HttpSession session,@RequestParam Long mID){
        MovieUser user = (MovieUser) session.getAttribute("user");
        List<Movie> favourites = user.getFavorites();
        for(int i = 0; i< favourites.size(); i++){
            if(favourites.get(i).getId() == mID ){
                favourites.remove(i);
                break;
            }
        }
        user.setFavorites(favourites);
        userRepo.save(user);
        String destinationView = "favourites";
        //destinationView = "redirect:/secure/movies";
        return destinationView;
    }
}
