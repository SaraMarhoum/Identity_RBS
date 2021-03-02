using Core_RBS.Data;
using Core_RBS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Core_RBS.Controllers
{
    [Authorize]
    public class StudentController : Controller
    {
        private readonly ApplicationDbContext _db;

        public StudentController(ApplicationDbContext db)
        {
            _db = db;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            //Stored procedure
            using (var context = new ApplicationDbContext())
            {
                var data = context.tablestd.FromSqlRaw("[dbo].[SelectStudents]").ToList();
                return View(data);
            }
            //var displaydata = _db.tablestd.ToList();
            //return View(displaydata);
        }

        [HttpGet]
        public async Task<IActionResult> Index(string Stdsearch)
        {
            ViewData["getstudentdetails"] = Stdsearch;
            var stdquery = from x in _db.tablestd select x;
            if (!String.IsNullOrEmpty(Stdsearch))
            {
                stdquery = stdquery.Where(x => x.nom.Contains(Stdsearch) || x.prenom.Contains(Stdsearch) || x.cin.Contains(Stdsearch));
            }
            return View(await stdquery.AsNoTracking().ToListAsync());
        }

        [Authorize(Policy = "writepolicy")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(NewSudentClass nec)
        {
            if (ModelState.IsValid)
            {
                _db.Add(nec);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(nec);
        }

        [Authorize(Policy = "writepolicy")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var getempdetails = await _db.tablestd.FindAsync(id);
            return View(getempdetails);
        }

        [HttpPost]

        public async Task<IActionResult> Edit(NewSudentClass nc)
        {
            if (ModelState.IsValid)
            {
                _db.Update(nc);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(nc);
        }

        [Authorize(Policy = "writepolicy")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var getstddetails = await _db.tablestd.FindAsync(id);
            return View(getstddetails);
        }

        [Authorize(Policy = "writepolicy")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var getstddetails = await _db.tablestd.FindAsync(id);
            return View(getstddetails);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {

            var getstddetails = await _db.tablestd.FindAsync(id);
            _db.tablestd.Remove(getstddetails);
            await _db.SaveChangesAsync();

            return RedirectToAction("Index");
        }
    }
}
