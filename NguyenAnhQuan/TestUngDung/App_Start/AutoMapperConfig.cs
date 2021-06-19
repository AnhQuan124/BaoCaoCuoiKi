using AutoMapper;
using ModelEF.Model;
using ModelEF.SPModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestUngDung
{
    public static class AutoMapperConfig
    {
        public static IMapper Mapper { get; private set; }
        public static void Init()
        {
            var config = new MapperConfiguration(cfg =>
            {                
                cfg.CreateMap<Product, ProductModel>()
                .ReverseMap();

            });

            Mapper = config.CreateMapper();
        }
    }
}