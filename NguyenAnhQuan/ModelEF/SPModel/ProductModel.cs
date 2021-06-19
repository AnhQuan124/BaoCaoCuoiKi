using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.SPModel
{
    public class ProductModel
    {
        public int ID { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "Nhập tên sản phẩm")]
        [Display(Name = "Tên sản phẩm")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Nhập đơn giá")]
        [Display(Name = "Đơn giá")]
        [DisplayFormat(DataFormatString = "{0:0,0} Đ")]
        public decimal? UnitCost { get; set; }

        [Required(ErrorMessage = "Nhập số lượng sản phẩm")]
        [Display(Name = "Số lượng")]
        public int? Quantity { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "Chọn hình ảnh sản phẩm")]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [StringLength(500)]
        [Required(ErrorMessage = "Nhập mô tả sản phẩm")]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Chọn trạng thái sản phẩm")]
        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }

        [Required]
        [Display(Name = "Danh mục sản phẩm")]
        public int? IDCategory { get; set; }
    }
}
