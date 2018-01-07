using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace AdminMIS.Controllers
{
    public class DepartmentController : Controller
    {
        private AdminMISDBContext _context;

        public DepartmentController()
        {
            _context = new AdminMISDBContext()
;       }

        public ActionResult Index()
        {
            return View("Department");
        }
        
        // GET: Department
        public JsonResult Department()
        {
            return Json(_context.Departments.Where(d => d.IsActive == true).ToList(), JsonRequestBehavior.AllowGet);
        }

        // POST: Department
        public JsonResult AddDepartment(Department d)
        {
            int status = 0;
            string message = "";
            _context.Departments.Add(d);
            status = _context.SaveChanges();
            if (status == 1)
                message = "success";
            else
                message = "failed";
            return Json(new { result = message }, JsonRequestBehavior.AllowGet);
        }

        // POST: Department
        public JsonResult UpdateDepartment(Department d)
        {
            int status = 0;
            string message = "";
            _context.Entry(d).State = EntityState.Modified;
            status = _context.SaveChanges();
            if (status == 1)
                message = "success";
            else
                message = "failed";
            return Json(new { result = message }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDepartment(int id)
        {
            return Json(_context.Departments.Where(d => d.DepartmentID == id).FirstOrDefault<Department>(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeactivateDepartment(int id)
        {
            int status = 0;
            string message = "";
            Department toDeactivate = _context.Departments.Where(d => d.DepartmentID == id).FirstOrDefault<Department>();
            //update IsActive
            toDeactivate.IsActive = false;
            _context.Entry(toDeactivate).State = EntityState.Modified;
            status = _context.SaveChanges();
            if (status == 1)
                message = "success";
            else
                message = "failed";
            return Json(new { result = message }, JsonRequestBehavior.AllowGet);
        }
    }
}