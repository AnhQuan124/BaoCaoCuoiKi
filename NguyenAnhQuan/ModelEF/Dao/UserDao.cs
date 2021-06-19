using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList.Mvc;
using PagedList;

namespace ModelEF.Dao
{
    public class UserDao
    {
        NguyenAnhQuanContext db = null;
        public UserDao()
        {
            db = new NguyenAnhQuanContext();
        }
        public long Insert(UserAccount entity)
        {
            db.UserAccounts.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public bool Update(UserAccount entity)
        {
            try
            {
                var user = db.UserAccounts.Find(entity.ID);
                user.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = entity.Password;
                }
                user.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
            
        }

        public IEnumerable<UserAccount> ListAllPaging(string searchString,int page, int pageSize)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString)).OrderBy(x => x.ID);
            }
            return model.OrderBy(x=>x.ID).ToPagedList(page,pageSize);
        }
        public UserAccount GetById(string userName)
        {
            return db.UserAccounts.SingleOrDefault(x => x.UserName == userName);
        }

        public UserAccount ViewDetail(int id)
        {
            return db.UserAccounts.Find(id);
        }
        public int Login(string userName, string passWord)
        {
            var result = db.UserAccounts.SingleOrDefault(x => x.UserName == userName );
            if(result == null)
            {
                return 0;
            }
            else
            {
                if(result.Status == "Blocked")
                {
                    return -1;
                }
                else
                {
                    if (result.Password == passWord)
                        return 1;
                    else
                        return -2;
                }
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.UserAccounts.Find(id);
                db.UserAccounts.Remove(user);
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
