using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GeekQuiz.Models;

namespace GeekQuiz.Controllers
{
    [Authorize]
   
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            using (var ctx = new TriviaDbContext())
            {
                ViewData["questionscount"] = ctx.TriviaQuestions.Count();
            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}