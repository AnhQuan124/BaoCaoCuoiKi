using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.Dao
{
    public class CategoryDao
    {
        NguyenAnhQuanContext db = null;

        public CategoryDao()
        {
            db = new NguyenAnhQuanContext();
        }

        public List<Category> ListAll()
        {
            return db.Categories.ToList();
        }

        public long Insert(Category entity)
        {
            db.Categories.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public bool Update(Category entity)
        {
            try
            {
                var cag = db.Categories.Find(entity.ID);
                cag.Name = entity.Name;
                cag.Description = entity.Description;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public IEnumerable<Category> ListAllPagingCag(string searchString, int page, int pageSize)
        {
            IQueryable<Category> model = db.Categories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderBy(x => x.ID);
            }
            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public Category GetById(string name)
        {
            return db.Categories.SingleOrDefault(x => x.Name == name);
        }

        public Category ViewDetail(int id)
        {
            return db.Categories.Find(id);
        }

        public bool Delete(int id)
        {
            try
            {
                var cag = db.Categories.Find(id);
                db.Categories.Remove(cag);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<Category> ListGroupId()
        {
            return db.Categories.ToList();
        }
    }
}
