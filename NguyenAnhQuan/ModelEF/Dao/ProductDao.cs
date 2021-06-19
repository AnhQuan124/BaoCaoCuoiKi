using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.Dao
{
    public class ProductDao
    {
        NguyenAnhQuanContext db = null;
        public ProductDao()
        {
            db = new NguyenAnhQuanContext();
        }
        public List<Product> ListAll()
        {
            return db.Products.ToList();
        }

        public Product GetByID(int? id)
        {
            return db.Products.Find(id);
        }

        public long Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public Product Find(int? id)
        {
            return db.Products.Find(id);
        }

        public bool Update(Product entity)
        {
            try
            {
                var pro = db.Products.Find(entity.ID);
                pro.Name = entity.Name;
                pro.UnitCost = entity.UnitCost;
                pro.Quantity = entity.Quantity;
                pro.Image = entity.Image;
                pro.Description = entity.Description;
                pro.Status = entity.Status;
                pro.IDCategory = entity.IDCategory;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public IEnumerable<Product> ListAllPagingPro(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString)).OrderBy(x => x.ID);
            }
            return model.OrderBy(x => x.Quantity).ThenByDescending(x=>x.UnitCost).ToPagedList(page, pageSize);
        }

        public bool Delete(int id)
        {
            try
            {
                var pro = db.Products.Find(id);
                db.Products.Remove(pro);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
