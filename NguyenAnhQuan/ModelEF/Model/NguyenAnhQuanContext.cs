using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ModelEF.Model
{
    public partial class NguyenAnhQuanContext : DbContext
    {
        public NguyenAnhQuanContext()
            : base("name=NguyenAnhQuanContext")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<UserAccount> UserAccounts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.Category)
                .HasForeignKey(e => e.IDCategory);

            modelBuilder.Entity<Product>()
                .Property(e => e.UnitCost)
                .HasPrecision(18, 0);

            modelBuilder.Entity<UserAccount>()
                .Property(e => e.Password)
                .IsUnicode(false);
        }
    }
}
